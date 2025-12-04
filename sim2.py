from collections import deque
import math
import pprint
import json

with open("f.json", "r") as f:
    data = json.load(f)

racks = data["racks"]
jigs = data["jigs"]
flights = data["flights"]
production_lines = data["production_lines"]

# On utilise pas du tout pour l'instant les trailers et les hangars
trailers_beluga = data["trailers_beluga"]
trailers_factory = data["trailers_factory"]
hangars = data["hangars"]

jigs_dict = {}
for jig_name, jig in jigs.items():
    type_ = jig["type"]
    type_info = data["jig_types"][type_]
    jigs_dict[jig_name] = {
        "name": jig_name,
        "type": type_,
        "empty": jig.get("empty", False),
        "size": type_info["size_empty"] if jig.get("empty", True) else type_info["size_loaded"]
    }


pprint.pprint(jigs_dict)
#-------------------------------------------------- Fonctions utilitaires  ---------------------------------------------------
def print_racks_state(racks):
    print("\nÉtat actuel des racks :")
    for rack in racks:
        print(f"  {rack['name']} (taille {rack['size']}): {rack['jigs']}")


def print_flight_info(flight):
    print(f"\nVol {flight['name']} :")
    print(f"  Jigs entrants (incoming) : {flight['incoming']}")
    print(f"  Types à renvoyer (outgoing) : {flight['outgoing']}")

def is_at_edge(rack, jig_name):
    return rack["jigs"] and (rack["jigs"][0] == jig_name or rack["jigs"][-1] == jig_name)

def print_production_lines(line):
    print(f"{line['name']} → {line['schedule']}")


#------------------------------------------------Définition des fonctions de coût  ---------------------------------------------------
def compute_urgency(jig_name, jigs_dict, production_lines, flights):
    """
    Retourne une valeur d'urgence : plus petite = plus urgente.
    """
    urgency = 100  # valeur par défaut élevée = non urgente

    
    for line in production_lines:
        if jig_name in line["schedule"]:
            idx = line["schedule"].index(jig_name)
            # On considère que l'urgence proportionnelle à l'indice 
            urgency = min(urgency, idx)  # plus l'indice est petit, plus c’est urgent

    
    for flight in flights:
        if jigs_dict[jig_name]["empty"]:
            jig_type = jigs_dict[jig_name]["type"]
            if jig_type in flight["outgoing"]:
                urgency = min(urgency, 5)  # 5 est une valeur arbitraire qu'on doit choisir plus finement
    

    return urgency

urgency_dict = {name: compute_urgency(name, jigs_dict, production_lines, flights) for name in jigs_dict}

print("\n--- Urgency dict ---")
pprint.pprint(urgency_dict)

# Compteur global d'opérations (mouvements, swaps, loads)
ops_count = {"moves": 0, "swaps": 0, "loads": 0, "unloads": 0}

#-------------------------------------------------- Fonction de swap   ---------------------------------------------------

def choose_rack_and_side_for_jig(jig_name, racks, urgency):
    """
    Retourne (rack_index, side) pour placer la jig.
    
    Heuristique :
    - Mettre les jigs urgentes en bord de racks accessibles.
    - Consolider dans les racks non vides si possible.
    - Éviter de bloquer d'autres jigs urgentes.
    """
    best = None
    best_score = None

    for i, rack in enumerate(racks):
        # Si le rack est plein, on ne peut pas y placer la jig
        current_load = sum(jigs_dict[j]["size"] for j in rack["jigs"])
        new_jig_size = jigs_dict[jig_name]["size"]                # taille de la nouvelle jig

        if current_load + new_jig_size > rack["size"]:
            continue  # le rack n'a pas assez de place


        # Tester les deux côtés : gauche (0) ou droite (-1)
        for side in ("left", "right"):
            # Calcul heuristique du "coût"
            # coût = nombre d'éléments déjà présents qui seraient devant la jig
            if side == "right":
                # la jig sera ajoutée à la fin
                cost = 0
                if rack["jigs"]:
                    edge = rack["jigs"][-1]  # la dernière jig existante
                    # si elle est plus urgente que la nouvelle, on la bloque -> coût
                    if urgency.get(edge, 100) < urgency.get(jig_name, 100):
                        cost += 1
            else:  # side == "left"
                cost = 0
                if rack["jigs"]:
                    edge = rack["jigs"][0]  # la première jig existante
                    # si elle est moins urgente on essaye de pas le mettre derriere elle
                    if urgency.get(edge, 100) < urgency.get(jig_name, 100):
                        cost += 1

           
            # Score final : on cherche à **minimiser le score**
            score = cost 

            # Garder le meilleur choix
            if best_score is None or score < best_score:
                best_score = score
                best = (i, side)

    return best  # peut être None si aucun rack n’a de place


def find_jig_location(racks, jig_name):
    for i, rack in enumerate(racks):
        if jig_name in rack["jigs"]:
            return i, rack["jigs"].index(jig_name) # retourne le rack et l indice à laquelle se trouve le jig
    return None, None

def move_one_edge_jig_to_target(src_rack_idx, src_side, racks, jigs_dict, urgency,  avoid_urgent=True):
    """
    Déplace une jig depuis l'extrémité src_side du rack src_rack_idx vers un autre rack.
    Retourne True si un move a été effectué, False sinon.
    
    Mise à jour : tient compte des tailles variables des jigs.
    """
    src = racks[src_rack_idx]
    if not src["jigs"]:
        return False  # rien à déplacer

    # Sélection de la jig à déplacer
    jig_to_move = src["jigs"][0] if src_side == "left" else src["jigs"][-1]
    jig_size = jigs_dict[jig_to_move]["size"]

    best_target = None
    best_score = None

    for t_idx, tr in enumerate(racks):
        if t_idx == src_rack_idx:
            continue  # ne pas déplacer dans le même rack

        # Calcul de la charge actuelle du rack cible
        current_load = sum(jigs_dict[j]["size"] for j in tr["jigs"])
        if current_load + jig_size > tr["size"]:
            continue  # pas assez de place dans ce rack

        # Calcul heuristique du coût
        score = 0
        if tr["jigs"]:
            left_edge = tr["jigs"][0]
            right_edge = tr["jigs"][-1]
            # pénaliser si on bloque des jigs plus urgentes que celle qu'on déplace
            if urgency.get(left_edge, 100) < urgency.get(jig_to_move, 100):
                score += 1
            if urgency.get(right_edge, 100) < urgency.get(jig_to_move, 100):
                score += 1
            # léger bonus si le rack n'est pas vide (favoriser consolidation)
            score -= 0.2

        # garder le meilleur score
        if best_score is None or score < best_score:
            best_score = score
            best_target = t_idx

    # Aucun rack cible disponible ?
    if best_target is None:
        return False

    # Effectuer le move
    if src_side == "left":
        src["jigs"].pop(0)
    else:
        src["jigs"].pop()

    # On ajoute la jig à la fin du rack cible (peut évoluer pour left/right)
    racks[best_target]["jigs"].append(jig_to_move)

    # Incrémenter compteur d'opérations
    ops_count["moves"] += 1
    # Pour l'incrementation voir si on compte ça comme une opération ou 2( vers trailer puis l'autre rack)
    print(f"Moved {jig_to_move} from {src['name']} ({src_side}) → {racks[best_target]['name']} (size {jig_size})")
    return True

def swap_for_production(jig_name, racks, jigs_dict, production_lines):
    """
    Assure que jig_name est accessible (is_at_edge). Si non, effectue des moves minimaux
    depuis l'extrémité la plus proche pour débloquer la jig.
    Retourne le nombre de moves réalisés.
    """
    global ops_count
    idx, pos = find_jig_location(racks, jig_name)
    if idx is None:
        return 0
    rack = racks[idx]
    # déjà accessible ?
    if is_at_edge(rack, jig_name):
        return 0
    # déterminer direction la plus proche (left distance vs right distance)
    left_dist = pos  # nombre d'éléments à retirer à gauche pour atteindre pos
    right_dist = len(rack["jigs"]) - 1 - pos
    # choisir la direction min
    if left_dist <= right_dist:
        side = "left"
        moves_needed = left_dist
    else:
        side = "right"
        moves_needed = right_dist
    print(f"\n  Swap needed for {jig_name} in {rack['name']}, performing {moves_needed} moves from {side} side")
    # effectuer moves un par un
    moved = 0

    for _ in range(moves_needed):
        ok = move_one_edge_jig_to_target(idx, side, racks, jigs_dict, urgency_dict)
        if not ok:
            # si on ne peut plus bouger (aucun rack ciblable), essayer côté opposé
            other_side = "left" if side == "right" else "right"
            ok2 = move_one_edge_jig_to_target(idx, other_side, racks, jigs_dict, urgency_dict)
            if not ok2:
                print("  WARNING: unable to perform required moves (no space), aborting swaps")
                break
            else:
                moved += 1
        else:
            moved += 1
    ops_count["swaps"] += moved
    return moved

#-------------------------------------------------- Fonctions principales  ---------------------------------------------------

def unload_full_jigs(incoming_jigs, racks, jigs_dict, production_lines, flight_outgoing, urgency_dict):
    """
    Décharger les jigs pleins en respectant l'ordre incoming_jigs.
    Placement heuristique pour minimiser futurs mouvements et maximiser racks libres.
    """
    global ops_count
    print("\nDéchargement des jigs pleins (heuristique) :")
    
    for jig_name in incoming_jigs:
        if jigs_dict[jig_name]["empty"]:
            print(f"  Attention : {jig_name} est déjà vide (normalement full) !")
        
        choice = choose_rack_and_side_for_jig(jig_name, racks, urgency_dict)
        
        if not choice:
            # pas d'espace (situation exceptionnelle) -> on force l'append sur le premier rack
            racks[0]["jigs"].append(jig_name)
            ops_count["unloads"] += 1
            print(f"  (FORCÉ) Stocké {jig_name} dans {racks[0]['name']}")
        else:
            i, side = choice
            if side == "right":
                racks[i]["jigs"].append(jig_name)
            else:
                racks[i]["jigs"].insert(0, jig_name)
            ops_count["unloads"] += 1
            print(f"  Stocké {jig_name} de taille {jigs_dict[jig_name]["size"]} dans {racks[i]['name']} côté {side}")
    
    print_racks_state(racks)



def send_jigs_to_production(racks, jigs_dict, production_lines):
    print("\n--- Envoi des jigs à la production (ordre requis et extrémités) ---")
    for line in production_lines:
        print_production_lines(line)
        remaining_schedule = []
        for jig_name in line["schedule"]:
            found = False
            # si la jig est présente mais pas accessible, on swap avant d'essayer
            idx, pos = find_jig_location(racks, jig_name)
            if idx is not None and not is_at_edge(racks[idx], jig_name):
                swap_for_production(jig_name, racks, jigs_dict, production_lines)
            # maintenant extraire si accessible
            for rack in racks:
                if jig_name in rack["jigs"] and is_at_edge(rack, jig_name):
                    rack["jigs"].remove(jig_name)
                    print(f"  Envoyé {jig_name} depuis {rack['name']} à la production ({line['name']})")
                    ops_count["loads"] += 1
                    found = True
                    break
            if not found:
                remaining_schedule.append(jig_name)
        line["schedule"] = remaining_schedule
    print_racks_state(racks)

def bring_empty_jigs_to_rack(racks, jigs_dict):
    """
    Ramener jigs vides (présumées disponibles hors racks) vers les racks.
    Heuristique: remplir racks déjà utilisés d'abord pour maximiser racks vides.
    On suppose qu'on reçoit une liste 'pool' de jigs vides à replacer (ici on infère par jigs_dict).
    """
    global ops_count
    # collecte des jigs 'empty' qui ne sont pas déjà en racks
    in_racks = set()
    for rack in racks:
        for j in rack["jigs"]:
            in_racks.add(j)
    empty_pool = [name for name,meta in jigs_dict.items() if meta["empty"] and name not in in_racks]
    if not empty_pool:
        print("\nPas de jigs vides externes à ramener.")
        return
    print("\nRamener les jigs vides aux racks (consolidation heuristic) :")
    # prefills racks non-vides d'abord
    for jig_name in empty_pool:
        placed = False
        # try non-empty racks first
        for rack in racks:
            if rack["jigs"] and len(rack["jigs"]) < rack["size"]:
                rack["jigs"].append(jig_name)
                ops_count["moves"] += 1
                placed = True
                print(f"  Placé {jig_name} dans {rack['name']} (consolidation)")
                break
        if not placed:
            # try empty racks
            for rack in racks:
                if not rack["jigs"] and len(rack["jigs"]) < rack["size"]:
                    rack["jigs"].append(jig_name)
                    ops_count["moves"] += 1
                    placed = True
                    print(f"  Placé {jig_name} dans {rack['name']} (nouveau rack)")
                    break
        if not placed:
            # force append to first rack si aucune place
            racks[0]["jigs"].append(jig_name)
            ops_count["moves"] += 1
            print(f"  (FORCÉ) Placé {jig_name} dans {racks[0]['name']}")
    print_racks_state(racks)

if __name__ == "__main__":
    # Exemple d'utilisation des fonctions définies ci-dessus
    flight = flights[0]
    print_flight_info(flight)
    print_racks_state(racks)
    
    unload_full_jigs(flight["incoming"], racks, jigs_dict, production_lines, flight["outgoing"], urgency_dict)
    
    send_jigs_to_production(racks, jigs_dict, production_lines)
    
    loaded_jigs = bring_empty_jigs_to_rack(racks, jigs_dict)
    
    bring_empty_jigs_to_rack(racks, jigs_dict)
    
    print("\n--- Compteur d'opérations ---")
    pprint.pprint(ops_count)
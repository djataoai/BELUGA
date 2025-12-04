import json

# PRENDRE EN COMPTE LA TAILLE DES JIGS AVEC LE TYPE

# Charger le fichier JSON
with open("f.json", "r") as f:
    data = json.load(f)

racks = data["racks"]
jigs = data["jigs"]
flights = data["flights"]
production_lines = data["production_lines"]

# --- Fonctions d'affichage--- #

def print_racks_state(racks):
    print("\nÉtat actuel des racks :")
    for rack in racks:
        print(f"  {rack['name']} (taille {rack['size']}): {rack['jigs']}")


def print_flight_info(flight):
    print(f"\nVol {flight['name']} :")
    print(f"  Jigs entrants (incoming) : {flight['incoming']}")
    print(f"  Types à renvoyer (outgoing) : {flight['outgoing']}")


def print_production_lines(line):
    print(f"{line['name']} → {line['schedule']}")




#-------------------------------------------------------------------


def is_at_edge(rack, jig_name):
    return rack["jigs"] and (rack["jigs"][0] == jig_name or rack["jigs"][-1] == jig_name)

def unload_full_jigs(incoming_jigs, racks, jigs_dict):
    """
    Décharger les jigs pleins arrivant avec le vol et les stocker dans les racks.
    """
    print("\nDéchargement des jigs pleins :")
    for jig_name in incoming_jigs:
        if jigs_dict[jig_name]["empty"]:
            print(f"  Attention : {jig_name} est déjà vide (normalement full) !")
        for rack in racks:
            if len(rack["jigs"]) < rack["size"]:
                rack["jigs"].append(jig_name)
                print(f"  Stocké {jig_name} dans {rack['name']} (taille {rack['size']})")
                break
    print_racks_state(racks)


def send_jigs_to_production(racks, jigs_dict, production_lines):
    print("\n--- Envoi des jigs à la production (ordre requis et extrémités) ---")
    for line in production_lines:
        print_production_lines(line)
        remaining_schedule = []
        for jig_name in line["schedule"]:
            found = False
            for rack in racks:
                if jig_name in rack["jigs"] and is_at_edge(rack, jig_name):
                    rack["jigs"].remove(jig_name)
                    print(f"  Envoyé {jig_name} depuis {rack['name']} à la production ({line['name']})")
                    found = True
                    break
            if not found:
                remaining_schedule.append(jig_name)
        line["schedule"] = remaining_schedule
    print_racks_state(racks)

def load_empty_jigs_for_return(racks, jigs_dict, outgoing_types):
    """
    Charger les jigs vides depuis les racks sur le vol sortant.
    Seuls les jigs aux extrémités des racks peuvent être retirés.
    """
    print("\nChargement des jigs vides pour le vol sortant :")
    loaded_jigs = []
    for rack in racks:
        if not rack["jigs"]:
            continue
        # Vérifier uniquement les extrémités
        for idx in [0, -1]:
            if idx >= len(rack["jigs"]):
                continue
            jig_name = rack["jigs"][idx]
            jig_type = jigs_dict[jig_name]["type"]
            is_empty = jigs_dict[jig_name]["empty"]
            if is_empty and jig_type in outgoing_types:
                print(f"  Chargé {jig_name} de type {jig_type} depuis {rack['name']} (taille {rack['size']})")
                loaded_jigs.append(jig_name)
    # Retirer les jigs chargés des racks
    for jig_name in loaded_jigs:
        for rack in racks:
            if jig_name in rack["jigs"]:
                rack["jigs"].remove(jig_name)
    print_racks_state(racks)
    return loaded_jigs

def bring_empty_jigs_to_rack(racks, jigs_dict):
    """To do : ramener les jigs vide des hangars aux racks"""

def swap():
    """To do : échanger les jigs entre racks pour optimiser l'accès aux extrémités"""


# --- Exemple pour un vol --- #

flight = flights[2]  # beluga1

print(f"\n=== Traitement du vol {flight['name']} ===")
print_racks_state(racks)
print_flight_info(flight)


# Décharger les jigs pleins
unload_full_jigs(flight["incoming"], racks, jigs)

# Charger les jigs vides pour le vol retour
if flight["outgoing"]:
    loaded_jigs = load_empty_jigs_for_return(racks, jigs, flight["outgoing"])
    print(f"\nJigs chargés pour le vol sortant : {loaded_jigs}")
send_jigs_to_production(racks, jigs, production_lines)

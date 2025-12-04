import json

with open("f.json", "r") as f:
    data = json.load(f)  

# === TRAILERS (remorques) ===

# trailers_beluga : liste des remorques disponibles du côté Beluga.
# Chaque élément est un dictionnaire de la forme : { "name": <string> }
# Exemple : [ {"name": "T_B1"}, {"name": "T_B2"} ]
trailers_beluga = data["trailers_beluga"]

# trailers_factory : liste des remorques disponibles du côté usine (factory).
# Chaque élément est aussi un dictionnaire : { "name": <string> }
# Exemple : [ {"name": "T_F1"}, {"name": "T_F2"} ]
trailers_factory = data["trailers_factory"]


# === HANGARS ===

# hangars : liste des noms de hangars (chaîne de caractères).
# Exemple : [ "H1", "H2", "H3" ]
hangars = data["hangars"]


# === JIG TYPES ===

# jig_types : dictionnaire définissant les types de jigs.
# Chaque clé = nom du type de jig (string)
# Chaque valeur = dictionnaire contenant :
#   - "name": <string>
#   - "size_empty": <int> (taille quand le jig est vide)
#   - "size_loaded": <int> (taille quand le jig est chargé)
# Exemple :
# {
#   "A": {"name": "A", "size_empty": 2, "size_loaded": 3},
#   "B": {"name": "B", "size_empty": 1, "size_loaded": 2}
# }
jig_types = data["jig_types"]


# === RACKS ===

# racks : liste de racks disponibles.
# Chaque rack est un dictionnaire contenant :
#   - "name": <string>  → le nom du rack
#   - "size": <int>     → la capacité maximale du rack
#   - "jigs": <list of strings> → liste ordonnée des jigs actuellement dans le rack
# Exemple :
# [
#   {"name": "R1", "size": 6, "jigs": ["J1", "J2"]},
#   {"name": "R2", "size": 5, "jigs": []}
# ]
racks = data["racks"]


# === JIGS ===

# jigs : liste d’instances de jigs.
# Chaque jig est un dictionnaire contenant :
#   - "name": <string>   → identifiant du jig
#   - "type": <string>   → référence au type défini dans jig_types
#   - "empty": <bool>    → True si le jig est vide, False s’il contient une pièce
# Exemple :
# [
#   {"name": "J1", "type": "A", "empty": False},
#   {"name": "J2", "type": "B", "empty": True}
# ]
jigs = data["jigs"]


# === FLIGHTS ===

# flights : liste de vols Beluga planifiés.
# Chaque vol est un dictionnaire contenant :
#   - "name": <string> → identifiant du vol
#   - "incoming": <list of strings> → jigs chargés arrivant dans le Beluga
#   - "outgoing": <list of strings> → jigs vides à recharger dans le Beluga
#   - "scheduled_arrival": <float>  → heure d’arrivée prévue
# Exemple :
# [
#   {
#     "name": "Flight1",
#     "incoming": ["J1", "J3"],
#     "outgoing": ["J2"],
#     "scheduled_arrival": 8.5
#   }
# ]
flights = data["flights"]


# === PRODUCTION LINES ===

# production_lines : liste des lignes de production.
# Chaque ligne est un dictionnaire contenant :
#   - "name": <string> → nom de la ligne
#   - "schedule": <ordered list of strings> → liste ordonnée des jigs consommés
# Exemple :
# [
#   {"name": "Line1", "schedule": ["J1", "J4", "J6"]},
#   {"name": "Line2", "schedule": ["J2", "J5"]}
# ]
production_lines = data["production_lines"]

#------------------------Définition d'un état du système
from typing import List, Dict, Tuple, Optional
class State:
    def __init__(
        self,
        current_beluga: str,
        last_belugas: List[str],
        beluga_contents: List[str], #Ordered list of jigs that are currently inside the current Beluga, seen from racks' side: beluga_contents=[<list of jigs>]
        rack_contents: Dict[str, List[str]],
        trailer_load: Dict[str, Optional[str]],
        trailer_location: Dict[str, Tuple[str, Optional[str]]],
        jig_empty: Dict[str, bool],
        hangar_host: Dict[str, Optional[str]],
        production_line_deliveries: Dict[str, List[str]]
    ):
        self.current_beluga = current_beluga
        self.last_belugas = last_belugas
        self.beluga_contents = beluga_contents
        self.rack_contents = rack_contents
        self.trailer_load = trailer_load
        self.trailer_location = trailer_location
        self.jig_empty = jig_empty
        self.hangar_host = hangar_host
        self.production_line_deliveries = production_line_deliveries

    def __str__(self):
        """Affiche un état sous une forme lisible"""
        s = f"\n=== SYSTEM STATE ===\n"
        s += f"Current Beluga: {self.current_beluga}\n"
        s += f"Beluga contents: {self.beluga_contents}\n"
        s += f"Racks: {self.rack_contents}\n"
        s += f"Trailers load: {self.trailer_load}\n"
        s += f"Trailers location: {self.trailer_location}\n"
        s += f"Jigs empty: {self.jig_empty}\n"
        s += f"Hangars: {self.hangar_host}\n"
        s += f"Production deliveries: {self.production_line_deliveries}\n"
        return s
    # ---------------------
    # ⚙️ ACTIONS PRINCIPALES
    # ---------------------

    def load_beluga(self, j, b, t):
        """Décharger le jig j du trailer t et le charger sur le Beluga b."""
        if self.trailer_load.get(t) != j:
            raise ValueError(f"❌ Trailer {t} ne transporte pas {j}.")
        if self.current_beluga != b:
            raise ValueError(f"❌ Beluga actif est {self.current_beluga}, pas {b}.")
        
        self.beluga_contents.append(j)
        self.trailer_load[t] = None
        print(f"✅ {j} transféré de {t} vers Beluga {b}.")

    def unload_beluga(self, j, b, t):
        """Décharger le jig j du Beluga b et le charger sur le trailer t."""
        if j not in self.beluga_contents:
            raise ValueError(f"❌ {j} n’est pas dans Beluga {b}.")
        if self.trailer_load.get(t) is not None:
            raise ValueError(f"❌ Le trailer {t} n’est pas vide.")
        
        self.beluga_contents.remove(j)
        self.trailer_load[t] = j
        print(f"✅ {j} transféré de Beluga {b} vers trailer {t}.")

    def get_from_hangar(self, j, h, t):
        """Charger le jig j du hangar h sur le trailer t."""
        if self.hangar_host.get(h) != j:
            raise ValueError(f"❌ {j} n’est pas dans le hangar {h}.")
        if self.trailer_load.get(t) is not None:
            raise ValueError(f"❌ Le trailer {t} n’est pas vide.")
        
        self.hangar_host[h] = None
        self.trailer_load[t] = j
        print(f"✅ {j} récupéré du hangar {h} vers trailer {t}.")

    def deliver_to_hangar(self, j, h, t, pl):
        """Livrer le jig j actuellement sur le trailer t à la ligne de production pl, via le hangar h."""
        if self.trailer_load.get(t) != j:
            raise ValueError(f"❌ {t} ne transporte pas {j}.")
        if self.hangar_host.get(h) is not None:
            raise ValueError(f"❌ Hangar {h} déjà occupé.")
        
        self.trailer_load[t] = None
        self.hangar_host[h] = j
        self.production_line_deliveries[pl].append(j)
        self.jig_empty[j] = True  # le jig devient vide après livraison
        print(f"✅ {j} livré à la production {pl} via hangar {h}.")

    def put_down_rack(self, j, t, r, s):
        """Déposer le jig j transporté par t à l’extrémité du rack r (côté s)."""
        if self.trailer_load.get(t) != j:
            raise ValueError(f"❌ {t} ne transporte pas {j}.")
        
        # selon le côté, insérer au début ou à la fin
        if s == "beluga":
            self.rack_contents[r].insert(0, j)
        elif s == "factory":
            self.rack_contents[r].append(j)
        else:
            raise ValueError("❌ Côté inconnu : utiliser 'beluga' ou 'factory'.")
        
        self.trailer_load[t] = None
        print(f"✅ {j} déposé sur rack {r} côté {s}.")

    def pick_up_rack(self, j, t, r, s):
        """Prendre le jig j au bord du rack r (côté s) et le charger sur trailer t."""
        if self.trailer_load.get(t) is not None:
            raise ValueError(f"❌ Trailer {t} non vide.")
        if not self.rack_contents[r]:
            raise ValueError(f"❌ Rack {r} vide.")

        # vérifier que j est bien à l’extrémité
        if s == "beluga" and self.rack_contents[r][0] == j:
            self.rack_contents[r].pop(0)
        elif s == "factory" and self.rack_contents[r][-1] == j:
            self.rack_contents[r].pop(-1)
        else:
            raise ValueError(f"❌ {j} n’est pas à l’extrémité {s} du rack {r}.")
        
        self.trailer_load[t] = j
        print(f"✅ {j} pris du rack {r} côté {s} vers trailer {t}.")

    def switch_to_next_beluga(self, next_beluga):
        """Passer au vol Beluga suivant (suppose que les opérations du précédent sont terminées)."""
        self.last_belugas.append(self.current_beluga)
        self.current_beluga = next_beluga
        self.beluga_contents = []
        print(f"✈️ Passage au Beluga suivant : {next_beluga}.")


def create_initial_state(data):
    # 1️⃣ Sélectionner le premier vol Beluga comme vol courant
    current_beluga = data["flights"][0]["name"] if data["flights"] else "None"
    last_belugas = []
    beluga_contents = []  # au début, vide

    # 2️⃣ Construire le contenu des racks (directement depuis le JSON)
    rack_contents = {r["name"]: r["jigs"] for r in data["racks"]}

    # 3️⃣ Initialiser les remorques
    #   Par défaut : elles sont du côté beluga ou factory selon leur liste
    #   et vides ("null")
    trailer_load = {}
    trailer_location = {}

    for t in data["trailers_beluga"]:
        t_name = t["name"]
        trailer_load[t_name] = None
        trailer_location[t_name] = ("beluga", None)

    for t in data["trailers_factory"]:
        t_name = t["name"]
        trailer_load[t_name] = None
        # Exemple : on peut les placer par défaut à l’entrée du premier hangar
        trailer_location[t_name] = (data["hangars"][0], None) if data["hangars"] else ("factory", None)

    # 4️⃣ Jigs : savoir s’ils sont vides ou non
    jig_empty = {j["name"]: j["empty"] for j in data["jigs"].values()}

    # 5️⃣ Hangars : au début, tous vides
    hangar_host = {h: None for h in data["hangars"]}

    # 6️⃣ Lignes de production : rien de livré au départ
    production_line_deliveries = {pl["name"]: [] for pl in data["production_lines"]}

    # 7️⃣ Construire l’objet State
    return State(
        current_beluga=current_beluga,
        last_belugas=last_belugas,
        beluga_contents=beluga_contents,
        rack_contents=rack_contents,
        trailer_load=trailer_load,
        trailer_location=trailer_location,
        jig_empty=jig_empty,
        hangar_host=hangar_host,
        production_line_deliveries=production_line_deliveries
    )

# Charger le JSON
import json
with open("f.json", "r") as f:
    data = json.load(f)

# Créer l'état initial à partir du fichier

state = create_initial_state(data)
print(state)
state.unload_beluga("jig0017", "beluga1", "beluga_trailer_1")
# Afficher le résultat
print(state)

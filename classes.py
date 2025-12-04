from typing import Literal, Optional, Tuple, List, Dict

# Le trailer peut être à un Beluga, un rack, ou un hangar
LocationType = Literal["beluga", "rack", "hangar"]

# Le côté n’est utilisé que pour les racks, sinon None
SideType = Optional[Literal["beluga", "factory"]]

# Type complet pour la location d’un trailer
Location = Tuple[LocationType, SideType]

class Trailer:
    def __init__(self, name: str):
        self.name = name
        self.load = None  # le jig actuellement chargé
        self.location = Location  

class Hangar:
    def __init__(self, name: str):
        self.name = name
        self.host = None  # le jig actuellement garé (ou None)

class JigType:
    def __init__(self, type_name: str, size_empty: int, size_loaded :int):
        self.type_name = type_name
        self.size_empty = size_empty  
        self.size_loaded = size_loaded 

class Jig:
    def __init__(self, name: str, jig_type: str, empty: bool = True):
        self.name = name
        self.jig_type = jig_type
        self.empty = empty
        self.location = None  # "rack", "trailer", "beluga", "hangar", "factory"
 
class Rack:
    def __init__(self, name: str):
        self.name = name
        self.contents = [] # liste de jigs actuellement dans le rack

class ProductionLine:
    def __init__(self, name: str):
        self.name = name
        self.schedule = []  # liste ordonnée de jigs à produire

class Flight:
    def __init__(self, name: str, outgoing_types: List[str]):
        self.name = name
        self.incoming_jigs = []  # jigs pleins à décharger
        self.outgoing_types = outgoing_types  # types de jigs à charger

class State:
    def __init__(self, belugas: List[Flight], jigs: List[Jig], trailers: List[Trailer],
                 racks: List[Rack], hangars: List[Hangar], production_lines: List[ProductionLine]):
        # Objets
        self.belugas: Dict[str, Flight] = {b.name: b for b in belugas}
        self.jigs: Dict[str, Jig] = {j.name: j for j in jigs}
        self.trailers: Dict[str, Trailer] = {t.name: t for t in trailers}
        self.racks: Dict[str, Rack] = {r.name: r for r in racks}
        self.hangars: Dict[str, Hangar] = {h.name: h for h in hangars}
        self.production_lines: Dict[str, ProductionLine] = {pl.name: pl for pl in production_lines}

        # États 
        self.current_beluga: Optional[str] = belugas[0].name if belugas else None
        self.last_belugas: List[str] = []
        self.beluga_contents: List[Jig] = []

        self.rack_contents: Dict[str, List[Jig]] = {r.name: r.contents for r in racks}
        self.trailer_load: Dict[str, Optional[Jig]] = {t.name: t.load for t in trailers}
        self.trailer_location: Dict[str, Location] = {t.name: t.location for t in trailers}
        self.jig_empty: Dict[str, bool] = {j.name: j.empty for j in jigs}
        self.hangar_host: Dict[str, Optional[Jig]] = {h.name: h.host for h in hangars}
        self.production_line_deliveries: Dict[str, List[Jig]] = {pl.name: [] for pl in production_lines}


    def load_beluga(self, jig_name: str, beluga_name: str, trailer_name: str):
        #unload jig jig_name from trailer trailer_name and load it onto Beluga flight b
        beluga = self.belugas[beluga_name]
        trailer = self.trailers[trailer_name]
        jig = self.jigs[jig_name]

        if trailer.load != jig:
            raise ValueError(f"❌ Trailer {trailer_name} ne transporte pas {jig_name}.")
        beluga.contents.append(jig)
        trailer.load = None
        jig.location = "beluga"
        self._update_state()
        print(f"✅ {jig_name} chargé sur Beluga {beluga_name} depuis {trailer_name}.")
    
    def unload_beluga(self, jig_name: str, beluga_name: str, trailer_name: str):
        #unload jig j from Beluga flight b and load it onto trailer t
        beluga = self.belugas[beluga_name]
        trailer = self.trailers[trailer_name]
        jig = self.jigs[jig_name]

        if jig not in beluga.contents:
            raise ValueError(f"❌ {jig_name} n’est pas dans le Beluga {beluga_name}.")
        if trailer.load is not None:
            raise ValueError(f"❌ Trailer {trailer_name} transporte déjà un jig.")
        
        beluga.contents.remove(jig)
        trailer.load = jig
        jig.location = "trailer"
        self._update_state()
        print(f"✅ {jig_name} déchargé du Beluga {beluga_name} sur {trailer_name}.")
    
    def get_from_hangar(self, jig_name: str, hangar_name: str, trailer_name: str):
        #load jig j currently located in hangar h onto trailer t
        hangar = self.hangars[hangar_name]
        trailer = self.trailers[trailer_name]
        jig = self.jigs[jig_name]

        if hangar.host != jig:
            raise ValueError(f"❌ {jig_name} n’est pas dans {hangar_name}.")
        if trailer.load is not None:
            raise ValueError(f"❌ {trailer_name} transporte déjà {trailer.load.name}.")

        trailer.load = jig
        hangar.host = None
        jig.location = "trailer"
        self._update_state()
        print(f"✅ {jig_name} chargé sur {trailer_name} depuis {hangar_name}.")
    
    def deliver_to_hangar(self, jig_name: str, hangar_name: str, trailer_name: str, production_line_name: str):
        """
        Déposer le jig depuis le trailer dans le hangar, puis l'enregistrer comme livré
        à la ligne de production (on simule la remise à la production).
        """
        trailer = self.trailers[trailer_name]
        hangar = self.hangars[hangar_name]
        pl = self.production_lines[production_line_name]
        jig = self.jigs[jig_name]

        if trailer.load != jig:
            raise ValueError(f"❌ Trailer {trailer_name} ne transporte pas {jig_name}.")
        if hangar.host is not None:
            raise ValueError(f"❌ Hangar {hangar_name} est déjà occupé par {hangar.host.name}.")

        # Étape 1: déposer temporairement dans le hangar
        hangar.host = jig
        trailer.load = None
        jig.location = "hangar"
        self._update_state()
        print(f"📦 {jig_name} déposé temporairement dans {hangar_name} depuis {trailer_name}.")

        # Étape 2: remettre à la production (on considère que la remise est immédiate)
        pl.schedule.append(jig)
        hangar.host = None
        jig.location = "production_line"
        # On considère que la pièce est remise -> jig devient vide
        jig.empty = True
        self._update_state()
        print(f"✅ {jig_name} livré à la ligne {production_line_name} via {hangar_name}.")


    def put_down_rack(self, jig_name: str, trailer_name: str, rack_name: str, side: SideType):
        #put down jig j currently loaded onto trailer t at side s' edge of rack r (j will be next at the edge of r)
        trailer = self.trailers[trailer_name]
        jig = self.jigs[jig_name]
        rack = self.racks[rack_name]

        if trailer.load != jig:
            raise ValueError(f"❌ Trailer {trailer_name} ne transporte pas {jig_name}.")
        # Ajouter à l'extrémité du rack côté demandé
        rack.contents.append(jig)
        trailer.load = None
        jig.location = "rack"
        self._update_state()
        print(f"✅ {jig_name} déposé sur {rack_name} côté {side}.")

    def pick_up_rack(self, jig_name: str, trailer_name: str, rack_name: str, side: SideType):
        #pick up jig j from side s' edge of rack r and load it onto trailer t (j must be at the edge of r)
        trailer = self.trailers[trailer_name]
        rack = self.racks[rack_name]
        jig = self.jigs[jig_name]

        if trailer.load is not None:
            raise ValueError(f"❌ Trailer {trailer_name} transporte déjà un jig.")
        if not rack.contents or (rack.contents[-1] != jig and side == "factory"):
            raise ValueError(f"❌ Jig {jig_name} n’est pas à l’extrémité {side} de {rack_name}.")

        rack.contents.remove(jig)
        trailer.load = jig
        jig.location = "trailer"
        self._update_state()
        print(f"✅ {jig_name} récupéré du rack {rack_name} côté {side}.")
    
    def switch_to_next_beluga(self):
        """
        Passe au Beluga suivant dans self.beluga_order.
        On suppose que le vol courant est complet ; on l'ajoute à last_belugas.
        """
        if not self.belugas:
            raise ValueError("❌ Aucun Beluga défini.")

        else:
            try:
                idx = self.belugas.index(self.current_beluga)
            except ValueError:
                idx = -1
            next_idx = idx + 1

        if next_idx >= len(self.belugas):
            raise ValueError("❌ Pas de Beluga suivant (déjà au dernier de la séquence).")

        prev = self.current_beluga
        if prev is not None:
            self.last_belugas.append(prev)

        self.current_beluga = self.beluga_order[next_idx]
        self._update_state()
        print(f"Passage au Beluga suivant : {self.current_beluga} (précédent: {prev}).")
    
    def _update_state(self):
        self.beluga_contents = [j for b in self.belugas.values() for j in b.contents]
        self.rack_contents = {r.name: r.contents.copy() for r in self.racks.values()}
        self.trailer_load = {t.name: t.load for t in self.trailers.values()}
        self.trailer_location = {t.name: t.location for t in self.trailers.values()}
        self.jig_empty = {j.name: j.empty for j in self.jigs.values()}
        self.hangar_host = {h.name: h.host for h in self.hangars.values()}
        self.production_line_deliveries = {pl.name: pl.schedule.copy() for pl in self.production_lines.values()}
    

import json
with open("f.json", "r") as f:
    data = json.load(f)


def state_from_json(json_data: dict) -> State:
    """
    Construit un objet State à partir d'un dictionnaire JSON.
    json_data peut provenir de json.load() ou json.loads().
    """

    # 1️⃣ Charger les Belugas
    belugas = [
        Flight(
            name=b["name"],
            contents=[jigs_dict[j] for j in b.get("contents", [])]  # rempli plus tard
        )
        for b in json_data.get("belugas", [])
    ]

    jigs = []
    for data in json_data.get("jigs", {}).values():
        print(data)
        # Renommer la clé "type" -> "jig_type"
        data = data.copy()
        data["jig_type"] = data.pop("type")
        jigs.append(Jig(**data))

    jigs_dict = {j.name: j for j in jigs}



    # Compléter les belugas.contents maintenant que jigs_dict existe
    for b_json, b in zip(json_data.get("flights", []), belugas):
        b.contents = [jigs_dict[jname] for jname in b_json.get("contents", [])]

    # 3️⃣ Trailers
    trailers = [
        Trailer(
            name=t["name"],
            load=jigs_dict.get(t["load"]) if t.get("load") else None,
            location=tuple(t["location"])
        )
        for t in json_data.get("trailers", [])
    ]

    # 4️⃣ Racks
    racks = [
        Rack(
            name=r["name"],
            contents=[jigs_dict[j] for j in r.get("contents", [])]
        )
        for r in json_data.get("racks", [])
    ]

    # 5️⃣ Hangars
    hangars = [
        Hangar(
            name=h["name"],
            host=jigs_dict.get(h["host"]) if h.get("host") else None
        )
        for h in json_data.get("hangars", [])
    ]

    # 6️⃣ Lignes de production
    production_lines = [
        ProductionLine(
            name=pl["name"],
            schedule=[jigs_dict[j] for j in pl.get("schedule", [])]
        )
        for pl in json_data.get("production_lines", [])
    ]

    # 7️⃣ Construire l’état complet
    return State(
        belugas=belugas,
        jigs=jigs,
        trailers=trailers,
        racks=racks,
        hangars=hangars,
        production_lines=production_lines
    )

state = state_from_json(data)
from __future__ import annotations
from dataclasses import dataclass, field, replace
from typing import List, Dict, Optional, Tuple, Sequence, Any
import json
import copy

# #Syntaxe 
# git checkout -b ma-nouvelle-regle-gloutonne
# git add .
# git commit -m "Implémentation de PutDownRack et mise à jour de l'heuristique"
# git push origin ma-nouvelle-regle-gloutonne

# ---------- Basic domain classes ----------

@dataclass(frozen=True)
class JigType:
    name: str
    size_empty: int
    size_loaded: int

@dataclass(frozen=True)
class Jig:
    name: str
    type: str        # name of jig type
    empty: bool

@dataclass
class Rack:
    name: str
    size: int
    jigs: List[str] = field(default_factory=list)  # ordered list, edge at index 0 or -1 (we'll treat rightmost as edge)

@dataclass
class Trailer:
    name: str
    # load is either jig name or None
    load: Optional[str] = None
    # location: "beluga" | rack name | hangar name
    location: str = "beluga"
    # parked side : "left" | "right" | None ("null")
    side: Optional[str] = None

@dataclass
class Hangar:
    name: str
    host: Optional[str] = None  # jig stored in hangar (or None)

@dataclass
class ProductionLine:
    name: str
    schedule: List[str] = field(default_factory=list)
    deliveries: List[str] = field(default_factory=list)  # delivered jigs ordered list

@dataclass
class Flight:
    name: str
    incoming: List[str] = field(default_factory=list)  # expected incoming jigs names
    outgoing: List[str] = field(default_factory=list)  # outgoing jig types (classes)


# ---------- State representation ----------

@dataclass
class State:
    # singletons / lists described in the problem statement
    current_beluga: Optional[str] = None
    last_belugas: List[str] = field(default_factory=list)
    beluga_contents: List[str] = field(default_factory=list)  # seen from racks' side (ordered)

    # mapping production line name -> ordered list of delivered jigs
    production_line_deliveries: Dict[str, List[str]] = field(default_factory=dict)
    # mapping rack name -> ordered list of jigs seen from beluga's side
    rack_contents: Dict[str, List[str]] = field(default_factory=dict)
    # mapping trailer name -> load (jig or None)
    trailer_load: Dict[str, Optional[str]] = field(default_factory=dict)
    # jig_empty map (jig name -> bool)
    jig_empty: Dict[str, bool] = field(default_factory=dict)
    # trailer location: trailer -> (location, side)
    trailer_location: Dict[str, Tuple[str, Optional[str]]] = field(default_factory=dict)
    # hangar host: hangar -> jig or None
    hangar_host: Dict[str, Optional[str]] = field(default_factory=dict)


    # auxiliary domain objects (for reference)
    flights: Dict[str, Flight] = field(default_factory=dict)
    racks: Dict[str, Rack] = field(default_factory=dict)
    trailers: Dict[str, Trailer] = field(default_factory=dict)
    hangars: Dict[str, Hangar] = field(default_factory=dict)
    production_lines: Dict[str, ProductionLine] = field(default_factory=dict)
    jigs: Dict[str, Jig] = field(default_factory=dict)
    jig_types: Dict[str, JigType] = field(default_factory=dict)

    def copy(self) -> "State":
        # deep copy for immutability of apply
        return copy.deepcopy(self)


# ---------- Actions ----------

class Action:
    name: str

    def __str__(self):
        return self.name

    def is_applicable(self, s: State) -> bool:
        raise NotImplementedError

    def apply(self, s: State) -> State:
        """Return new state after applying action. Must not modify original state."""
        raise NotImplementedError

    def to_dict(self) -> Dict[str, Any]:
        """Convert the action object to the required JSON dictionary format."""
        raise NotImplementedError


# 1) load_beluga(j, b, t) : unload jig j from trailer t and load it onto Beluga flight b
@dataclass
class LoadBeluga(Action):
    jig: str
    beluga: str
    trailer: str

    def __post_init__(self):
        self.name = f"load_beluga({self.jig},{self.beluga},{self.trailer})"

    def is_applicable(self, s: State) -> bool:
        # trailer must carry the jig, beluga must be current_beluga
        return (s.trailer_load.get(self.trailer) == self.jig) and (s.current_beluga == self.beluga)

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        # remove from trailer
        ns.trailer_load[self.trailer] = None
        # append to beluga_contents (ordered, edge is end)
        ns.beluga_contents.append(self.jig)
        # update jig empty? stays as is
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "load_beluga", "j": self.jig, "b": self.beluga, "t": self.trailer}


# 2) unload_beluga(j, b, t) : unload jig j from Beluga flight b and load it onto trailer t
@dataclass
class UnloadBeluga(Action):
    jig: str
    beluga: str
    trailer: str

    def __post_init__(self):
        self.name = f"unload_beluga({self.jig},{self.beluga},{self.trailer})"

    def is_applicable(self, s: State) -> bool:
        # jig must be in beluga_contents and current beluga matches and trailer empty & at beluga
        return (s.current_beluga == self.beluga) and (self.jig in s.beluga_contents) and (s.trailer_load.get(self.trailer) is None) and (s.trailer_location.get(self.trailer, ("beluga", None))[0] == "beluga")

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        ns.beluga_contents.remove(self.jig)
        ns.trailer_load[self.trailer] = self.jig
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "unload_beluga", "j": self.jig, "b": self.beluga, "t": self.trailer}


# 3) get_from_hanger(j, h, t) : load jig j currently located in hangar h onto trailer t
@dataclass
class GetFromHangar(Action):
    jig: str
    hangar: str
    trailer: str

    def __post_init__(self):
        self.name = f"get_from_hangar({self.jig},{self.hangar},{self.trailer})"

    def is_applicable(self, s: State) -> bool:
        return (s.hangar_host.get(self.hangar) == self.jig) and (s.trailer_load.get(self.trailer) is None)

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        ns.hangar_host[self.hangar] = None
        ns.trailer_load[self.trailer] = self.jig
        # set trailer location to hangar (maybe now moving)
        ns.trailer_location[self.trailer] = (self.hangar, None)
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "get_from_hangar", "j": self.jig, "h": self.hangar, "t": self.trailer}


# 4) deliver_to_hanger(j, h, t, pl) : deliver jig j from trailer t to production line pl using hangar h
@dataclass
class DeliverToHangar(Action):
    jig: str
    hangar: str
    trailer: str
    production_line: str

    def __post_init__(self):
        self.name = f"deliver_to_hangar({self.jig},{self.hangar},{self.trailer},{self.production_line})"

    def is_applicable(self, s: State) -> bool:
        return (s.trailer_load.get(self.trailer) == self.jig) and (s.hangar_host.get(self.hangar) in (None, self.jig))

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        # unload from trailer
        ns.trailer_load[self.trailer] = None
        # put jig in hangar temporarily (if hangar used as transfer)
        ns.hangar_host[self.hangar] = self.jig
        # then deliver to production line (append)
        ns.production_line_deliveries.setdefault(self.production_line, []).append(self.jig)

        # empty hangar (assuming immediate) -- A VERIFIEEER 
        ns.hangar_host[self.hangar] = None
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "deliver_to_hangar", "j": self.jig, "h": self.hangar, "t": self.trailer, "pl": self.production_line}


# 5) put_down_rack(j, t, r, s) : put down jig j currently loaded onto trailer t at side s' edge of rack r
@dataclass
class PutDownRack(Action):
    jig: str
    trailer: str
    rack: str
    side: str  # side string

    def __post_init__(self):
        self.name = f"put_down_rack({self.jig},{self.trailer},{self.rack},{self.side})"

    def is_applicable(self, s: State) -> bool:
        return (s.trailer_load.get(self.trailer) == self.jig) and (self.rack in s.rack_contents)

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        ns.trailer_load[self.trailer] = None

        # ATTENTION ::: edge insertion - define as append to the end for Beluga side
        ns.rack_contents[self.rack].append(self.jig)
        ns.trailer_location[self.trailer] = (self.rack, self.side)
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "put_down_rack", "j": self.jig, "t": self.trailer, "r": self.rack, "s": self.side}


# 6) pick_up_rack(j, t, r, s) : pick up jig j from side s' edge of rack r and load it onto trailer t (j must be at the edge of r)
@dataclass
class PickUpRack(Action):
    jig: str
    trailer: str
    rack: str
    side: str

    def __post_init__(self):
        self.name = f"pick_up_rack({self.jig},{self.trailer},{self.rack},{self.side})"

    def is_applicable(self, s: State) -> bool:
        # check trailer empty and jig at rack edge (we assume edge is last element)
        rack_list = s.rack_contents.get(self.rack, [])
        return (s.trailer_load.get(self.trailer) is None) and (len(rack_list) > 0 and rack_list[-1] == self.jig)

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        ns.rack_contents[self.rack].pop()  # remove edge
        ns.trailer_load[self.trailer] = self.jig
        ns.trailer_location[self.trailer] = ("beluga", None)  # assume moved to beluga
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "pick_up_rack", "j": self.jig, "t": self.trailer, "r": self.rack, "s": self.side}


# 7) switch_to_next_beluga(): next unloading/loading operations will now concern the successive Beluga flight
@dataclass
class SwitchToNextBeluga(Action):

    next_beluga: str

    def __post_init__(self):
        self.name = f"switch_to_next_beluga({self.next_beluga})"

    def is_applicable(self, s: State) -> bool:
        # always applicable if next_beluga exists in flights and different
        return self.next_beluga in s.flights and s.current_beluga != self.next_beluga

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        # move current to last_belugas (if exists)
        if ns.current_beluga:
            ns.last_belugas.append(ns.current_beluga)
        ns.current_beluga = self.next_beluga
        # clear beluga_contents for fresh flight (or load from flight incoming if desired)
        ns.beluga_contents = list(ns.flights[self.next_beluga].incoming)
        return ns

    def to_dict(self) -> Dict[str, Any]:
        return {"name": "switch_to_next_beluga"} # next_beluga is implicit


# ---------- Loader from JSON ----------

def load_instance_from_json(path: str) -> State:
    with open(path, "r") as f:
        data = json.load(f)

    s = State()

    # jig types
    for k, v in data.get("jig_types", {}).items():
        s.jig_types[k] = JigType(name=v["name"],
                                 size_empty=v["size_empty"],
                                 size_loaded=v["size_loaded"])

    # jigs
    for jname, jdef in data.get("jigs", {}).items():
        s.jigs[jname] = Jig(name=jdef["name"], type=jdef["type"], empty=jdef["empty"])
        s.jig_empty[jname] = jdef["empty"]

    # racks
    for r in data.get("racks", []):
        rack = Rack(name=r["name"], size=r["size"], jigs=list(r.get("jigs", [])))
        s.racks[rack.name] = rack
        s.rack_contents[rack.name] = list(rack.jigs)

    # trailers beluga + factory
    for t in data.get("trailers_beluga", []) + data.get("trailers_factory", []):
        trailer = Trailer(name=t["name"])
        s.trailers[trailer.name] = trailer
        s.trailer_load[trailer.name] = trailer.load
        s.trailer_location[trailer.name] = (trailer.location, trailer.side)

    # hangars
    for h in data.get("hangars", []):
        hangar = Hangar(name=h, host=None)
        s.hangars[h] = hangar
        s.hangar_host[h] = None

    # production lines
    for pl in data.get("production_lines", []):
        p = ProductionLine(name=pl["name"], schedule=list(pl.get("schedule", [])))
        s.production_lines[p.name] = p
        s.production_line_deliveries[p.name] = []

    # flights
    for fdef in data.get("flights", []):
        f = Flight(name=fdef["name"], incoming=list(fdef.get("incoming", [])), outgoing=list(fdef.get("outgoing", [])))
        s.flights[f.name] = f

    # set a default current_beluga (first in list) if exists
    flights_list = list(s.flights.keys())
    s.current_beluga = flights_list[0] if flights_list else None
    if s.current_beluga:
        s.beluga_contents = list(s.flights[s.current_beluga].incoming)

    return s


# ---------- Example heuristic stub (greedy constructive) ----------

def greedy_next_action(state: State) -> Optional[Action]:
    """
    Very simple greedy heuristic:
    - If beluga has incoming jigs that must be sent to production, pick them up using an empty trailer at beluga.
    This is only a placeholder: you will refine rules here.
    """
    # Try to pick up from beluga to trailer if any jig in beluga_contents and empty trailer at beluga
    if not state.current_beluga:
        return None

    # 1. Tenter de décharger un jig du Beluga
    for trailer_name, load in state.trailer_load.items():
        loc, _ = state.trailer_location.get(trailer_name, ("beluga", None))
        
        # Vérifie si la remorque est vide et au Beluga
        if load is None and loc == "beluga":
            if state.beluga_contents:
                # Le jig doit être à l'arête (dernier élément de la liste)
                jig = state.beluga_contents[-1]
                return UnloadBeluga(jig=jig, beluga=state.current_beluga, trailer=trailer_name)

    # 2. Tenter de changer de Beluga si le Beluga actuel est vide (et qu'il y en a un autre)
    if not state.beluga_contents:
        flights_names = list(state.flights.keys())
        try:
            current_index = flights_names.index(state.current_beluga)
            if current_index + 1 < len(flights_names):
                next_beluga_name = flights_names[current_index + 1]
                return SwitchToNextBeluga(next_beluga=next_beluga_name)
        except ValueError:
            pass  # current_beluga not found (should not happen)


    # 3. Tenter de placer un jig sur un rack (si une remorque est chargée et près d'un rack)
    # Règle gloutonne très simpliste : si une remorque est chargée, on le place sur le premier rack disponible
    for trailer_name, load in state.trailer_load.items():
        if load is not None:
            # On cherche un rack pour le stocker
            for rack_name in state.racks:
                # Assume side is "bside" for this simple logic
                return PutDownRack(jig=load, trailer=trailer_name, rack=rack_name, side="bside")

    # 4. Tenter d'enlever un jig d'un rack (et on le ramène au beluga)
    for trailer_name, load in state.trailer_load.items():
        if load is None:
            for rack_name, jigs_list in state.rack_contents.items():
                if jigs_list:
                    jig_to_pick = jigs_list[-1] # Toujours l'arête
                    return PickUpRack(jig=jig_to_pick, trailer=trailer_name, rack=rack_name, side="bside")


    # 5. Tenter de livrer à la ligne de production (via un hangar)
    for trailer_name, load in state.trailer_load.items():
        if load is not None:
            # Trouver si ce jig est requis par une ligne de production
            jig_obj = state.jigs.get(load)
            if jig_obj:
                for pl_name, pl_obj in state.production_lines.items():
                    # Vérifier si le type de jig est dans le schedule de la PL et pas encore livré (simplifié)
                    if jig_obj.type in pl_obj.schedule and load not in state.production_line_deliveries.get(pl_name, []):
                        # On cherche un hangar disponible pour la livraison
                        for hangar_name, hangar_jig in state.hangar_host.items():
                            if hangar_jig is None: # Hangar libre
                                return DeliverToHangar(jig=load, hangar=hangar_name, trailer=trailer_name, production_line=pl_name)

    
    # Sinon, aucune action trouvée
    return None


# ---------- Minimal demonstration when run as script with JSON output ----------

def print_state_summary(s: State, step: int, action: Optional[Action] = None):
    print("=" * 70)
    if action:
        print(f"**ÉTAT APRÈS ÉTAPE {step} | ACTION APPLIQUÉE: {action}**")
    else:
        print(f"**ÉTAT INITIAL (Étape {step})**")
    
    print("-" * 70)
    print(f"**Beluga Actuel**: {s.current_beluga}")
    
    # Affichage des contenus du Beluga (arête à la fin)
    beluga_contents_str = f"[..., **{s.beluga_contents[-1]}**] (Total: {len(s.beluga_contents)})" if s.beluga_contents else "[] (Total: 0)"
    print(f"Contenus Beluga: {beluga_contents_str}")
    
    # Affiche l'état de toutes les remorques
    print("\n**État des Remorques**:")
    for t_name, load in s.trailer_load.items():
        loc, side = s.trailer_location.get(t_name, ("beluga", None))
        print(f"  - **{t_name}**: Chargement: **{load if load else 'Vide'}** | Localisation: {loc}{f' ({side})' if side else ''}")

    # Affiche l'état des Racks
    print("\n**Contenus des Racks**:")
    for r_name, jigs in s.rack_contents.items():
        rack_jigs_str = f"[..., **{jigs[-1]}**] (Total: {len(jigs)})" if jigs else "[] (Total: 0)"
        print(f"  - **{r_name}**: {rack_jigs_str}")

    # Affiche l'état des Hangars
    print("\n**Hangars**:")
    for h_name, host in s.hangar_host.items():
        print(f"  - **{h_name}**: Contenu: {host if host else 'Vide'}")
    
    # Affiche les livraisons aux lignes de production (simple)
    print("\n**Livraisons Lignes de Production**:")
    for pl_name, deliveries in s.production_line_deliveries.items():
        print(f"  - **{pl_name}**: {deliveries}")


if __name__ == "__main__":
    # Assurez-vous d'avoir un fichier f.json valide pour le test
    path = "f.json" 
    try:
        s = load_instance_from_json(path)
    except FileNotFoundError:
        print(f"ERREUR: Le fichier JSON d'instance '{path}' n'a pas été trouvé. Veuillez le créer ou ajuster le chemin.")
        exit()

    MAX_STEPS = 10 
    step = 0
    plan_actions: List[Dict[str, Any]] = []

    print("--- 🚀 Démarrage de la simulation Gloutonne Séquentielle (avec génération de Plan JSON) 🚀 ---")
    
    # Affichage de l'état initial
    print_state_summary(s, step)

    while step < MAX_STEPS:
        step += 1
        action = greedy_next_action(s)
        
        if action is None:
            print(f"\n[Étape {step}] **🏁 Terminé : Aucune action gloutonne applicable trouvée.**")
            break
        
        if action.is_applicable(s):
            # Enregistrer l'action dans le plan
            plan_actions.append(action.to_dict())
            
            # Appliquer l'action pour la prochaine itération
            s = action.apply(s)
            
            # Afficher l'état après l'action
            print_state_summary(s, step, action)
        else:
            # Cela ne devrait pas se produire si greedy_next_action est bien codé
            print(f"\n[Étape {step}] ERREUR: L'action gloutonne sélectionnée **{action}** n'est pas applicable. Arrêt.")
            break

    else:
        print(f"\n--- 🛑 Simulation terminée après {MAX_STEPS} étapes (limite de pas atteinte) 🛑 ---")
    
    # --- Génération du Plan Final JSON ---
    print("\n\n" + "#" * 70)
    print("## ✅ PLAN D'ACTIONS FINAL (FORMAT JSON) ✅")
    print("#" * 70)
    
    # Utiliser indent=4 pour une meilleure lisibilité dans la console
    json_plan = json.dumps(plan_actions, indent=4)
    print(json_plan)
    
    # Écrire le plan dans un fichier pour la soumission
    output_filename = "plan_glouton.json"
    with open(output_filename, "w") as f:
        f.write(json_plan)
    
    print(f"\nPlan écrit dans le fichier : **{output_filename}**")




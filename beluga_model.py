
from __future__ import annotations
from dataclasses import dataclass, field, replace
from typing import List, Dict, Optional, Tuple, Sequence
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
    jigs: List[str] = field(default_factory=list)  # ordered list, edge at index 0 or -1 (we'll treat factory_sidemost as edge)

@dataclass
class Trailer:
    name: str
    # load is either jig name or None
    load: Optional[str] = None
    # location: "beluga" | rack name | hangar name
    location: str = "beluga"
    # parked side : "beluga_side" | "factory_side" | None ("null")
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
        return (s.current_beluga == self.beluga) and (self.jig in s.beluga_contents) and (s.trailer_load.get(self.trailer) is None) and (s.trailer_location.get(self.trailer, ("beluga", "beluga_side"))[1] == "beluga_side")

    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        ns.beluga_contents.remove(self.jig)
        ns.trailer_load[self.trailer] = self.jig
        return ns


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
        # empty hangar (assuming immediate)
        ns.hangar_host[self.hangar] = None
        return ns


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
        # edge insertion - define as append to the end for Beluga side
        if self.side == "beluga_side":
            ns.rack_contents[self.rack].insert(0, self.jig)
        elif self.side == "factory_side":
            ns.rack_contents[self.rack].append(self.jig)
        else:
            raise ValueError(f"Unknown side: {self.side}")
        ns.trailer_location[self.trailer] = (self.rack, self.side)
        return ns


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
        if self.side == "beluga_side":
            at_edge = rack_list[0] == self.jig if rack_list else False
        else:
            at_edge = rack_list[-1] == self.jig if rack_list else False
        return s.trailer_load.get(self.trailer) is None and at_edge

        
    def apply(self, s: State) -> State:
        if not self.is_applicable(s):
            raise ValueError("Action not applicable")
        ns = s.copy()
        if self.side == "beluga_side":
            ns.rack_contents[self.rack].pop(0)   # premier
        else:  # "factory_side"
            ns.rack_contents[self.rack].pop()    # dernier

        ns.trailer_load[self.trailer] = self.jig
        ns.trailer_location[self.trailer] = ("beluga", None)  # assume moved to beluga
        return ns


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


    # trailers beluga
    for t in data.get("trailers_beluga", []):
        trailer = Trailer(
            name=t["name"],
            side="beluga_side",
            location="beluga"
        )
        s.trailers[trailer.name] = trailer
        s.trailer_load[trailer.name] = trailer.load
        s.trailer_location[trailer.name] = (trailer.location, trailer.side)

    # trailers factory
    for t in data.get("trailers_factory", []):
        trailer = Trailer(
            name=t["name"],
            side="factory_side",
            location="factory"
        )
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
def compute_urgency(state: State) -> Dict[str, int]:
    """
    Calcule une priorité pour chaque jig.
    - Si une jig apparaît dans la schedule d’une ligne de production :
        urgence = 1000 - index
    - Sinon : urgence = 0
    - Outgoing ignorés comme demandé.
    """

    urgency = {jig: 0 for jig in state.jigs.keys()}

    # Parcours de toutes les lignes de production
    for pl in state.production_lines.values():
        schedule = pl.schedule

        for idx, jig in enumerate(schedule):
            # plus c'est tôt, plus c'est urgent
            urgency[jig] = max(urgency[jig], 1000 - idx)

    return urgency

def get_jig_size(state: State, jig: str) -> int:
    j = state.jigs[jig]
    jt = state.jig_types[j.type]
    return jt.size_empty if j.empty else jt.size_loaded

def find_trailer_at(state: State,  side: str, require_empty: bool=True) -> Optional[str]:
    """
    Retourne un nom de trailer situé à (location, side) et éventuellement vide.
    Si side is None, ignore side in matching.
    """
    for tr, load in state.trailer_load.items():
        _, tr_side = state.trailer_location.get(tr, (None, None))
        
        if side is not None and tr_side != side:
            continue
        if require_empty and load is not None:
            continue
        return tr
    return None

def find_rack_and_pos(state: State, jig: str) -> Tuple[Optional[str], Optional[int]]:
    for rname, contents in state.rack_contents.items():
        if jig in contents:
            return rname, contents.index(jig)
    return None, None
def find_next_beluga(state: State) -> Optional[str]:
    """
    Retourne le nom de la prochaine Beluga à utiliser, ou None si aucune.
    """
    belugas = list(state.flights.keys())
    if state.current_beluga is None:
        return belugas[0] if belugas else None
    else:
        try:
            idx = belugas.index(state.current_beluga)
            if idx + 1 < len(belugas):
                return belugas[idx + 1]
            else:
                return None
        except ValueError:
            return None

def find_best_jig_of_type(state: State, type: str, empty=True) -> Optional[str]:
    """
    Retourne le jig du type donné le plus proche de beluga_side, ou None si aucun.
    """
    best_jig = None
    best_distance = float('inf')
    
    for rname, contents in state.rack_contents.items():
        for idx, jig_name in enumerate(contents):
            jig = state.jigs[jig_name]
            if empty and not state.jig_empty.get(jig_name, True):
                continue
            if jig.type == type:
                # Distance from beluga_side edge (index 0)
                distance = idx
                if distance < best_distance:
                    best_distance = distance
                    best_jig = jig_name
    
    return best_jig


def choose_rack_for_jig(state: State, jig: str, urgency: Dict[str, int], side: str) -> Optional[str]:
    """
    Retourne le meilleur rack (nom) pour poser `jig` en respectant `side` ("beluga_side" ou "factory_side").
    Retourne None si aucun rack n'a de place.
    """
    best = (None, None)
    best_score = None
    jig_size = get_jig_size(state, jig)
    

    for rname, contents in state.rack_contents.items():
        # capacité utilisée
        used = sum(get_jig_size(state, j) for j in contents)
        cap = state.racks[rname].size
        print(f"Évaluation du rack {rname}: capacité {cap}, utilisé {used}, jig size {jig_size}")
        if used + jig_size > cap:
            print(f"Rack {rname} pas assez de place pour jig {jig}.")
            continue  # pas assez de place

        # déterminer quel edge serait bloqué par placement
        if side == "beluga_side":
            # insertion en tête, l'élément bloqué sera l'ancien beluga_side edge (index 0)
            blocked = contents[0] if contents else None
        else:  # "factory_side"
            blocked = contents[-1] if contents else None

        blocked_urg = urgency.get(blocked, -1) if blocked is not None else -1

        # score simple : urgence bloquée (on veut MINIMISER)
        score = blocked_urg

        # petit tie-breaker : favoriser consolidation (moins d'espaces libres)
        # on ajoute la proportion restante (plus petit = mieux)
        remaining = cap - used - jig_size
        score = (score, remaining)

        if best_score is None or score < best_score:
            best_score = score
            best = (rname, side)

    return best

def move_one_edge_jig_to_rack(state: State, jig: str, dest_rack: str ) -> List[Action]:
    """
    Déplace une jig située à un edge d'un rack source vers un rack destination.
    On conserve le même edge (beluga_side ou factory_side).
    Retourne une liste d'actions élémentaires, ou [] si impossible.
    """

    # Trouver où est la jig et à quel edge
    src_rack = None
    side = None

    for r, contents in state.rack_contents.items():
        if not contents:
            continue
        if contents[0] == jig:
            src_rack, side = r, "beluga_side"
            break
        if contents[-1] == jig:
            src_rack, side = r, "factory_side"
            break

    if src_rack is None:
        return []   # pas au rack ou pas à un edge

    # Trouver un trailer vide au bon emplacement du rack source
    trailer = find_trailer_at(state,  side, require_empty=True)
    if trailer is None:
        return []   # il faudrait un move trailer first

    actions = []

    # Pick-up (edge)
    pick = PickUpRack(jig=jig, trailer=trailer, rack=src_rack, side=side)
    if not pick.is_applicable(state):
        return []
    actions.append(pick)

    s_after_pick = pick.apply(state)

    # Put-down à l’autre rack → même side utilisé
    put = PutDownRack(jig=jig, trailer=trailer, rack=dest_rack, side=side)
    if not put.is_applicable(s_after_pick):
        return []
    actions.append(put)

    return actions
def send_one_edge_jig(state: State, jig: str, target: str) -> List[Action]:
    """
    Déplace une jig située à un edge d'un rack vers:
    - Beluga flight  (jig doit être empty)
    - Une production line (jig doit être full)
    """
    actions = []

    # --- Validations spécifiques ---
    is_empty = state.jig_empty.get(jig, True)

    if target == "beluga":
        if not is_empty:
            return []  # règle: jig doit être empty pour charger Beluga
    else:
        # sinon target = production
        if is_empty:
            return []  # règle: jig doit être full pour aller en production

    # --- Trouver la jig à un edge ---
    src_rack = None
    side = None
    for r, contents in state.rack_contents.items():
        if not contents:
            continue
        if contents[0] == jig:
            src_rack, side = r, "beluga_side"
            break
        if contents[-1] == jig:
            src_rack, side = r, "factory_side"
            break

    if src_rack is None:
        return []

    # --- Trouver trailer vide situé au bon side ---
    trailer = find_trailer_at(state,  side, require_empty=True)
    if trailer is None:
        return []

    # Pick
    pick = PickUpRack(jig=jig, trailer=trailer, rack=src_rack, side=side)
    if not pick.is_applicable(state):
        return []
    actions.append(pick)
    s_after_pick = pick.apply(state)

    # --- Cas 1: beluga ---
    if target == "beluga":
        b = s_after_pick.current_beluga
        load = LoadBeluga(jig=jig, beluga=b, trailer=trailer)
        
        if load.is_applicable(s_after_pick):
            actions.append(load)
            return actions
        return []

    # --- Cas 2: production ---
    if target in s_after_pick.production_lines:
        # Il faut un hangar vide pour la livraison
        hangar = None
        for h, host in s_after_pick.hangar_host.items():
            if host is None:
                hangar = h
                break
        if hangar is None:
            return []

        deliver = DeliverToHangar(jig=jig, hangar=hangar, trailer=trailer, production_line=target)
        if deliver.is_applicable(s_after_pick):
            actions.append(deliver)
            return actions
        return []

    return []

def unload_jig_from_beluga(state: State, jig: str) -> List[Action]:
    """
    Décharge une jig de la Beluga actuelle vers un trailer vide au même côté.
    Retourne la liste des actions applicables (Pick + LoadBeluga).
    """
    actions = []

    # Vérifier que la jig est dans la Beluga
    if jig not in state.beluga_contents:
        print("La jig n'est pas dans le beluga")
        return []

 # Chercher un trailer vide coté Beluga
    trailer = None
    
    
    for tr_name, load in state.trailer_load.items():
        # Utiliser ("beluga", None) comme fallback si le trailer n'a pas de location/side dans trailer_location
        loc, side = state.trailer_location.get(tr_name, ("beluga", None)) 
        
        
        # Conditions originales pour le déchargement (doivent être vérifiées) :
        is_empty = (load is None)
        is_at_beluga = (loc == "beluga")
        
        # Votre code initial vérifiait uniquement le side et s'arrêtait immédiatement
        if side == "beluga_side":
            
            trailer = tr_name
            break # Arrêt immédiat dès le premier trailer avec side='beluga_side', même s'il est chargé ou ailleurs.
        
   
    
    if trailer is None:
        print("Pas de trailer vide côté Beluga")
        return []  # pas de trailer vide disponible

    # Créer action de déchargement
    unload = UnloadBeluga(jig=jig, beluga=state.current_beluga, trailer=trailer)
    if unload.is_applicable(state):
        
        state_int = unload.apply(state)
        actions.append(unload)
    else :
        print("Action UnloadBeluga NON applicable. \n")
        return []
        
    rname, side= choose_rack_for_jig(state, jig, compute_urgency(state), "beluga_side")
    trailer = find_trailer_at(state, side, require_empty=True)

    load = PutDownRack(jig=jig, trailer=trailer, rack=rname, side=side)
    if load.is_applicable(state_int):
        
        actions.append(load)
        return actions
    else :
        print("Action PutDownRack NON applicable. \n")  
        

    return []


def swap(state: State, rack_name: str, jig_to_free: str, side: str, urgency: Dict[str, int]) -> List[Action]:
    """
    Libère jig_to_free dans rack rack_name en déplaçant toutes les jigs devant elle
    dans la direction side (beluga_side ou factory_side).
    
    Retourne la liste des Actions générées.
    """
    actions: List[Action] = []
    rack_contents = state.rack_contents[rack_name]
    
    # Déterminer les jigs devant jig_to_free selon le side
    if side == "beluga_side":
        idx_jig = rack_contents.index(jig_to_free)
        jigs_a_deplacer = rack_contents[:idx_jig]  # tout ce qui est avant
    else:  # "factory_side"
        idx_jig = rack_contents.index(jig_to_free)
        jigs_a_deplacer = rack_contents[idx_jig + 1:]  # tout ce qui est après
        jigs_a_deplacer.reverse()  # pour déplacer dans l'ordre correct

    # Déplacer chaque jig devant jig_to_free
    for jig in jigs_a_deplacer:
        # 1) choisir un rack temporaire pour cette jig
        target_rack, target_side = choose_rack_for_jig(state, jig, urgency, side)
        if target_rack is None:
            raise ValueError(f"Aucun rack disponible pour déplacer la jig {jig}")

        # 2) déplacer la jig vers le rack choisi
        action = move_one_edge_jig_to_rack(state, jig, target_rack)
        if action is None:
            raise ValueError(f"Impossible de déplacer la jig {jig} depuis {rack_name} vers {target_rack}")
        
        # 3) appliquer l'action sur le state
        for act in action:
            state = act.apply(state)
            actions.append(act)
    # Maintenant jig_to_free est à l'edge, on peut la manipuler
    return actions
def send_empty_jig_to_beluga(state: State, jig: str, beluga_name: str) -> List[Action]:
    """
    Envoie une jig vide (empty) de son rack vers un Beluga.
    Retourne la liste des actions élémentaires, ou [] si impossible.
    """
    actions = []

    # 1) Trouver le rack où se trouve la jig
    rname, pos = find_rack_and_pos(state, jig)
    if rname is None:
        return []

    side = "beluga_side"

    # 2) Trouver un trailer vide au bon side
    trailer_name = find_trailer_at(state, side=side, require_empty=True)
    if trailer_name is None:
        return []

    # 3) Vérifier si la jig est en bord de rack
    at_edge = (state.rack_contents[rname][0] == jig)

    # Si non : swap pour libérer la jig
    if not at_edge:
        swap_actions = swap(state, rname, jig, side, compute_urgency(state))
        if not swap_actions:
            return []
        for act in swap_actions:
            state = act.apply(state)
            actions.append(act)

    # 4) PickUpRack
    pick = PickUpRack(jig=jig, trailer=trailer_name, rack=rname, side=side)
    if not pick.is_applicable(state):
        return []
    state = pick.apply(state)
    actions.append(pick)

    # 5) LoadBeluga
    load = LoadBeluga(jig=jig, beluga=beluga_name, trailer=trailer_name)
    if not load.is_applicable(state):
        return []
    state = load.apply(state)
    actions.append(load)

    return actions


@dataclass
class MacroAction(Action):
    actions: List[Action]          # liste des actions internes
    internal_action_count: int     # nombre d'actions atomiques
    swap_penalty: float = 0.0      # optionnel
    name: str = ""

    def __post_init__(self):
        if not self.name:
            self.name = f"macro({','.join(a.name for a in self.actions)})"

    def is_applicable(self, s: State) -> bool:
        # une macro action est applicable si TOUTES les actions internes le sont
        return all(a.is_applicable(s) for a in self.actions)

    def apply(self, s: State) -> State:
        print("Applying MacroAction:", self.name)
        ns = s
        for a in self.actions:
            ns = a.apply(ns)
        return ns


def wrap_macro(actions: List[Action], swap_penalty: float = 0.0, name: str = "") -> MacroAction:
    return MacroAction(
        actions=actions,
        internal_action_count=len(actions),
        swap_penalty=swap_penalty,
        name=name
    )


def evaluate_macro_action(state: State, macro_action) -> float:
    """
    Évalue une macroaction entière (un choix glouton possible).
    Le score doit être MINIMAL pour être choisi.

    Paramètres
    ----------
    state : State
        État courant du système.
    macro_action : objet MacroAction
        Contient :
          - macro_action.actions       (liste d'actions atomiques)
          - macro_action.base_priority
          - macro_action.swap_penalty
          - macro_action.name
    """

    # ----- 1) Coût interne -----
    internal_ops = getattr(macro_action, "internal_action_count", 0)
    swap_penalty = getattr(macro_action, "swap_penalty", 0.0)

    internal_cost = internal_ops + swap_penalty

    # ----- 2) Priorité métier -----
    # Plus base_priority est négatif → plus l'action est prioritaire
    

    # ----- 3) Score final glouton -----
    score = internal_cost 

    return score
def empty_jig(state: State, jig: str) -> bool:
    return state.jig_empty.get(jig, True)
def bring_jig_to_rack(state: State, jig: str, urgency: Dict[str, int]) -> List[Action]:
    """
    Amène une jig d'un hangar vers un rack.""" 
    actions = []

    # Trouver hangar contenant la jig
    hangar_name = None
    for h, host in state.hangar_host.items():
        if host == jig:
            hangar_name = h
            break
    if hangar_name is None:
        return []  # jig pas dans un hangar
    empty_jig(state, jig) 
    # Trouver trailer vide
    trailer = find_trailer_at(state, side=None, require_empty=True)
    if trailer is None:
        return []  # pas de trailer vide

    # Get from hangar
    get = GetFromHangar(jig=jig, hangar=hangar_name, trailer=trailer)
    if not get.is_applicable(state):
        return []
    actions.append(get)
    s_after_get = get.apply(state)

    # Choisir rack pour poser la jig
    side = "factory_side"  # choix arbitraire
    rname , side = choose_rack_for_jig(s_after_get, jig, urgency, side)
    if rname is None:
        return []

    # Put down rack
    put = PutDownRack(jig=jig, trailer=trailer, rack=rname, side=side)
    if not put.is_applicable(s_after_get):
        return []
    actions.append(put)

    return actions

def generate_possible_actions(state: State, urgency: Dict[str, int]) -> List[Tuple[Action, float]]:

    actions_with_score = []
    beluga_empty = len(state.beluga_contents) == 0
    print(f"\n--- Génération d'actions ---")
    print(f"État Beluga vide: {beluga_empty}. Contenu actuel: {state.beluga_contents}")

    # ============================================================
    # 1) Décharger Beluga
    # ============================================================
    if beluga_empty:
        next_beluga = find_next_beluga(state)
        if next_beluga is not None:
            print(f"  Beluga est vide. Tente de switcher vers la prochaine Beluga: {next_beluga}")
            switch_action = SwitchToNextBeluga(next_beluga=next_beluga)
            if switch_action.is_applicable(state):
                macro = wrap_macro([switch_action], name=f"switch_to_next_beluga({next_beluga})")
                score = 0
                actions_with_score.append((macro, score))
                print(f"    -> Succès: Macro {macro.name} générée. Score: {score:.2f}")
            else:
                print(f"    -> Échec: SwitchToNextBeluga non applicable.")

    print("\n[SECTION 1: Déchargement Beluga]")
    for jig in state.beluga_contents:
        print(f"  Tente de décharger la jig {jig}...")
        
        atomic_actions = unload_jig_from_beluga(state, jig)
        
        if not atomic_actions:
            print(f" -> Échec: Impossible de générer des actions atomiques pour décharger {jig}.")
            continue

        macro = wrap_macro(atomic_actions, name=f"unload_beluga({jig})")
        score = evaluate_macro_action(state, macro)

        actions_with_score.append((macro, score))
     
    # ============================================================
    # 2) Envoyer des jigs vers la production 
    # ============================================================
    print("\n[SECTION 2: Envoi vers Production]")
    for pl_name, pl in state.production_lines.items():
        
        delivered_count = len(state.production_line_deliveries.get(pl_name, []))
        print(f"  Ligne de production {pl_name} (Schedule: {len(pl.schedule)}, Livré: {delivered_count})")
        
        if delivered_count >= len(pl.schedule):
            print(f"    -> Pline {pl_name} complète. Skip.")
            continue

        next_jig = pl.schedule[delivered_count]
        print(f"    -> Prochaine jig requise: {next_jig} (Urgence: {urgency.get(next_jig, 0)})")

        rack_name, pos = find_rack_and_pos(state, next_jig)
        if rack_name is None:
            print(f"    -> Échec: Jig {next_jig} introuvable dans un rack.")
            continue

        rack_size = len(state.rack_contents[rack_name])
        is_edge = (pos == rack_size - 1)
        
        print(f"    -> Jig {next_jig} trouvée dans {rack_name} à pos {pos}/{rack_size-1}. Est-ce à l'Edge (factory_side) ? {is_edge}")

        # --- 2A : direct → production
        if is_edge:
            print(f"      [2A - Direct]: Tente d'envoyer {next_jig} directement.")
            atomic_actions = send_one_edge_jig(state, next_jig, pl_name)
            
            if not atomic_actions:
                print(f"        -> Échec: send_one_edge_jig n'a pas pu générer les actions (ex: manque trailer/hangar).")
                continue

            macro = wrap_macro(
                atomic_actions,
                name=f"send_to_prod({next_jig},{pl_name})"
            )

            priority = -10 * urgency.get(next_jig, 0)
            score = evaluate_macro_action(state, macro)

            actions_with_score.append((macro, score))
            print(f"        -> Succès: Macro {macro.name} générée. Score: {score:.2f}, Actions: {len(atomic_actions)}")


        # --- 2B : swap nécessaire
        else:
            depth = rack_size - pos - 1
            print(f"      [2B - Swap]: Nécessite un swap (Profondeur: {depth}).")

            # actions pour swap
            atomic_actions = swap(state, rack_name, next_jig, "factory_side", urgency) # WARNING: urgency added to call
            
            if not atomic_actions:
                print(f"        -> Échec: La macro swap a échoué (ex: pas de place/trailer pour déplacer les jigs bloquantes).")
                continue
            
            # appliquer progressivement le swap pour obtenir l'état mis à jour
            tmp_state = state
            for act in atomic_actions:
                tmp_state = act.apply(tmp_state)
            
            # maintenant seulement on peut envoyer la jig à la plateforme
            atomic_actions2 = send_one_edge_jig(tmp_state, next_jig, pl_name)
            
            if not atomic_actions2:
                print(f"        -> Échec: send_one_edge_jig a échoué après le swap virtuel.")
                continue

            # wrap_macro combiné des deux séquences
            macro = wrap_macro(
                atomic_actions + atomic_actions2,
                swap_penalty=2 * depth,
                name=f"swap_to_edge_and_send({next_jig})"
            )
            
            priority = -5 * urgency.get(next_jig, 0)
            score = evaluate_macro_action(state, macro)

            actions_with_score.append((macro, score))
            print(f"        -> Succès: Macro {macro.name} générée. Score: {score:.2f}, Swap Penalty: {2*depth}, Actions: {len(atomic_actions) + len(atomic_actions2)}")

    # ============================================================
    # 3) Charger Beluga (si vide)
    # ============================================================
    print("\n[SECTION 3: Chargement Beluga]")
    
    
    if len(state.last_belugas) > 0:
        for beluga in state.last_belugas:

            for jig_type in state.flights[beluga].outgoing:
                jig = find_best_jig_of_type(state, jig_type, empty=True)
                if jig is None:
                    print(f"    -> Aucun jig vide de type {jig_type} disponible pour le Beluga {beluga}.")
                    continue
                print("  Beluga vide. Tente de ramener jig outgoing", jig, "de la Beluga", beluga)
                atomic_actions = send_empty_jig_to_beluga(state, jig, state.current_beluga)
                if not atomic_actions:
                    print(f"    -> Échec: Impossible de ramener {jig} de la Beluga {beluga}.")
                    continue
                macro = wrap_macro(
                    atomic_actions,
                    name=f"bring_back_jig({jig})"
                )
                score = evaluate_macro_action(state, macro)
                actions_with_score.append((macro, score))
                print(f"    -> Succès: Macro {macro.name} générée. Score: {score:.2f}, Actions: {len(atomic_actions)}")
    else:
        print("  Aucun Beluga précédent pour ramener des jigs outgoing.")
        
    

    print(f"\n--- Fin Génération. Total actions: {len(actions_with_score)} ---")
    return actions_with_score




def greedy_next_action(state: State) -> Optional[Action]:
    urgency = compute_urgency(state)
    actions_with_score = generate_possible_actions(state, urgency)
    print(f"Generated {len(actions_with_score)} possible actions.")
    if not actions_with_score:
        return None
    # Choisir l'action avec le score minimal
    actions_with_score.sort(key=lambda x: x[1])
    return actions_with_score[0][0]


def is_terminal_state(state: State) -> bool:

    production_done = all(
        len(state.production_line_deliveries.get(pl, [])) >= len(line.schedule)
        for pl, line in state.production_lines.items()
    )

    beluga_empty = (len(state.beluga_contents) == 0)

    return production_done and beluga_empty


def run_greedy_planning(initial_state: State, output_path: str = "result.json"):
    """
    Applique le glouton (greedy_next_action) jusqu'à blocage complet.
    Chaque macro-action est appliquée d'un bloc via macro.apply(state).
    La trace complète des décisions est enregistrée dans un JSON.
    """

    state = initial_state.copy()
    history = []
    step = 0

    while True:

        # ============================
        # 1) CHOIX GLUTTON
        # ============================
        macro: Optional[MacroAction] = greedy_next_action(state)

        if macro is None:
            print("Aucune action possible → arrêt. mm")
            break

        # ============================
        # 2) LOGGING POUR LE JSON
        # ============================
        history.append({
            "step": step,
            "macro_name": macro.name,
            "swap_penalty": getattr(macro, "swap_penalty", 0),
            "internal_action_count": macro.internal_action_count,
            "internal_actions": [a.name for a in macro.actions]
        })

        # ============================
        # 3) APPLICATION DE LA MACRO
        # ============================
       
        state = macro.apply(state)

        step += 1

        # ============================
        # 4) ARRÊT SI TERMINAL
        # ============================
        if is_terminal_state(state):
            print("État terminal atteint → arrêt. tt")
            break

    # ============================
    # 5) ÉCRITURE JSON
    # ============================
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(history, f, indent=2, ensure_ascii=False)

    print(f"Plan glouton sauvegardé dans {output_path}")
    return history



# ---------- Minimal demonstration when run as script ----------

# if __name__ == "__main__":
#     # path where you uploaded your JSON
#     path = "f.json"
#     s = load_instance_from_json(path)
#     print("Loaded state:")
#     print("Current beluga:", s.current_beluga)
#     print("Beluga contents (edge last):", s.beluga_contents)
#     print("Trailers:", {t: s.trailer_load[t] for t in s.trailer_load})
#     # propose an action
#     a = greedy_next_action(s)
#     print("Greedy selected action:", a)
#     if a and a.is_applicable(s):
#         s2 = a.apply(s)
#         print("Applied action, new trailer_load:", s2.trailer_load)
#     else:
#         print("No applicable greedy action found.")

if __name__ == "__main__":
    # path where you uploaded your JSON
    path = "problem_103_s145_j266_r20_oc21_f173.json"
    s = load_instance_from_json(path)
    print("Loaded state:")
    print("Current beluga:", s.current_beluga)
    print("Beluga contents (edge last):", s.beluga_contents)
    print("Trailers:", {t: s.trailer_load[t] for t in s.trailer_load})
    # run greedy planning until terminal
    history = run_greedy_planning(s, output_path="result.json")
    print("Planning history:")
    for step_info in history:
        print(step_info)

from __future__ import annotations
from dataclasses import dataclass, field, replace
from typing import List, Dict, Optional, Tuple, Sequence, Any
import json
import copy

# #Syntaxe 
# git  -b ma-nouvelle-regle-gloutonne
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
        if not (s.trailer_load.get(self.trailer) == self.jig and self.rack in s.rack_contents):
            return False

        rack_name = self.rack
        current_rack_size = s.racks[rack_name].size
        
        # 1. Calculer l'espace déjà occupé
        occupied_space = 0
        for jig_name in s.rack_contents[rack_name]:
            jig_type_name = s.jigs[jig_name].type
            is_empty = s.jig_empty[jig_name]
            jig_type = s.jig_types[jig_type_name]
            
            occupied_space += jig_type.size_empty if is_empty else jig_type.size_loaded
            
        # 2. Déterminer l'espace requis par le jig à poser
        jig_to_add_type_name = s.jigs[self.jig].type
        is_jig_to_add_empty = s.jig_empty[self.jig]
        jig_to_add_type = s.jig_types[jig_to_add_type_name]
        
        space_needed = jig_to_add_type.size_empty if is_jig_to_add_empty else jig_to_add_type.size_loaded
        
        # 3. Vérifier la capacité
        return (occupied_space + space_needed) <= current_rack_size

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

    # # trailers beluga + factory
    # for t in data.get("trailers_beluga", []) + data.get("trailers_factory", []):
    #     trailer = Trailer(name=t["name"])
    #     s.trailers[trailer.name] = trailer
    #     s.trailer_load[trailer.name] = trailer.load
    #     s.trailer_location[trailer.name] = (trailer.location, trailer.side)
    
# 1. Remorques BELUGA (Côté gauche : "left")
    # Location: "beluga", Side: "left"
    for t_data in data.get("trailers_beluga", []):
        name = t_data["name"]
        load = t_data.get("load")
        
        # Convention : Si Trailer Beluga, son côté est "left".
        TRAILER_SIDE = "left"
        # ---
        
        # On définit explicitement location="beluga"
        trailer = Trailer(name=name, load=load, location="beluga", side=TRAILER_SIDE)
        
        s.trailers[name] = trailer
        s.trailer_load[name] = trailer.load
        s.trailer_location[name] = (trailer.location, trailer.side)

    # 2. Remorques FACTORY (Côté droit : "right")
    # Location: rack/hangar/factory_area, Side: "right"
    for t_data in data.get("trailers_factory", []):
        name = t_data["name"]
        load = t_data.get("load")
        
        # Convention : Si Trailer Factory, son côté est "right".
        TRAILER_SIDE = "right"
        # ---
        
        # Récupérer la location si spécifiée dans le JSON, sinon utiliser un défaut
        location = t_data.get("location", "factory_area") 
        
        # On ignore le side potentiellement présent dans t_data pour appliquer la règle
        trailer = Trailer(name=name, load=load, location=location, side=TRAILER_SIDE)
        
        s.trailers[name] = trailer
        s.trailer_load[name] = trailer.load
        
        s.trailer_location[name] = (trailer.location, trailer.side)

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



# ---------- Heuristique Gloutonne Parallèle ----------

def greedy_next_actions(state: State) -> List[Action]:
    """
    Heuristique gloutonne qui propose une liste d'actions non conflictuelles (parallélisables) 
    pour une étape donnée.
    
    Les priorités sont définies comme suit :
    1. Changer de Beluga (si l'actuel est vide).
    2. Déchargement du Beluga (priorité maximale pour le flux entrant).
    3. Livraison à la Ligne de Production (priorité élevée pour atteindre l'objectif).
    4. Stockage sur Rack.
    5. Récupération sur Rack.
    """
    
    if not state.current_beluga:
        return []

    actions: List[Action] = []
    
    # Ensembles pour gérer les conflits de ressources pour cette étape
    used_trailers: Set[str] = set()
    used_jigs_at_beluga: Set[str] = set()
    used_hangars: Set[str] = set()
    used_racks_edge: Set[str] = set() # Empêche deux actions d'interagir avec l'arête du même rack
    
    # --------------------------------------------------
    # 1. Tenter de changer de Beluga (Priorité absolue, ne peut être parallèle)
    # --------------------------------------------------
    if not state.beluga_contents:
        flights_names = list(state.flights.keys())
        try:
            current_index = flights_names.index(state.current_beluga)
            if current_index + 1 < len(flights_names):
                next_beluga_name = flights_names[current_index + 1]
                # Si on change de Beluga, aucune autre action ne peut être faite dans cette étape
                return [SwitchToNextBeluga(next_beluga=next_beluga_name)]
        except ValueError:
            pass
            
    # --------------------------------------------------
    # 2. Déchargement du Beluga (Flux Entrant)
    # --------------------------------------------------
    
    # Le jig à l'arête (le dernier) est le seul accessible pour le déchargement
    if state.beluga_contents:
        jig_to_unload = state.beluga_contents[-1]
        
        # Trouver toutes les remorques vides au Beluga pour décharger
        for trailer_name, load in state.trailer_load.items():
            loc, _ = state.trailer_location.get(trailer_name, ("beluga", None))
            
            if (load is None and loc == "beluga" and 
                trailer_name not in used_trailers and 
                jig_to_unload not in used_jigs_at_beluga):
                
                # Générer l'action de déchargement
                action = UnloadBeluga(jig=jig_to_unload, beluga=state.current_beluga, trailer=trailer_name)
                
                # Vérifier si l'action est applicable dans l'état actuel (important pour l'arête)
                if action.is_applicable(state):
                    actions.append(action)
                    used_trailers.add(trailer_name)
                    # Marquer le jig comme en cours de déchargement (même s'il est techniquement dans beluga_contents)
                    used_jigs_at_beluga.add(jig_to_unload) 
                    # Une fois que l'arête est assignée, on ne peut pas l'assigner à une autre remorque
                    # et on ne peut plus décharger d'autres jigs tant que l'arête n'est pas dégagée.
                    break 

    # --------------------------------------------------
    # 3. Livraison à la Ligne de Production (Objectif Final)
    # --------------------------------------------------
    
    # Parcourir toutes les remorques chargées
    for trailer_name, load in state.trailer_load.items():
        if load is not None and trailer_name not in used_trailers:
            jig_obj = state.jigs.get(load)
            
            if jig_obj:
                # Trouver la ligne de production qui nécessite ce type de jig
                for pl_name, pl_obj in state.production_lines.items():
                    # Vérifier si le type est requis et si le jig spécifique n'est pas encore livré
                    if jig_obj.type in pl_obj.schedule and load not in state.production_line_deliveries.get(pl_name, []):
                        
                        # Trouver un hangar libre
                        for hangar_name, hangar_jig in state.hangar_host.items():
                            if hangar_jig is None and hangar_name not in used_hangars:
                                
                                # Générer l'action de livraison
                                action = DeliverToHangar(jig=load, hangar=hangar_name, trailer=trailer_name, production_line=pl_name)
                                
                                # Si l'action est applicable, l'ajouter et marquer les ressources
                                if action.is_applicable(state):
                                    actions.append(action)
                                    used_trailers.add(trailer_name)
                                    used_hangars.add(hangar_name)
                                    # Casser les boucles internes et passer à la remorque suivante
                                    break 
                        if trailer_name in used_trailers:
                            break # Hangar trouvé pour cette PL

    # --------------------------------------------------
    # 4. Stockage sur Rack / Mouvement (Utiliser les remorques chargées restantes)
    # --------------------------------------------------
    
    for trailer_name, load in state.trailer_load.items():
        if load is not None and trailer_name not in used_trailers:
            # Règle gloutonne : placer sur le premier rack où l'arête est libre (pour le PickUp futur)
            for rack_name in state.racks:
                if rack_name not in used_racks_edge:
                    
                    # Générer l'action de stockage
                    action = PutDownRack(jig=load, trailer=trailer_name, rack=rack_name, side="bside")
                    
                    if action.is_applicable(state):
                        actions.append(action)
                        used_trailers.add(trailer_name)
                        used_racks_edge.add(rack_name)
                        break
    
    # --------------------------------------------------
    # 5. Récupération sur Rack (Utiliser les remorques vides restantes)
    # --------------------------------------------------
    
    for trailer_name, load in state.trailer_load.items():
        if load is None and trailer_name not in used_trailers:
            # Récupérer l'arête du premier rack non vide et non utilisé
            for rack_name, jigs_list in state.rack_contents.items():
                if jigs_list and rack_name not in used_racks_edge:
                    jig_to_pick = jigs_list[-1]
                    
                    # Générer l'action de récupération
                    action = PickUpRack(jig=jig_to_pick, trailer=trailer_name, rack=rack_name, side="bside")
                    
                    if action.is_applicable(state):
                        actions.append(action)
                        used_trailers.add(trailer_name)
                        used_racks_edge.add(rack_name)
                        break

    return actions

# --------------------------------------------------
# Bloc principal d'exécution adapté au parallélisme
# --------------------------------------------------
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
        # Calcule l'espace occupé (pour un affichage plus complet)
        occupied_space = 0
        current_rack_size = s.racks.get(r_name).size if s.racks.get(r_name) else 'N/A'
        
        for jig_name in jigs:
            if jig_name in s.jigs:
                jig_type_name = s.jigs[jig_name].type
                is_empty = s.jig_empty.get(jig_name, False)
                jig_type = s.jig_types.get(jig_type_name)
                if jig_type:
                    occupied_space += jig_type.size_empty if is_empty else jig_type.size_loaded
            
        rack_jigs_str = f"[..., **{jigs[-1]}**] (Total Jigs: {len(jigs)})" if jigs else "[] (Total Jigs: 0)"
        print(f"  - **{r_name}**: {rack_jigs_str} | Espace occupé: {occupied_space}/{current_rack_size}")

    # Affiche l'état des Hangars
    print("\n**Hangars**:")
    for h_name, host in s.hangar_host.items():
        print(f"  - **{h_name}**: Contenu: {host if host else 'Vide'}")
    
    # Affiche les livraisons ET le schedule des lignes de production
    print("\n**Lignes de Production (Schedule & Livraisons)**:")
    for pl_name in s.production_lines:
        pl_data = s.production_lines[pl_name]
        schedule_str = ", ".join(pl_data.schedule)
        deliveries = s.production_line_deliveries.get(pl_name, [])
        
        print(f"  - **{pl_name}**:")
        print(f"    - Schedule (Types requis) : [{schedule_str}]")
        print(f"    - Livraisons (Jigs reçus) : {deliveries}")

if __name__ == "__main__":
    path = "f.json" 
    try:
        s = load_instance_from_json(path)
    except FileNotFoundError:
        print(f"ERREUR: Le fichier JSON d'instance '{path}' n'a pas été trouvé. Veuillez le créer ou ajuster le chemin.")
        exit()
    
 

    MAX_STEPS = 2
    step = 0
    plan_actions: List[Dict[str, Any]] = []

    print("--- 🚀 Démarrage de la simulation Gloutonne PARALLÈLE (avec génération de Plan JSON) 🚀 ---")
    
    print_state_summary(s, step)

    while step < MAX_STEPS:
        step += 1
        
        # NOTE: Appel à la nouvelle fonction
        actions = greedy_next_actions(s)
        
        if not actions:
            print(f"\n[Étape {step}] **🏁 Terminé : Aucune action gloutonne applicable trouvée.**")
            break
        
        print("\n" + "#" * 50)
        print(f"## ÉTAPE PARALLÈLE {step} | ACTIONS EXÉCUTÉES SIMULTANÉMENT : {len(actions)}")
        print("#" * 50)

        # Appliquer toutes les actions une par une (sur une copie de l'état pour garantir 
        # que chaque action est basée sur l'état précédent)
        
        current_state = s.copy() 
        for action in actions:
            if action.is_applicable(current_state):
                # 1. Enregistrer l'action dans le plan
                plan_actions.append(action.to_dict())
                
                # 2. Appliquer l'action pour le NOUVEL état de l'étape
                s = action.apply(s)
                
                print(f"  -> Action appliquée : **{action}**")
            else:
                # Si une action n'est plus applicable (devrait être rare si le conflit est bien géré)
                print(f"  -> Avertissement : Action ignorée car non applicable dans l'état de l'étape : {action}")


        # Afficher l'état après toutes les actions
        print_state_summary(s, step, action=None) # Affichage du résultat de l'étape parallèle
        
    else:
        print(f"\n--- 🛑 Simulation terminée après {MAX_STEPS} étapes (limite de pas atteinte) 🛑 ---")
    
    # --- Génération du Plan Final JSON ---
    print("\n\n" + "#" * 70)
    print("## ✅ PLAN D'ACTIONS FINAL (FORMAT JSON) ✅")
    print("#" * 70)
    
    json_plan = json.dumps(plan_actions, indent=4)
    print(json_plan)
    
    # output_filename = "plan_glouton_parallele.json"
    # with open(output_filename, "w") as f:
    #     f.write(json_plan)
    # print(f"\nPlan écrit dans le fichier : **{output_filename}**")
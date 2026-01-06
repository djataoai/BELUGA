from __future__ import annotations
from dataclasses import dataclass, field
from typing import List, Dict, Optional, Tuple
import json
import copy

# ---------- Basic domain classes ----------

@dataclass(frozen=True)
class JigType:
    name: str
    size_empty: int
    size_loaded: int

@dataclass(frozen=True)
class Jig:
    name: str
    type: str
    empty: bool

@dataclass
class Rack:
    name: str
    size: int
    jigs: List[str] = field(default_factory=list)

@dataclass
class Trailer:
    name: str
    load: Optional[str] = None
    location: str = "beluga"
    side: Optional[str] = None

@dataclass
class Hangar:
    name: str
    host: Optional[str] = None

@dataclass
class ProductionLine:
    name: str
    schedule: List[str] = field(default_factory=list)
    deliveries: List[str] = field(default_factory=list)

@dataclass
class Flight:
    name: str
    incoming: List[str] = field(default_factory=list)
    outgoing: List[str] = field(default_factory=list)

# ---------- State representation ----------

@dataclass
class State:
    current_beluga: Optional[str] = None
    last_belugas: List[str] = field(default_factory=list)
    beluga_contents: List[str] = field(default_factory=list)
    remaining_outgoing: List[str] = field(default_factory=list)
    production_line_deliveries: Dict[str, List[str]] = field(default_factory=dict)
    rack_contents: Dict[str, List[str]] = field(default_factory=dict)
    trailer_load: Dict[str, Optional[str]] = field(default_factory=dict)
    jig_empty: Dict[str, bool] = field(default_factory=dict)
    trailer_location: Dict[str, Tuple[str, Optional[str]]] = field(default_factory=dict)
    hangar_host: Dict[str, Optional[str]] = field(default_factory=dict)
    flights: Dict[str, Flight] = field(default_factory=dict)
    racks: Dict[str, Rack] = field(default_factory=dict)
    trailers: Dict[str, Trailer] = field(default_factory=dict)
    hangars: Dict[str, Hangar] = field(default_factory=dict)
    production_lines: Dict[str, ProductionLine] = field(default_factory=dict)
    jigs: Dict[str, Jig] = field(default_factory=dict)
    jig_types: Dict[str, JigType] = field(default_factory=dict)

    def copy(self) -> "State":
        return copy.deepcopy(self)

@dataclass
class SearchNode:
    state: State
    remaining_actions: List[MacroAction]
    history: List[dict]

# ---------- Actions atomiques ----------

class Action:
    def is_applicable(self, s: State) -> bool: raise NotImplementedError
    def apply(self, s: State) -> State: raise NotImplementedError

@dataclass
class LoadBeluga(Action):
    jig: str
    beluga: str
    trailer: str
    def is_applicable(self, s: State) -> bool:
        return (s.trailer_load.get(self.trailer) == self.jig) and (s.current_beluga == self.beluga)
    def apply(self, s: State) -> State:
        ns = s.copy()
        ns.trailer_load[self.trailer] = None
        ns.beluga_contents.append(self.jig)
        return ns

@dataclass
class UnloadBeluga(Action):
    jig: str
    beluga: str
    trailer: str
    def is_applicable(self, s: State) -> bool:
        loc = s.trailer_location.get(self.trailer)
        return (s.current_beluga == self.beluga) and (self.jig in s.beluga_contents) and (s.trailer_load.get(self.trailer) is None) and (loc[1] == "bside")
    def apply(self, s: State) -> State:
        ns = s.copy()
        ns.beluga_contents.remove(self.jig)
        ns.trailer_load[self.trailer] = self.jig
        return ns

@dataclass
class RegisterOutgoingJig(Action):
    jig: str
    trailer: str
    beluga: Optional[str] = None
    def is_applicable(self, s: State) -> bool: return s.trailer_load.get(self.trailer) == self.jig
    def apply(self, s: State) -> State:
        ns = s.copy()
        ns.trailer_load[self.trailer] = None
        ns.trailer_location[self.trailer] = ("beluga", "bside")
        jig_type = ns.jigs[self.jig].type
        ns.remaining_outgoing.remove(jig_type)
        return ns

@dataclass
class GetFromHangar(Action):
    jig: str
    hangar: str
    trailer: str
    def is_applicable(self, s: State) -> bool:
        is_factory = "factory" in self.trailer or s.trailer_location.get(self.trailer)[1] == "fside"
        return (s.hangar_host.get(self.hangar) == self.jig) and (s.trailer_load.get(self.trailer) is None) and is_factory
    def apply(self, s: State) -> State:
        ns = s.copy()
        ns.hangar_host[self.hangar] = None
        ns.trailer_load[self.trailer] = self.jig
        return ns

@dataclass
class DeliverToHangar(Action):
    jig: str
    hangar: str
    trailer: str
    production_line: str
    def is_applicable(self, s: State) -> bool:
        is_factory = "factory" in self.trailer or s.trailer_location.get(self.trailer)[1] == "fside"
        return (s.trailer_load.get(self.trailer) == self.jig) and (s.hangar_host.get(self.hangar) in (None, self.jig)) and is_factory
    def apply(self, s: State) -> State:
        ns = s.copy()
        ns.trailer_load[self.trailer] = None
        ns.hangar_host[self.hangar] = self.jig
        ns.jig_empty[self.jig] = True
        ns.production_line_deliveries.setdefault(self.production_line, []).append(self.jig)
        return ns

@dataclass
class PutDownRack(Action):
    jig: str
    trailer: str
    rack: str
    side: str
    def is_applicable(self, s: State) -> bool: return (s.trailer_load.get(self.trailer) == self.jig) and (self.rack in s.rack_contents)
    def apply(self, s: State) -> State:
        ns = s.copy()
        ns.trailer_load[self.trailer] = None
        if self.side == "bside": ns.rack_contents[self.rack].insert(0, self.jig)
        else: 
            ns.rack_contents[self.rack].append(self.jig)
            ns.jig_empty[self.jig] = True
        return ns

@dataclass
class PickUpRack(Action):
    jig: str
    trailer: str
    rack: str
    side: str
    def is_applicable(self, s: State) -> bool:
        rack_list = s.rack_contents.get(self.rack, [])
        if self.side == "bside": at_edge = rack_list[0] == self.jig if rack_list else False
        else: at_edge = rack_list[-1] == self.jig if rack_list else False
        return s.trailer_load.get(self.trailer) is None and at_edge
    def apply(self, s: State) -> State:
        ns = s.copy()
        if self.side == "bside": ns.rack_contents[self.rack].pop(0)
        else: ns.rack_contents[self.rack].pop()
        ns.trailer_load[self.trailer] = self.jig
        return ns

@dataclass
class SwitchToNextBeluga(Action):
    next_beluga: str
    def is_applicable(self, s: State) -> bool: return self.next_beluga in s.flights and s.current_beluga != self.next_beluga
    def apply(self, s: State) -> State:
        ns = s.copy()
        if ns.current_beluga: ns.last_belugas.append(ns.current_beluga)
        ns.current_beluga = self.next_beluga
        ns.remaining_outgoing = list(ns.flights[ns.current_beluga].outgoing)
        ns.beluga_contents = list(ns.flights[self.next_beluga].incoming)
        return ns

@dataclass
class MacroAction(Action):
    actions: List[Action]
    internal_action_count: int
    swap_penalty: float = 0.0
    name: str = ""
    def is_applicable(self, s: State) -> bool: return all(a.is_applicable(s) for a in self.actions)
    def apply(self, s: State) -> State:
        ns = s
        for a in self.actions: ns = a.apply(ns)
        return ns

# ---------- Helpers & Logic ----------

def action_to_evaluator_dict(action: Action) -> dict:
    if isinstance(action, LoadBeluga): return {"name": "load_beluga", "j": action.jig, "b": action.beluga, "t": action.trailer}
    if isinstance(action, UnloadBeluga): return {"name": "unload_beluga", "j": action.jig, "b": action.beluga, "t": action.trailer}
    if isinstance(action, PutDownRack): return {"name": "put_down_rack", "j": action.jig, "t": action.trailer, "r": action.rack, "s": action.side}
    if isinstance(action, PickUpRack): return {"name": "pick_up_rack", "j": action.jig, "t": action.trailer, "r": action.rack, "s": action.side}
    if isinstance(action, GetFromHangar): return {"name": "get_from_hangar", "j": action.jig, "h": action.hangar, "t": action.trailer}
    if isinstance(action, DeliverToHangar): return {"name": "deliver_to_hangar", "j": action.jig, "h": action.hangar, "t": action.trailer, "pl": action.production_line}
    if isinstance(action, SwitchToNextBeluga): return {"name": "switch_to_next_beluga"}
    if isinstance(action, RegisterOutgoingJig): return {"name": "load_beluga", "j": action.jig, "b": action.beluga, "t": action.trailer}
    return {}

def find_trailer_at(state: State, side: str, require_empty: bool=True, factory_only: bool=False) -> Optional[str]:
    for tr, load in state.trailer_load.items():
        _, tr_side = state.trailer_location.get(tr, (None, None))
        if side and tr_side != side: continue
        if require_empty and load is not None: continue
        if factory_only and "factory" not in tr: continue
        return tr
    return None

def find_rack_and_pos(state: State, jig: str) -> Tuple[Optional[str], Optional[int]]:
    for r, c in state.rack_contents.items():
        if jig in c: return r, c.index(jig)
    return None, None

def get_jig_size(state: State, jig: str) -> int:
    j = state.jigs[jig]
    jt = state.jig_types[j.type]
    return jt.size_empty if j.empty else jt.size_loaded

def choose_rack_for_jig(state: State, jig: str, urgency: Dict[str, int], side: str) -> Tuple[Optional[str], Optional[str]]:
    best_rack, best_score = None, None
    j_size = get_jig_size(state, jig)
    for rname, contents in state.rack_contents.items():
        used = sum(get_jig_size(state, j) for j in contents)
        if used + j_size > state.racks[rname].size: continue
        blocked = contents[0] if (side == "bside" and contents) else (contents[-1] if contents else None)
        score = urgency.get(blocked, -1) if blocked else -1
        if best_score is None or (side == "bside" and score > best_score) or (side == "fside" and score < best_score):
            best_score, best_rack = score, rname
    return best_rack, side

def compute_urgency(state: State) -> Dict[str, int]:
    urg = {j: 0 for j in state.jigs.keys()}
    for pl in state.production_lines.values():
        for i, j in enumerate(pl.schedule): urg[j] = max(urg[j], 1000 - i)
    return urg

# ---------- Macro Generation Logic ----------

def swap(state: State, rack_name: str, jig_to_free: str, side: str, urgency: Dict[str, int]) -> List[Action]:
    actions = []
    contents = state.rack_contents[rack_name]
    idx = contents.index(jig_to_free)
    to_move = contents[:idx] if side == "bside" else list(reversed(contents[idx+1:]))
    curr_s = state
    for j in to_move:
        tr_name = find_trailer_at(curr_s, side, True)
        target_r, _ = choose_rack_for_jig(curr_s, j, urgency, side)
        if not tr_name or not target_r: return []
        p = PickUpRack(j, tr_name, rack_name, side)
        d = PutDownRack(j, tr_name, target_r, side)
        actions.extend([p, d])
        curr_s = d.apply(p.apply(curr_s))
    return actions

def unload_jig_from_beluga(state: State, jig: str) -> List[Action]:
    tr = find_trailer_at(state, "bside", True)
    if not tr: return []
    u = UnloadBeluga(jig, state.current_beluga, tr)
    s_int = u.apply(state)
    r, side = choose_rack_for_jig(s_int, jig, compute_urgency(s_int), "bside")
    if not r: return []
    p = PutDownRack(jig, tr, r, side)
    return [u, p]

def send_one_edge_jig(state: State, jig: str, target: str) -> List[Action]:
    is_empty = state.jig_empty.get(jig, True)
    side = "bside" if target == "beluga" else "fside"
    fact_only = (target != "beluga")
    tr = find_trailer_at(state, side, True, fact_only)
    rname, pos = find_rack_and_pos(state, jig)
    if not tr or not rname: return []
    pick = PickUpRack(jig, tr, rname, side)
    s_int = pick.apply(state)
    if target == "beluga":
        load = RegisterOutgoingJig(jig, tr, s_int.current_beluga)
        return [pick, load] if load.is_applicable(s_int) else []
    else:
        hangar = next((h for h, host in s_int.hangar_host.items() if host is None), None)
        if not hangar: return []
        deliver = DeliverToHangar(jig, hangar, tr, target)
        return [pick, deliver] if deliver.is_applicable(s_int) else []

def bring_jig_to_rack(state: State, jig: str, urgency: Dict[str, int]) -> List[Action]:
    h_name = next((h for h, host in state.hangar_host.items() if host == jig), None)
    tr = find_trailer_at(state, "fside", True, True)
    if not h_name or not tr: return []
    g = GetFromHangar(jig, h_name, tr)
    s_int = g.apply(state)
    r, side = choose_rack_for_jig(s_int, jig, urgency, "fside")
    if not r: return []
    p = PutDownRack(jig, tr, r, side)
    return [g, p]

# ---------- Main Planning Engine ----------

def generate_possible_actions(state: State, urgency: Dict[str, int]) -> List[Tuple[MacroAction, float]]:
    actions = []
    # 1. Switch
    if not state.beluga_contents and not state.remaining_outgoing:
        all_b = list(state.flights.keys())
        curr_idx = all_b.index(state.current_beluga) if state.current_beluga in all_b else -1
        if curr_idx + 1 < len(all_b):
            nxt = all_b[curr_idx+1]
            sw = SwitchToNextBeluga(nxt)
            if sw.is_applicable(state): actions.append((MacroAction([sw], 1, 0, f"switch({nxt})"), -100.0))

    # 2. Unload
    for j in state.beluga_contents:
        acts = unload_jig_from_beluga(state, j)
        if acts: actions.append((MacroAction(acts, len(acts), 0, f"unload({j})"), 1.0))

    # 3. Production
    for pl_name, pl in state.production_lines.items():
        delivered = len(state.production_line_deliveries.get(pl_name, []))
        if delivered >= len(pl.schedule): continue
        next_j = pl.schedule[delivered]
        rname, pos = find_rack_and_pos(state, next_j)
        if not rname: continue
        
        is_edge = (pos == len(state.rack_contents[rname]) - 1)
        if is_edge:
            acts = send_one_edge_jig(state, next_j, pl_name)
            if acts:
                s_tmp = state
                for a in acts: s_tmp = a.apply(s_tmp)
                acts2 = bring_jig_to_rack(s_tmp, next_j, urgency)
                if acts2: actions.append((MacroAction(acts+acts2, len(acts+acts2), 0, f"prod({next_j})"), -10.0 * urgency[next_j]))
        else:
            sw_acts = swap(state, rname, next_j, "fside", urgency)
            if sw_acts:
                s_tmp = state
                for a in sw_acts: s_tmp = a.apply(s_tmp)
                acts = send_one_edge_jig(s_tmp, next_j, pl_name)
                for a in acts: s_tmp = a.apply(s_tmp)
                acts2 = bring_jig_to_rack(s_tmp, next_j, urgency)
                if acts2: actions.append((MacroAction(sw_acts+acts+acts2, len(sw_acts+acts+acts2), 2.0, f"swap_prod({next_j})"), -5.0 * urgency[next_j]))

    # 4. Load
    for jt in set(state.remaining_outgoing):
        best_j = None
        for r, conts in state.rack_contents.items():
            for j in conts:
                if state.jigs[j].type == jt and state.jig_empty.get(j):
                    best_j = j; break
        if best_j:
            rname, pos = find_rack_and_pos(state, best_j)
            sw_acts = []
            if pos != 0: sw_acts = swap(state, rname, best_j, "bside", urgency)
            s_tmp = state
            for a in sw_acts: s_tmp = a.apply(s_tmp)
            tr = find_trailer_at(s_tmp, "bside", True)
            if tr:
                p = PickUpRack(best_j, tr, rname, "bside")
                l = RegisterOutgoingJig(best_j, tr, s_tmp.current_beluga)
                if l.is_applicable(p.apply(s_tmp)):
                    actions.append((MacroAction(sw_acts + [p, l], len(sw_acts)+2, 0, f"load({best_j})"), 5.0))
    return actions

def is_terminal_state(state: State) -> bool:
    prod_done = all(len(state.production_line_deliveries.get(pl, [])) >= len(line.schedule) for pl, line in state.production_lines.items())
    all_b = list(state.flights.keys())
    is_last = state.current_beluga == all_b[-1] if all_b else False
    return prod_done and not state.beluga_contents and not state.remaining_outgoing and is_last

def run_greedy_with_backtracking(initial_state: State, output_path: str = "result.json", max_backtrack: int = 5):
    stack, state, history, step = [], initial_state, [], 0
    while not is_terminal_state(state):
        urgency = compute_urgency(state)
        actions = generate_possible_actions(state, urgency)
        if not actions:
            if not stack: break
            node = stack.pop()
            state, history = node.state, node.history
            if not node.remaining_actions: continue
            best = node.remaining_actions.pop(0)
        else:
            actions.sort(key=lambda x: x[1])
            best = actions[0][0]
            stack.append(SearchNode(state.copy(), [a for a, s in actions[1:max_backtrack]], history.copy()))
        
        for a in best.actions:
            state = a.apply(state)
            history.append(action_to_evaluator_dict(a))
        step += 1
        if step > 2000: break

    with open(output_path, "w") as f: json.dump(history, f, indent=2)
    return history

def load_instance_from_json(path: str) -> State:
    with open(path, "r") as f: data = json.load(f)
    s = State()
    for k, v in data.get("jig_types", {}).items(): s.jig_types[k] = JigType(v["name"], v["size_empty"], v["size_loaded"])
    for jn, jd in data.get("jigs", {}).items():
        s.jigs[jn] = Jig(jn, jd["type"], jd["empty"])
        s.jig_empty[jn] = jd["empty"]
    for r in data.get("racks", []):
        s.racks[r["name"]] = Rack(r["name"], r["size"], list(r.get("jigs", [])))
        s.rack_contents[r["name"]] = list(r.get("jigs", []))
    for t in data.get("trailers_beluga", []):
        s.trailer_location[t["name"]] = ("beluga", "bside")
        s.trailer_load[t["name"]] = None
    for t in data.get("trailers_factory", []):
        s.trailer_location[t["name"]] = ("factory", "fside")
        s.trailer_load[t["name"]] = None
    for h in data.get("hangars", []): s.hangar_host[h] = None
    for pl in data.get("production_lines", []):
        s.production_lines[pl["name"]] = ProductionLine(pl["name"], list(pl.get("schedule", [])))
        s.production_line_deliveries[pl["name"]] = []
    for f in data.get("flights", []): s.flights[f["name"]] = Flight(f["name"], list(f.get("incoming", [])), list(f.get("outgoing", [])))
    first_f = list(s.flights.keys())[0] if s.flights else None
    s.current_beluga = first_f
    if first_f:
        s.remaining_outgoing = list(s.flights[first_f].outgoing)
        s.beluga_contents = list(s.flights[first_f].incoming)
    return s

if __name__ == "__main__":
    path = "/home/aichatou/belugaModel/BELUGA/problem_143_s185_j5_r2_oc28_f3.json"
    s = load_instance_from_json(path)
    run_greedy_with_backtracking(s, output_path="result.json")
    print("Plan généré avec succès dans result.json")
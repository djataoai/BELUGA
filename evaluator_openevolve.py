import json
import os
import time
import subprocess
import sys
from typing import List, Dict, Any

# Importation des composants du modèle Beluga
from beluga_model_respbunloading import (
    State, UnloadBeluga, LoadBeluga, PickUpRack, PutDownRack,
    DeliverToHangar, GetFromHangar, SwitchToNextBeluga, RegisterOutgoingJig,
    load_instance_from_json, is_terminal_state
)


# =========================
# Exceptions
# =========================

class PlanValidationError(Exception):
    """Erreur levée quand une action du plan est invalide ou inapplicable."""
    pass


# =========================
# Désérialisation des actions
# =========================

def reconstruct_action(action_dict: Dict[str, Any]) -> Any:
    name = action_dict.get("name")

    mapping = {
        "unload_beluga": UnloadBeluga,
        "load_beluga": LoadBeluga,
        "pick_up_rack": PickUpRack,
        "put_down_rack": PutDownRack,
        "deliver_to_hangar": DeliverToHangar,
        "get_from_hangar": GetFromHangar,
        "switch_to_next_beluga": SwitchToNextBeluga,
        "register_outgoing_jig": RegisterOutgoingJig,
    }

    if name not in mapping:
        raise PlanValidationError(f"Action inconnue dans le JSON : {name}")

    cls = mapping[name]

    try:
        if name in ["unload_beluga", "load_beluga"]:
            return cls(jig=action_dict["j"], beluga=action_dict["b"], trailer=action_dict["t"])

        elif name in ["pick_up_rack", "put_down_rack"]:
            return cls(
                jig=action_dict["j"],
                trailer=action_dict["t"],
                rack=action_dict["r"],
                side=action_dict["s"],
            )

        elif name == "deliver_to_hangar":
            return cls(
                jig=action_dict["j"],
                hangar=action_dict.get("h", ""),
                trailer=action_dict["t"],
                production_line=action_dict.get("pl", ""),
            )

        elif name == "get_from_hangar":
            return cls(
                jig=action_dict["j"],
                hangar=action_dict["h"],
                trailer=action_dict["t"],
            )

        elif name == "switch_to_next_beluga":
            return cls()

        elif name == "register_outgoing_jig":
            return cls(jig=action_dict["j"], trailer=action_dict["t"])

    except KeyError as e:
        raise PlanValidationError(f"Paramètre {e} manquant pour l'action {name}")


# =========================
# Simulation + scoring
# =========================

def evaluate_plan(initial_state: State, plan_actions: List[Dict[str, Any]]) -> Dict[str, Any]:
    s = initial_state.copy()
    actions_executed = 0

    total_to_deliver = sum(len(pl.schedule) for pl in s.production_lines.values())

    try:
        for i, action_data in enumerate(plan_actions):
            action = reconstruct_action(action_data)

            if not action.is_applicable(s):
                raise PlanValidationError(f"Action {i} ({action.name}) non applicable")

            s = action.apply(s)
            actions_executed += 1

        delivered = sum(len(d) for d in s.production_line_deliveries.values())
        completion_rate = delivered / total_to_deliver if total_to_deliver > 0 else 1.0

        combined_score = (
            0.6 * completion_rate
            + 0.2 * (1.0 / (1 + actions_executed))
            + 0.2 * (1.0 if is_terminal_state(s) else 0.0)
        ) * 100

        return {
            "validity": 1.0,
            "completion_rate": float(completion_rate),
            "actions_count": actions_executed,
            "is_terminal": 1.0 if is_terminal_state(s) else 0.0,
            "score": completion_rate * 100,
            "combined_score": combined_score,
        }

    except PlanValidationError as e:
        print(f"ÉCHEC DE VALIDATION : {e}")
        return {
            "validity": 0.0,
            "completion_rate": 0.0,
            "actions_count": actions_executed,
            "is_terminal": 0.0,
            "score": 0.0,
            "combined_score": 0.0,
            "error": str(e),
        }


# =========================
# Orchestrateur OpenEvolve
# =========================

def run_evaluation(program_path: str, instance_path: str):
    print(f"--- Démarrage de l'évaluation : {program_path} ---")
    start_time = time.time()

    try:
        result = subprocess.run(
            [sys.executable, program_path, instance_path],
            timeout=130,
            capture_output=True,
            text=True,
        )

        print("STDOUT:\n", result.stdout)
        print("STDERR:\n", result.stderr)

        if result.returncode != 0:
            raise RuntimeError("Le programme candidat a crashé")

    except Exception as e:
        print(f"Erreur fatale lors de l'exécution du script : {e}")
        return {
            "validity": 0.0,
            "completion_rate": 0.0,
            "actions_count": 0,
            "is_terminal": 0.0,
            "score": 0.0,
            "combined_score": 0.0,
            "error": "execution_failed",
            "eval_time": time.time() - start_time,
        }

    result_path = os.path.join(os.getcwd(), "/home/aichatou/ProjetBeluga/belugaModel/nv/res_problem_143_s185_j5_r2_oc28_f3.json")
    if not os.path.exists(result_path):
        return {
            "validity": 0.0,
            "completion_rate": 0.0,
            "actions_count": 0,
            "is_terminal": 0.0,
            "score": 0.0,
            "combined_score": 0.0,
            "error": "result.json introuvable",
            "eval_time": time.time() - start_time,
        }

    with open(result_path, "r", encoding="utf-8") as f:
        plan = json.load(f)

    initial_state = load_instance_from_json(instance_path)
    metrics = evaluate_plan(initial_state, plan)
    metrics["eval_time"] = time.time() - start_time

    return metrics


# =========================
# API OpenEvolve
# =========================

def evaluate(program_path, instance_path=None):
    if instance_path is None:
        instance_path = "/home/aichatou/ProjetBeluga/evaluation/problem_143_s185_j5_r2_oc28_f3.json"
    return run_evaluation(program_path, instance_path)


# =========================
# Test manuel
# =========================

if __name__ == "__main__":
    res = run_evaluation(
        "beluga_model_respbunloading.py",
        "/home/aichatou/ProjetBeluga/evaluation/problem_143_s185_j5_r2_oc28_f3.json",
    )
    print("\n--- RÉSULTATS FINAUX ---")
    print(json.dumps(res, indent=4))
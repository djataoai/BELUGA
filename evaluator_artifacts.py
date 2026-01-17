import json
import os
import time
import subprocess
import sys
import traceback
from typing import List, Dict, Any

from openevolve.evaluation_result import EvaluationResult

# ===== Import du modèle Beluga =====
from beluga_model_avecjsoncorrect import (
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
# Reconstruction des actions
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
        raise PlanValidationError(f"Action inconnue : {name}")

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
            return cls(next_beluga=action_dict["b"])

        elif name == "register_outgoing_jig":
            return cls(jig=action_dict["j"], trailer=action_dict["t"])

    except KeyError as e:
        raise PlanValidationError(f"Paramètre manquant {e} pour l'action {name}")


# =========================
# Simulation + scoring
# =========================

def evaluate_plan(initial_state: State, plan_actions: List[Dict[str, Any]]) -> EvaluationResult:
    s = initial_state.copy()
    actions_executed = 0

    total_to_deliver = sum(len(pl.schedule) for pl in s.production_lines.values())

    try:
        for i, action_data in enumerate(plan_actions):
            action = reconstruct_action(action_data)

            if not action.is_applicable(s):
                raise PlanValidationError(
                    f"Action {i} ({action.name}) non applicable"
                )

            s = action.apply(s)
            actions_executed += 1

        delivered = sum(len(d) for d in s.production_line_deliveries.values())
        completion_rate = delivered / total_to_deliver if total_to_deliver > 0 else 1.0

        combined_score = (
            0.6 * completion_rate
            + 0.2 * (1.0 / (1 + actions_executed))
            + 0.2 * (1.0 if is_terminal_state(s) else 0.0)
        ) * 100

        return EvaluationResult(
            metrics={
                "validity": 1.0,
                "completion_rate": float(completion_rate),
                "actions_count": actions_executed,
                "is_terminal": 1.0 if is_terminal_state(s) else 0.0,
                "score": completion_rate * 100,
                "combined_score": combined_score,
            },
            artifacts={
                "plan_length": actions_executed,
                "terminal_state": bool(is_terminal_state(s)),
            }
        )

    except PlanValidationError as e:
        return EvaluationResult(
            metrics={
                "validity": 0.0,
                "completion_rate": 0.0,
                "actions_count": actions_executed,
                "is_terminal": 0.0,
                "score": 0.0,
                "combined_score": 0.0,
            },
            artifacts={
                "error_type": "plan_validation",
                "error_message": str(e),
                "failed_action_index": actions_executed,
                "suggestion": "Vérifier les préconditions des actions",
            }
        )


# =========================
# Orchestrateur OpenEvolve
# =========================

def run_evaluation(program_path: str, instance_path: str) -> EvaluationResult:
    start_time = time.time()

    try:
        result = subprocess.run(
            [sys.executable, program_path, instance_path],
            timeout=130,
            capture_output=True,
            text=True,
        )

    except subprocess.TimeoutExpired:
        print(f"--- DEBUG SUBPROCESS TIMEOUT ---")
        print(f"Timeout after 130 seconds")
        print(f"------------------------------")
        return EvaluationResult(
            metrics={
                "validity": 0.0,
                "completion_rate": 0.0,
                "actions_count": 0,
                "is_terminal": 0.0,
                "score": 0.0,
                "combined_score": 0.0,
                "eval_time": time.time() - start_time,
            },
            artifacts={
                "error_type": "timeout",
                "timeout_seconds": 130,
                "suggestion": "Réduire la longueur du plan généré",
            }
        )

    if result.returncode != 0:
        
        print(f"--- DEBUG SUBPROCESS CRASH ---")
        print(f"Exit Code: {result.returncode}")
        print(f"Stderr: {result.stderr}")
        print(f"Stdout: {result.stdout}")
        print(f"------------------------------")
        return EvaluationResult(
            metrics={
                "validity": 0.0,
                "completion_rate": 0.0,
                "actions_count": 0,
                "is_terminal": 0.0,
                "score": 0.0,
                "combined_score": 0.0,
                "eval_time": time.time() - start_time,
            },
            artifacts={
                "error_type": "execution_crash",
                
                "stderr": result.stderr,
            }
        )

    #result_path = os.path.join(os.getcwd(), "result.json")
    result_path = os.path.join(r"/Users/teichteil_fl/Projects/Tuples/ProjetEtudiantENAC/BELUGA", 'result.json')
    if not os.path.exists(result_path):
        print(f"--- DEBUG MISSING RESULT FILE ---")
        print(f"result.json introuvable")
        print(f"Stderr: {result.stderr}")
        print(f"---------------------------------")
        return EvaluationResult(
            metrics={
                "validity": 0.0,
                "completion_rate": 0.0,
                "actions_count": 0,
                "is_terminal": 0.0,
                "score": 0.0,
                "combined_score": 0.0,
                "eval_time": time.time() - start_time,
            },
            artifacts={
                "error_type": "missing_output",
                "error_message": "result.json introuvable",
                "stderr": result.stderr,
            }
        )

    try:
        with open(result_path, "r", encoding="utf-8") as f:
            plan = json.load(f)

        initial_state = load_instance_from_json(instance_path)
        eval_result = evaluate_plan(initial_state, plan)

        eval_result.metrics["eval_time"] = time.time() - start_time
        
        eval_result.artifacts["stderr"] = result.stderr

        return eval_result

    except Exception as e:
        print(f"--- DEBUG EVALUATION CRASH ---")
        print(f"Erreur lors de l'évaluation du plan : {e}")
        traceback.print_exc()
        print(f"--------------------------------")
        return EvaluationResult(
            metrics={
                "validity": 0.0,
                "completion_rate": 0.0,
                "actions_count": 0,
                "is_terminal": 0.0,
                "score": 0.0,
                "combined_score": 0.0,
                "eval_time": time.time() - start_time,
            },
            artifacts={
                "error_type": "evaluation_crash",
                "errors": [
                f"PythonException: {type(e).__name__}: {e}"
            ]
            }
        )


# =========================
# API OpenEvolve
# =========================

def evaluate(program_path, instance_path=None):
    if instance_path is None:
        #instance_path = r'C:\Users\papaa\openevolve\examples\beluga\problem_103_s145_j266_r20_oc21_f173.json'
        instance_path= r"/Users/teichteil_fl/Projects/Tuples/ProjetEtudiantENAC/BELUGAproblem_103_s145_j266_r20_oc21_f173.json"
        #instance_path = "problem_143_s185_j5_r2_oc28_f3.json"
    return run_evaluation(program_path, instance_path)
# =========================
# Test manuel
# =========================
def evaluation_result_to_dict(res):
    return {
        "metrics": res.metrics,
        "artifacts": res.artifacts,
    }




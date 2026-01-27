import json
import os
import time
import subprocess
import sys
import traceback
from typing import List, Dict, Any
from tqdm import tqdm
import uuid

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


import numpy as np

def evaluate_plan(initial_state: State, plan_actions: List[Dict[str, Any]]) -> EvaluationResult:
    s = initial_state.copy()
    actions_executed = 0
    
    # Paramètres de pondération s
    alpha = 0.7
    beta = 0.0004
    
    # Données de l'instance pour les ratios B et C
    total_jigs_in_problem = sum(len(pl.schedule) for pl in s.production_lines.values())
    total_racks_in_problem = len(s.racks)

    try:
        for i, action_data in enumerate(plan_actions):
            action = reconstruct_action(action_data)

            if not action.is_applicable(s):
                raise PlanValidationError(
                    f"Action {i} ({action.name}) non applicable"
                )

            s = action.apply(s)
            actions_executed += 1

      
        
        # A : Goal reached (S dans la formule du challenge)
        goal_reached = 1.0 if is_terminal_state(s) else 0.0
        
        # B : Relative plan length (L / jigs)
        B = actions_executed / total_jigs_in_problem if total_jigs_in_problem > 0 else 0
        
        # C : Inverse relative number of free racks (racks / (F + 1))
        free_racks = len([r_content for r_content in s.rack_contents.values() if len(r_content) == 0])
        C = total_racks_in_problem / (1 + free_racks)
        
        # Formule : score = A * exp(- alpha * B - beta * C)
        raw_score = goal_reached * np.exp(- alpha * B - beta * C)
        final_score_scaled = raw_score * 100

        # --- CONDITION DE VALIDITÉ ---
        # "validity" vaut 1 uniquement si le score du challenge est strictement positif
        
        is_valid = 1.0 if raw_score > 0 else 0.0

        return EvaluationResult(
            metrics={
                "validity": is_valid,
                "score": float(final_score_scaled),
                "goal_reached": goal_reached,
                "actions_count": actions_executed,
                "free_racks": free_racks,
                "completion_rate": goal_reached 
            },
            artifacts={
                "is_terminal": bool(goal_reached),
                "plan_length_ratio": float(B),
                "rack_congestion_ratio": float(C),
                "raw_value": float(raw_score)
            }
        )

    except PlanValidationError as e:
        # En cas d'erreur ou plan inapplicable, score = 0 donc validity = 0
        return EvaluationResult(
            metrics={
                "validity": 0.0,
                "score": 0.0,
                "goal_reached": 0.0,
                "actions_count": actions_executed,
            },
            artifacts={
                "error_type": "plan_validation",
                "error_message": str(e),
                "failed_action_index": actions_executed
            }
        )

# =========================
# Orchestrateur OpenEvolve
# =========================
BASE_DIR = r"/Users/teichteil_fl/Projects/Tuples/ProjetEtudiantENAC/BELUGA"
RESULTS_DIR = os.path.join(BASE_DIR, "results")
INSTANCES_DIR = os.path.join(BASE_DIR, "belugagit")

def run_evaluation(program_path: str, instance_path: str) -> EvaluationResult:
    start_time = time.time()
    instance_name = os.path.splitext(os.path.basename(instance_path))[0]
    run_id = uuid.uuid4().hex[:8]
    result_filename = f"result_{instance_name}_{run_id}.json"
    result_path = os.path.join(RESULTS_DIR, result_filename)
    

    try:
        result = subprocess.run(
            [
                sys.executable,
                program_path,
                instance_path,
                result_path,   
            ],
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

   
    if not os.path.exists(result_path):
        print(f"--- DEBUG MISSING RESULT FILE ---")
        print(f"{result_path} introuvable")
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
        eval_result.artifacts["output_path"] = result_path
        eval_result.artifacts["instance"] = instance_name
        os.remove(result_path)


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

os.makedirs(RESULTS_DIR, exist_ok=True)


def evaluate_all(program_path, folder_path):
    if not os.path.exists(folder_path):
        print(f"Erreur : Dossier {folder_path} introuvable.")
        return []

    files = [f for f in os.listdir(folder_path) if f.endswith('.json')]
    all_results = []
    
    print(f"\n>>> Lancement de l'évaluation sur {len(files)} instances...")

    for filename in tqdm(files, desc="Progression", unit="instance"):
        path = os.path.join(folder_path, filename)
        res = run_evaluation(program_path, path)
        
        score = res.metrics.get("score", 0.0)
        valid = res.metrics.get("validity") == 1.0
        all_results.append((filename, score, "SUCCESS" if valid else "FAILED"))

    if all_results:
        avg_score = sum(r[1] for r in all_results) / len(all_results)
        print("\n" + "="*50)
        print(f"MOYENNE GLOBALE  : {avg_score:.2f} / 100")
        print("="*50)

    return all_results

def evaluate(program_path, folder_path=None):
    target = folder_path 
    
    if os.path.isdir(target):
        results = evaluate_all(program_path, target)
        avg = sum(r[1] for r in results) / len(results) if results else 0
        return EvaluationResult(
            metrics={"score": float(avg), "validity": 1.0 if avg > 0 else 0.0},
            artifacts={"details": results}
        )
    return run_evaluation(program_path, target)


# =========================
# Test manuel
# =========================
def evaluation_result_to_dict(res):
    return {
        "metrics": res.metrics,
        "artifacts": res.artifacts,
    }

if __name__ == "__main__":
    SOLVER = "beluga_model_avecjsoncorrect.py"
    evaluate(SOLVER, INSTANCES_DIR)




import json
import os
import time
import subprocess
import traceback
from typing import List, Dict, Any, Optional

# Importation des composants du modèle Beluga
from beluga_model_avecjsoncorrect import (
    State, UnloadBeluga, LoadBeluga, PickUpRack, PutDownRack, 
    DeliverToHangar, SwitchToNextBeluga, RegisterOutgoingJig,
    load_instance_from_json, is_terminal_state
)

class PlanValidationError(Exception):
    """Erreur levée quand une action du plan est invalide ou inapplicable."""
    pass

def reconstruct_action(action_dict: Dict[str, Any]) -> Any:
    """
    DÉSERIALISATION : 
    Transforme un dictionnaire JSON (donnée brute) en objet Action (logique).
    Mappe les clés courtes 'j, b, t, r, s' vers les arguments des classes Python.
    """
    name = action_dict.get("name")
    
    mapping = {
        "unload_beluga": UnloadBeluga,
        "load_beluga": LoadBeluga,
        "pick_up_rack": PickUpRack,
        "put_down_rack": PutDownRack,
        "deliver_to_hangar": DeliverToHangar,
        "switch_to_next_beluga": SwitchToNextBeluga,
        "register_outgoing_jig": RegisterOutgoingJig
    }
    
    if name not in mapping:
        raise PlanValidationError(f"Action inconnue dans le JSON : {name}")
    
    cls = mapping[name]
    
    try:
        # Mapping spécifique selon les besoins de chaque constructeur de classe
        if name in ["unload_beluga", "load_beluga"]:
            return cls(jig=action_dict["j"], beluga=action_dict["b"], trailer=action_dict["t"])
        
        elif name in ["pick_up_rack", "put_down_rack"]:
            return cls(jig=action_dict["j"], trailer=action_dict["t"], 
                       rack=action_dict["r"], side=action_dict["s"])
        
        elif name == "deliver_to_hangar":
            return cls(jig=action_dict["j"], hangar=action_dict.get("h", ""), 
                       trailer=action_dict["t"], production_line=action_dict.get("pl", ""))
        
        elif name == "switch_to_next_beluga":
            return cls(next_beluga=action_dict["b"])
        
        elif name == "register_outgoing_jig":
            return cls(jig=action_dict["j"], trailer=action_dict["t"])
            
    except KeyError as e:
        raise PlanValidationError(f"Paramètre {e} manquant dans le JSON pour l'action {name}")

    return None

def evaluate_plan(initial_state: State, plan_actions: List[Dict[str, Any]]) -> Dict[str, Any]:
    """
    SIMULATION ET CALCUL DES MÉTRIQUES :
    Rejoue le plan étape par étape sur une copie de l'état initial.
    """
    s = initial_state.copy()
    actions_executed = 0
    
    # Objectif : total de pièces à livrer sur toutes les lignes de production
    total_to_deliver = sum(len(pl.schedule) for pl in s.production_lines.values())
    
    try:
        for i, action_data in enumerate(plan_actions):
            action = reconstruct_action(action_data)
            
            # Vérification de la validité physique de l'action
            if not action.is_applicable(s):
                raise PlanValidationError(f"Action {i} ({action.name}) non applicable.")
            
            # Mise à jour de l'état du monde
            s = action.apply(s)
            
            # Log de progression pour le débug
            current_deliveries = sum(len(d) for d in s.production_line_deliveries.values())
            print(f"Action {i}: {action.name} | Livraisons cumulées: {current_deliveries}")
            actions_executed += 1
            
    except PlanValidationError as e:
        # Si une action échoue, le plan perd sa validité
        print(f"ÉCHEC DE VALIDATION : {e}")
        return {
            "validity": 0.0,
            "completion_rate": 0.0,
            "actions_count": actions_executed,
            "error": str(e)
        }

    # Calcul des résultats finaux après exécution de toutes les actions
    delivered = sum(len(d) for d in s.production_line_deliveries.values())
    completion_rate = (delivered / total_to_deliver) if total_to_deliver > 0 else 1.0
    
    return {
        "validity": 1.0,                       # Le plan est physiquement possible
        "completion_rate": float(completion_rate), # % de l'objectif atteint
        "actions_count": actions_executed,     # Longueur du chemin utilisé
        "is_terminal": 1.0 if is_terminal_state(s) else 0.0, # L'entrepôt est-il à l'arrêt final ?
        "score": completion_rate * 100         # Score global (priorité à la livraison)
    }

def run_evaluation(program_path: str, instance_path: str):
    """
    ORCHESTRATEUR :
    Lance le script de l'utilisateur, récupère le JSON et lance l'évaluation.
    """
    print(f"--- Démarrage de l'évaluation : {program_path} ---")
    
    start_time = time.time()
    try:
        # Exécution du script externe avec limite de temps (30s)
        subprocess.run(
            ["python", program_path, instance_path],
            timeout=30,
            check=True,
            capture_output=True
        )
    except Exception as e:
        print(f"Erreur fatale lors de l'exécution du script : {e}")
        return {"score": 0, "error": "execution_failed"}

    # Vérification de la présence du fichier de sortie
    if not os.path.exists("result.json"):
        return {"score": 0, "error": "result.json introuvable"}
        
    with open("result.json", "r") as f:
        plan = json.load(f)

    # Initialisation du simulateur avec le problème d'origine
    initial_state = load_instance_from_json(instance_path)
    
    # Calcul des métriques
    metrics = evaluate_plan(initial_state, plan)
    metrics["eval_time"] = time.time() - start_time
    
    return metrics

if __name__ == "__main__":
    # Point d'entrée pour test manuel
    res = run_evaluation(
        "beluga_model_avecjsoncorrect.py", 
        "problem_103_s145_j266_r20_oc21_f173.json"
    )
    print("\n--- RÉSULTATS FINAUX ---")
    print(json.dumps(res, indent=4))

"""
OpenEvolve evaluator for Beluga planning problem
Deterministic version
"""

import subprocess
import tempfile
import os
import sys
import time
import pickle
import traceback


class TimeoutError(Exception):
    pass


def run_with_timeout(program_path, timeout_seconds=600):
    """
    Execute a candidate planner in a subprocess and retrieve evaluation outcome.
    """

    with tempfile.NamedTemporaryFile(suffix=".py", delete=False) as temp_file:
        wrapper_code = f"""
import sys
import os
import pickle
import traceback

# Make candidate program importable
sys.path.insert(0, os.path.dirname("{program_path}"))

try:
    from evaluator import DeterministicEvaluator
    from beluga_problem import make_initial_state
    import importlib.util

    # Load candidate planner
    spec = importlib.util.spec_from_file_location("planner", "{program_path}")
    planner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(planner)

    # Build initial state
    initial_state = make_initial_state()

    # Build plan using candidate code
    plan = planner.build_plan(initial_state)

    # Evaluate plan
    evaluator = DeterministicEvaluator()
    outcome = evaluator.evaluate(plan)

    # Extract minimal metrics for OpenEvolve
    result = {{
        "combined_score": float(outcome.score["value"]),
        "goal_reached": bool(outcome.goal_reached),
        "invalid_plan": bool(outcome.invalid_plan),
        "plan_length": len(plan.actions) if plan is not None else 0,
        "free_racks": int(outcome.free_racks),
    }}

    with open("{temp_file.name}.results", "wb") as f:
        pickle.dump(result, f)

except Exception as e:
    with open("{temp_file.name}.results", "wb") as f:
        pickle.dump({{
            "error": str(e),
            "traceback": traceback.format_exc()
        }}, f)
"""
        temp_file.write(wrapper_code.encode())
        wrapper_path = temp_file.name

    results_path = f"{wrapper_path}.results"

    try:
        process = subprocess.Popen(
            [sys.executable, wrapper_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )

        try:
            stdout, stderr = process.communicate(timeout=timeout_seconds)

            if stderr:
                print("Subprocess stderr:")
                print(stderr.decode())

            if process.returncode != 0:
                raise RuntimeError(f"Subprocess exited with code {process.returncode}")

            if not os.path.exists(results_path):
                raise RuntimeError("Results file not found")

            with open(results_path, "rb") as f:
                result = pickle.load(f)

            if "error" in result:
                raise RuntimeError(result["error"] + "\n" + result.get("traceback", ""))

            return result

        except subprocess.TimeoutExpired:
            process.kill()
            process.wait()
            raise TimeoutError("Planner timed out")

    finally:
        if os.path.exists(wrapper_path):
            os.unlink(wrapper_path)
        if os.path.exists(results_path):
            os.unlink(results_path)


def evaluate(program_path):
    """
    OpenEvolve evaluation entry point
    """

    start_time = time.time()

    try:
        result = run_with_timeout(program_path, timeout_seconds=600)

        combined_score = result["combined_score"]
        validity = (
            1.0
            if result["goal_reached"] and not result["invalid_plan"]
            else 0.0
        )

        eval_time = time.time() - start_time

        return {
            "combined_score": float(combined_score),
            "validity": float(validity),
            "eval_time": float(eval_time),
            "plan_length": int(result["plan_length"]),
            "free_racks": int(result["free_racks"]),
        }

    except TimeoutError:
        return {
            "combined_score": 0.0,
            "validity": 0.0,
            "eval_time": float(time.time() - start_time),
            "error": "Timeout",
        }

    except Exception as e:
        print("Evaluation failed:", str(e))
        traceback.print_exc()
        return {
            "combined_score": 0.0,
            "validity": 0.0,
            "eval_time": 0.0,
            "error": str(e),
        }

import subprocess
import os
import re

directories = [
    "arrays_slicing", "components", "comptime", "control_flow",
    "intrinsics", "literals", "operators", "registers", "sim"
]

results = []

def run_vctx(cmd):
    try:
        proc = subprocess.run(
            ["py", "-3.14t", "-X", "gil=0", "../vctx-cli.py"] + cmd,
            capture_output=True, text=True, cwd="vctx-examples"
        )
        return proc.stdout + proc.stderr, proc.returncode
    except Exception as e:
        return str(e), 1

# Find the files added in the roadmap
# (Using the list we know we created)
files_to_check = []
for d in directories:
    dir_path = os.path.join("vctx-examples", d)
    if os.path.exists(dir_path):
        for f in os.listdir(dir_path):
            if f.endswith(".vctx"):
                files_to_check.append(os.path.join(d, f))

print(f"Checking {len(files_to_check)} files...")

report = {
    "Example Bug": [],
    "Compiler Bug": [],
    "Passed": []
}

for f in files_to_check:
    pkg = f.replace(os.sep, ".").replace(".vctx", "")
    output, code = run_vctx(["sim", pkg])
    
    if code == 0 and "passed, 0 failed" in output:
        report["Passed"].append(f)
        continue

    # Determine cause
    cause = "Unknown"
    
    # 1. Example Bug: Syntax Error (wire :=)
    if "char='='" in output or "expected=[':']" in output:
        cause = "Example Bug (Syntax: wire := instead of wire : type =)"
    
    # 2. Example Bug: Reserved Identifier (s1, u128, etc)
    elif "[E_RESERVED_IDENTIFIER]" in output:
        cause = "Example Bug (Reserved Identifier: signal name looks like a type)"
        
    # 3. Example Bug: Assertion Failed (Logic Error in Test)
    elif "[E_SIM_ASSERTION_FAILED]" in output:
        # Check if it's a known math identity. If 1+1 != 2, it's a compiler bug.
        # If it's a complex multi-cycle thing, could be either.
        cause = "Possible Compiler Bug (Logic/Math Failure) or Example Bug"
        if "1 + 1 = 2" in output or "Identity" in output:
             cause = "Compiler Bug (Math Identity Failure)"

    # 4. Compiler Bug: Arcilator/Symbol Failure
    elif "[E_SIM_ARCILATOR_FAILED]" in output or "Failed to materialize symbols" in output:
        cause = "Compiler Bug (Arcilator/Symbol Materialization)"
        
    # 5. Compiler Bug: Type System / Specialized Mismatch
    elif "[E_WIDTH_MISMATCH_SPECIALIZED]" in output:
        cause = "Compiler Bug (Specialization/Promotion Logic)"
        
    # 6. Compiler Bug: Literal Port Binding
    elif "[E_PORT_WIDTH_MISMATCH]" in output and "expects u8" in output:
        cause = "Compiler Bug (Untyped Literal Port Binding Inference)"

    # 7. Example Bug: Missing Sim Block
    elif "[E_SIM_NO_SIM_BLOCKS]" in output:
        cause = "Example Bug (Sim block name mismatch or Parse failed earlier)"

    category = "Compiler Bug" if "Compiler Bug" in cause else "Example Bug"
    report[category].append(f"{f}: {cause}")

print("\n--- DIAGNOSTIC REPORT ---\n")
print(f"TOTAL FILES CHECKED: {len(files_to_check)}")
print(f"PASSED: {len(report['Passed'])}\n")

print("=== EXAMPLE BUGS ===")
for item in report["Example Bug"]:
    print(f"- {item}")

print("\n=== COMPILER BUGS ===")
for item in report["Compiler Bug"]:
    print(f"- {item}")

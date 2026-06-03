import os
import re

directories = [
    "arrays_slicing", "components", "comptime", "control_flow",
    "intrinsics", "literals", "operators", "registers", "sim"
]

def get_type_from_context(name, content):
    # Find width assertion: assert(width(name) == N)
    width_match = re.search(fr"assert\(width\({name}\)\s*==\s*(\d+)", content)
    # Find signedness assertion: assert(is_signed(name) == true/false)
    signed_match = re.search(fr"assert\(is_signed\({name}\)\s*==\s*(true|false)", content)
    
    width = int(width_match.group(1)) if width_match else None
    
    is_signed = False
    if signed_match:
        is_signed = (signed_match.group(1) == "true")
    else:
        # Heuristics based on name
        if name.startswith("s") and not name.startswith("sum"):
            is_signed = True
        elif "mixed_res" in name or "mixed_large" in name:
            is_signed = True
        elif "sn" in name or "rs" in name or "sy" in name:
            is_signed = True

    if name.startswith("b_") or name.endswith("_bool") or name in ["bt", "bf", "cond", "en"]:
        return "bool"
    
    if width:
        # Standard power-of-2 mapping
        if width in [1, 2, 4, 8, 16, 32, 64, 128]:
            base = "s" if is_signed else "u"
            return f"{base}{width}"
        else:
            base = "s" if is_signed else "u"
            return f"{base}[{width}]"
    
    # Fallback to name heuristic for width
    if "8" in name: w = 8
    elif "16" in name: w = 16
    elif "32" in name: w = 32
    elif "64" in name: w = 64
    elif "128" in name: w = 128
    else: w = 8 # Default
    
    base = "s" if is_signed else "u"
    return f"{base}{w}"

def patch_file(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    
    lines = content.splitlines()
    new_lines = []
    changed = False
    
    for line in lines:
        # Match only invalid wire := syntax
        # e.g. wire u8_res := u4_a * u4_b
        match = re.search(r"^\s*wire\s+(\w+)\s*:=\s*(.*)$", line)
        if match:
            name = m_name = match.group(1)
            expr = match.group(2)
            # Remove trailing comments
            expr = re.sub(r"//.*$", "", expr).strip()
            
            t = get_type_from_context(name, content)
            
            indent = line[:line.find("wire")]
            new_line = f"{indent}wire {name}: {t} = {expr}"
            new_lines.append(new_line)
            changed = True
        else:
            new_lines.append(line)
            
    if changed:
        with open(file_path, 'w') as f:
            f.write("\n".join(new_lines) + "\n")
        return True
    return False

total_patched = 0
for d in directories:
    dir_path = os.path.join("vctx-examples", d)
    if not os.path.exists(dir_path): continue
    for f in os.listdir(dir_path):
        if f.endswith(".vctx"):
            if patch_file(os.path.join(dir_path, f)):
                total_patched += 1
                print(f"Patched: {os.path.join(d, f)}")

print(f"\nTotal files patched: {total_patched}")

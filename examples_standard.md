# Vctx Examples Standard and Best Practices Guide

This document establishes the structure, naming conventions, and best practices for creating and maintaining code examples and test cases in the `vctx-examples/` suite. Following this standard ensures that examples serve as clear documentation for users and as reliable test targets for the compiler.

---

## 1. Directory Structure

Examples are organized by feature area or testing objective. The layout is divided into **positive (passing) feature suites** and **negative (failing) test suites**:

```text
vctx-examples/
├── vctx.toml                      # Examples project manifest
├── operators/                     # Addition, shifting, casting, comparisons
├── control_flow/                  # when priority muxes, conditional logic
├── comptime/                      # Comptime functions, recursion, comptime containers
├── functions/                     # Hardware function declarations and calls
├── imports/                       # Multi-file package import examples
├── std/                           # Standard library usage
├── gameboy/                       # Large-scale integration/validation model
├── on_purpose_failures_check/     # Negative tests expected to fail at 'vctx check'
├── on_purpose_failures_mlir/      # Negative tests expected to fail at 'vctx mlir' (lowering)
├── on_purpose_failures_sim/       # Negative tests expected to fail at 'vctx sim' (runtime)
└── examples_standard.md           # This document
```

### The `vctx.toml` Manifest
The manifest excludes expected failure directories from bulk simulation and verification commands to avoid false positives:

```toml
[project]
name = "vctx-examples"
exclude_path_parts = [
    "on_purpose_failures_sim",
    "on_purpose_failures_check",
    "on_purpose_failures_mlir",
]
```

---

## 2. File Conventions & Annotation Header

Every `.vctx` file must start with a standardized header containing the spec citation and expected test outcomes.

### Header Syntax
```vctx
// spec: §<section_number>[, §<another_section>]
// expect: <pass | fail <phase> [ERROR_CODE]>
// Description: A short 1-line description of the tested behavior.
```

- **`spec`**: The section of `docs/language-spec.md` that dictates the feature's behavior.
- **`expect`**: Tells runners how to validate this file:
  - `pass`: The file should compile, pass all checks, and run simulations without error.
  - `fail check [E_CODE]`: The static check phase (`vctx check`) must fail with the given error code.
  - `fail mlir [E_CODE]`: The code passes checks but fails lowering (`vctx mlir`) with the given error code.
  - `fail sim [E_CODE]`: The code compiles and checks, but the simulator (`vctx sim`) fails at runtime (e.g. an assertion failure).

### Positive Example Header (Pass)
```vctx
// spec: §7, §7.5
// expect: pass
// Description: Verifies unsigned addition behavior and overflow wrap-around.
```

### Negative Example Header (Fail Check)
```vctx
// spec: §7.5
// expect: fail check [E_BITWISE_SIGNED_OPERAND]
// Description: Rejects bitwise operations on signed operands without casting.
```

---

## 3. Best Practices for Positive Examples

Positive examples demonstrate correct language syntax and semantics.

1. **Self-Containment**: A single example file should define both the target components and a simulation block (`sim`) to verify them.
2. **Descriptive Assertions**: Include a clear explanation in every simulation assert statement detailing what is being tested.
   ```vctx
   assert(sum == 30, "10 + 20 must equal 30")
   ```
3. **Avoid Hardcoded Logic in Root Components**: Use parameterized types and widths to show generic capability where appropriate, keeping code flexible.
4. **Use Explicit Port Mapping**: Prefer `port -- expr` connections for component instances. Positional mapping is allowed for simple components but named connections are preferred.
5. **Comptime Initializers**: Explicitly initialize wires/registers with `=` to demonstrate reset and startup states.

---

## 4. Best Practices for Negative Examples

Negative examples ensure the compiler fails predictably under illegal conditions.

1. **Target Single Errors**: Do not combine unrelated syntax or type violations. Each file should isolate exactly one error code.
2. **Locate in the Correct Directory**:
   - `vctx check` errors go to `on_purpose_failures_check/`.
   - `vctx mlir` lowering errors go to `on_purpose_failures_mlir/`.
   - `vctx sim` runtime/assertion failures go to `on_purpose_failures_sim/`.
3. **Verify the Diagnostic Code**: The error message emitted by the compiler must contain the exact code mapped in the `expect:` header (e.g. `[E_WIDTH_MISMATCH]`).

---

## 5. Verification Framework

Vctx runs verification tests through two distinct mechanisms:

```mermaid
graph TD
    A[Test Suite Run] --> B[pyright / pytest tests/]
    A --> C[python run_on_purpose_failures.py]
    
    B --> B1[test_check_emit_parity.py]
    B1 --> B2[Checks PARITY_TABLE rows]
    
    C --> C1[Scans on_purpose_failures_* directories]
    C1 --> C2[Asserts compiler fails + outputs correct [E_...] code]
```

### 1. Verification Scripts (`run_on_purpose_failures.py`)
This script automatically executes all `.vctx` files in the negative directories and verifies that:
- The command returns a non-zero exit code (fails).
- The output includes the designated `[E_...]` error code.

To run it:
```bash
python vctx-examples/run_on_purpose_failures.py
```

### 2. Table-Driven Parity Tests (`tests/test_check_emit_parity.py`)
Critical check and lowering behaviors are registered in the `PARITY_TABLE` of [test_check_emit_parity.py](file:///C:/Users/Matt/Projects/vctx/vctx-lang/tests/test_check_emit_parity.py):

```python
PARITY_TABLE = (
    ("spec/generic_type_actual_array_pass.vctx", "supported", None),
    ("on_purpose_failures_check/generic_inst_out_port_width_mismatch.vctx", "reject_check", "E_PORT_WIDTH_MISMATCH"),
    # Add new coverage/hardening tests here
)
```

Adding tests to this table guarantees they are executed as part of the main `pytest` runner.

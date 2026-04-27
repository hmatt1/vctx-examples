# Expected-failure checklist (intern task list)

This repo has two **expected-fail** suites that are **excluded from bulk discovery** (see `vctx.toml`) and should be run **directly** by path:

- `on_purpose_failures_check/`: must **fail** under `vctx check <file>`
- `on_purpose_failures_sim/`: must **fail** under `vctx sim <file>`

Runner script: `run_on_purpose_failures.bat`

## Current state (as of today)

- Most of the **parse/type/comptime/scheduling** expected-fail cases are already implemented under `on_purpose_failures_check/`.
- The **expected-fail sims** under `on_purpose_failures_sim/` are implemented for assertion failures and a couple poke misuses.
- Some proposed cases are **blocked** because the compiler currently allows them (so they cannot be “expected fail” yet).
- Some proposed “lowering gap” cases are currently **`vctx mlir`-only** (they fail during MLIR emission, but `vctx check` does not consistently fail on them today). Those should not live in the `*_check` suite until the runner is extended to include `mlir` or `check` runs full lowering.

## Contract

- Each file should be **minimal** and should trigger **one clear failure**.
- Avoid “pileups” (multiple unrelated errors in one file).
- Include a 1–3 line header comment: `// Expected failure: ...`.
- Naming: `on_purpose_failures_{check|sim}/<category>_<what>.vctx`.

## Checklist: `on_purpose_failures_check/` (compile-time failures)

### Parsing / grammar (syntax)
- [x] `parse_unary_bang_not_supported.vctx`: use `!x` somewhere (parse error; vctx uses `not`/`~`)
- [x] `parse_when_missing_body.vctx`: missing brace / malformed `when` body
- [x] `parse_elsewhen_without_when.vctx`: `elsewhen` used without a leading `when`
- [x] `parse_malformed_slice_syntax.vctx`: `x[..3]` (malformed slice)
- [x] `parse_malformed_generic_angles.vctx`: `Foo<>(...)` (empty generic args)

### Name resolution / imports
- [x] `resolve_unknown_identifier.vctx`: reference an undeclared name in an expression
- [x] `import_missing_package.vctx`: `import does.not.exist`
- [x] `import_symbol_not_found.vctx`: import a real package, then reference a missing symbol (expression ref)
- [ ] `import_alias_collision.vctx`: two imports with the same alias (**BLOCKED**: compiler does not currently diagnose alias collisions)

### Type / width / signedness rules
- [x] `type_reg_assigned_with_comb_op_in_root.vctx`: `reg r; r := ...` outside `when`
- [x] `type_wire_assigned_with_seq_op.vctx`: `wire w; w <= ...`
- [x] `type_width_mismatch_assignment.vctx`: assign `u16` into `u8` without cast
- [ ] `type_signedness_mismatch_assignment.vctx`: assign `s8` into `u8` without cast (**BLOCKED**: current checker allows this in the attempted form)
- [x] `type_bad_port_connection_width.vctx`: instantiate component with mismatched port widths
- [ ] `type_ternary_arm_type_mismatch.vctx`: `cond ? u8_expr : u16_expr` (**BLOCKED**: current checker accepts the attempted form)

### Comptime-required failures (core dev contract)
See `comptime/checklist_overview.md` for intent.

- [x] `comptime_non_foldable_array_dim.vctx`: `T[N]` where `N` depends on runtime
- [x] `comptime_non_foldable_carrier_width.vctx`: `u<expr>` where `expr` depends on runtime
- [x] `comptime_non_foldable_generic_arg.vctx`: `Foo<expr>(...)` where `expr` depends on runtime
- [ ] `comptime_negative_array_dim.vctx`: dimension folds negative (**BLOCKED**: negative dims not rejected today)
- [ ] `comptime_negative_carrier_width.vctx`: width folds negative (**BLOCKED**: negative widths not rejected today)
- [x] `comptime_forbidden_runtime_position.vctx`: should produce a “comptime-required” style error

### Scheduling / MLIR emission failures
- [x] `mlir_comb_cycle_minimal_2.vctx`: another minimal comb loop shape (different from existing)
- [x] `mlir_comb_cycle_when_variant.vctx`: comb cycle expressed via `when` assignments
- [ ] `mlir_dynamic_bracket_slice_span_forbidden.vctx`: `x[hi..lo]` where span can’t be affine-proven (**MLIR-ONLY** today; fails under `vctx mlir`)
- [ ] `mlir_struct_field_access_not_lowered.vctx`: `struct`/`bundle` value with `a.b` in hardware path (**MLIR-ONLY** today; likely fails under `vctx mlir`)

### Illegal statements inside hardware `when` arms (only if this is a rule you want locked in)
- [ ] `when_arm_contains_assert.vctx`: put `assert(...)` inside a hardware `when` arm (**BLOCKED**: `check` currently accepts this)
- [ ] `when_arm_contains_cycle_or_poke.vctx`: put `cycle()`/`poke()` inside a hardware `when` arm (**BLOCKED**: `check` currently accepts this)

## Checklist: `on_purpose_failures_sim/` (runtime failures)

### Assertion failures (TAP/reporting)
- [x] `sim_one_fail_among_passes_2.vctx`: one failing assert surrounded by passes (tiny, stable)
- [x] `sim_two_failures_counting.vctx`: two failing asserts to verify summary counts
- [x] `sim_fail_after_poke.vctx`: `poke`, then fail (exercises trace/emit order)
- [x] `sim_fail_after_multiple_cycles.vctx`: only fails after N cycles (reg/sequential visibility)
- [x] `sim_fail_bool_not.vctx`: minimal boolean negation failure

### Harness misuse (only if sim enforces these at runtime)
- [x] `sim_poke_output_should_fail.vctx`: attempt to `poke` a DUT output (fails at sim compile/precheck with a clear message)
- [ ] `sim_poke_unknown_name_should_fail.vctx`: `poke` a non-existent signal/port name (**UNKNOWN**: only add if supported / can be made deterministic)

## Not in checklist originally, but implemented (sim suite)

- [x] `on_purpose_failure.vctx`: baseline “one assert fails” demo
- [x] `sim_poke_driven_wire_should_fail.vctx`: demonstrates poke misuse on a driven wire (currently fails via the follow-up assertion)

## Verification (what “done” means)

From the `vctx-examples` repo root:

- For `on_purpose_failures_check/*`:
  - `python ..\vctx-lang\vctx-cli.py check <file>` **must exit nonzero**
- For `on_purpose_failures_sim/*`:
  - `python ..\vctx-lang\vctx-cli.py sim <file>` **must exit nonzero**
- Or run everything:
  - `run_on_purpose_failures.bat` should exit 0 (no unexpected passes).

## Future: optional third suite for MLIR-only expected failures

If you want to lock down MLIR lowering gaps now (dynamic bracket slice span, struct field access lowering, etc.), consider adding:

- `on_purpose_failures_mlir/` (excluded in `vctx.toml`)
- A second script (or an update to `run_on_purpose_failures.bat`) that runs:
  - `python ..\vctx-lang\vctx-cli.py mlir <file>` and expects nonzero

Until then, keep MLIR-only failures out of `on_purpose_failures_check/` so the current runner stays accurate.


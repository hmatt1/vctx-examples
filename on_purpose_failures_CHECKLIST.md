# Expected-failure checklist (intern task list)

This repo has **three** **expected-fail** suites that are **excluded from bulk discovery** (see `vctx.toml`) and should be run **directly** by path:

- `on_purpose_failures_check/`: must **fail** under `vctx check <file>`
- `on_purpose_failures_sim/`: must **fail** under `vctx sim <file>`
- `on_purpose_failures_mlir/`: must **fail** under `vctx mlir --top <package>` (see MLIR section below)

Runner script: `run_on_purpose_failures.bat` (runs sim, then check, then mlir xfails). It redirects each run to a temp file, prints it, and uses `_on_purpose_has_e_code.py` (same ``[E_…]`` pattern as pytest) so a failing exit without any machine id counts as an error.

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
- [x] `import_alias_collision.vctx`: two imports with the same alias → `E_IMPORT_ALIAS_COLLISION`

### Type / width / signedness rules
- [x] `type_reg_assigned_with_comb_op_in_root.vctx`: `reg r; r := ...` outside `when`
- [x] `type_wire_assigned_with_seq_op.vctx`: `wire w; w <= ...`
- [x] `type_width_mismatch_assignment.vctx`: assign `u16` into `u8` without cast
- [x] `type_signedness_mismatch_assignment.vctx`: assign `s8` into `u8` without cast → `E_TYPE_SIGN_MISMATCH`
- [x] `type_bad_port_connection_width.vctx`: instantiate component with mismatched port widths
- [x] `type_ternary_arm_type_mismatch.vctx`: runtime `cond ? u8 : u16` (incompatible arms) → `E_TERNARY_ARM_MISMATCH`
- [x] `type_dynamic_bracket_slice_unknown_width.vctx`: `w[hi..lo]` with signal bounds → `E_TYPE_UNKNOWN` (span width not fixed at analysis; prefer `Slice(...)` / shift + const slice)

### Comptime-required failures (core dev contract)
See `comptime/checklist_overview.md` for intent.

- [x] `comptime_non_foldable_array_dim.vctx`: `T[N]` where `N` depends on runtime
- [x] `comptime_non_foldable_carrier_width.vctx`: `u<expr>` where `expr` depends on runtime
- [x] `comptime_non_foldable_generic_arg.vctx`: `Foo<expr>(...)` where `expr` depends on runtime
- [x] `comptime_negative_array_dim.vctx`: dimension folds negative → `E_COMPTIME_VALUE_INVALID`
- [x] `comptime_negative_carrier_width.vctx`: `u<(0-1)>` style width folds negative → `E_COMPTIME_VALUE_INVALID`
- [x] `comptime_forbidden_runtime_position.vctx`: should produce a “comptime-required” style error

### Scheduling / MLIR emission failures
- [x] `mlir_comb_cycle_minimal_2.vctx`: another minimal comb loop shape (different from existing)
- [x] `mlir_comb_cycle_when_variant.vctx`: comb cycle expressed via `when` assignments

### MLIR-only suite (`on_purpose_failures_mlir/`, excluded from bulk project check)

- [x] `mlir_field_access_unlowered.vctx`: static check passes; `vctx mlir` fails with `[E_MLIR_FIELD_ACCESS_UNSUPPORTED]` (non-`bits`/`span` postfix on `Slice(...)` call form)
- [x] `mlir_function_call_generic_unlowered.vctx`: static check passes; `vctx mlir` fails with `[E_MLIR_FUNCTION_COMPONENT_GENERIC_UNSUPPORTED]` (Component-parameter `function`)
- [x] `mlir_function_type_generic_unlowered.vctx`: static check passes; `vctx mlir` fails with `[E_MLIR_FUNCTION_TYPE_GENERIC_UNSUPPORTED]` (Type-parameter `function`)

Open gaps (still **not** covered as a dedicated on-purpose file):

- **Struct / bundle** field access on hardware path if/when `check` accepts those forms but lowering lags (use `E_MLIR_FIELD_ACCESS_UNSUPPORTED`; `mlir_field_access_unlowered` already locks the code for the `Slice` postfix gap)

Covered as **check** xfail (not MLIR-only): dynamic **bracket slice** with non-constant bounds → `type_dynamic_bracket_slice_unknown_width.vctx` (`E_TYPE_UNKNOWN`).

### Illegal statements inside hardware `when` arms (only if this is a rule you want locked in)
- [x] `when_arm_contains_assert.vctx`: `assert(...)` inside a hardware `when` arm → `E_SCHEDULE_ILLEGAL_WHEN`
- [x] `when_arm_contains_cycle_or_poke.vctx`: `cycle()` inside a hardware `when` arm → `E_SCHEDULE_ILLEGAL_WHEN`
- [x] `when_arm_contains_poke.vctx`: `poke(...)` inside a hardware `when` arm → `E_SCHEDULE_ILLEGAL_WHEN`

## Checklist: `on_purpose_failures_sim/` (runtime failures)

### Assertion failures (TAP/reporting)
- [x] `sim_one_fail_among_passes_2.vctx`: one failing assert surrounded by passes (tiny, stable)
- [x] `sim_two_failures_counting.vctx`: two failing asserts to verify summary counts
- [x] `sim_fail_after_poke.vctx`: `poke`, then fail (exercises trace/emit order)
- [x] `sim_fail_after_multiple_cycles.vctx`: only fails after N cycles (reg/sequential visibility)
- [x] `sim_fail_bool_not.vctx`: minimal boolean negation failure
- [x] `sim_concat_basic_should_work.vctx`: `concat(high, low)` should pack into a wider integer (known failing feature)
- [x] `sim_intrinsics_is_comptime_should_work.vctx`: `is_comptime(...)` should be 1 for folded constants (known failing feature)
- [x] `sim_comptime_clog2_should_fold.vctx`: comptime function call (via `std.clog2`) should fold (known failing feature)
- [x] `sim_comptime_eval_cov_should_work.vctx`: comptime loop/arithmetic should evaluate (known failing feature)
- [x] `sim_comptime_loop_control_should_work.vctx`: comptime `break`/`continue` should evaluate (known failing feature)
- [x] `sim_comptime_value_containers_should_work.vctx`: comptime Array/Map indexing should work (known failing feature)
- [x] `sim_zero_extend_generic_should_work.vctx`: generic function call should resolve + widen (known failing feature)

### Harness misuse (only if sim enforces these at runtime)
- [x] `sim_poke_output_should_fail.vctx`: attempt to `poke` a DUT output → `[E_SIM_POKE_TARGET_INVALID]` at sim compile
- [x] `sim_poke_unknown_name_should_fail.vctx`: `poke(ghost, …)` with no such wire → `E_UNKNOWN_IDENTIFIER` (plus precheck banner; fails before sim compile)

## Not in checklist originally, but implemented (sim suite)

- [x] `on_purpose_failure.vctx`: baseline “one assert fails” demo
- [x] `sim_poke_driven_wire_should_fail.vctx`: ``poke`` on a ``:=``-driven TB wire → `[E_SIM_POKE_TARGET_INVALID]` at sim compile (same family as bad DUT output poke)

## Verification (what “done” means)

From the `vctx-examples` repo root:

- For `on_purpose_failures_check/*`:
  - `python ..\vctx-lang\vctx-cli.py check <file>` **must exit nonzero**
- For `on_purpose_failures_sim/*`:
  - `python ..\vctx-lang\vctx-cli.py sim <file>` **must exit nonzero**
- Or run everything:
  - `run_on_purpose_failures.bat` should exit 0 (no unexpected passes on sim, check, and MLIR xfails).
- **Error codes:** every xfail run’s combined stdout/stderr must include at least one machine id of the form `[E_SNAKE_CASE]` (static checks, sim pipeline, or sim assertion). This is enforced by `vctx-lang/tests/test_on_purpose_error_codes.py` when `vctx-examples` sits next to `vctx-lang`.
- **CLI stubs:** unimplemented subcommands (`vctx formal`, `vctx clean`, project-wide `vctx test`, `vctx sv`, …) must print `[E_CLI_NOT_IMPLEMENTED]` and exit nonzero — see `vctx-lang/tests/test_cli_not_implemented_code.py`.
- **Sim CLI early bail-outs:** `vctx sim` prints `[E_SIM_RESOLVE_FAILED]` when the target path does not resolve to a package, `[E_SIM_NO_SIM_BLOCKS]` when the project or chosen package has no `sim { }` blocks (before precheck). Compile-stage exceptions map through `sim_compile_code_for_exception` in `diagnostics.py` (see `vctx-lang/tests/test_sim_compile_code_mapping.py`, `test_sim_cli_resolution_codes.py`).
- **`vctx config-set`:** invalid dot keys, unknown supported keys, or wrong value types print `[E_CONFIG_INVALID]` — `vctx-lang/tests/test_cli_config_error_codes.py`.
- **Target resolution (check / ast / dumps / LSP-adjacent helpers):** when a path does not resolve to a package, Rich output includes `[E_CLI_TARGET_RESOLVE_FAILED]` before “Error resolving …”; **bulk** `check` / `sim` with discoverable `.vctx` files but **no** resolved packages print the same code before “No packages could be resolved …” (`vctx sim` target/file resolution continues to use `[E_SIM_RESOLVE_FAILED]` / `[E_SIM_NO_SIM_BLOCKS]`) — `vctx-lang/tests/test_cli_target_resolve_code.py`.
- **Dev / internal:** `vctx regen` failure (wrong cwd, missing grammar, lark failure, …) prints `[E_CLI_PARSER_REGENERATE_FAILED]`; `vctx self-test` with no `tests/` next to sources prints `[E_CLI_UNITTESTS_UNAVAILABLE]`; `resolve-symbol` / `resolve-type` / `infer-expr` when the name does not resolve print `[E_UNKNOWN_IDENTIFIER]` before the human line; `vctx definition` with no symbol at the position prints `[E_CLI_DEFINITION_NOT_FOUND]`; `vctx ast` when the package has no generated AST prints `[E_CLI_AST_UNAVAILABLE]`; `assignment` with no memo AST for the package prints `[E_INTERNAL]`; unexpected errors in `document-symbols` print `[E_INTERNAL]`; check report pipeline failure prints `[E_INTERNAL]` — see `vctx-lang/tests/test_cli_dev_tool_codes.py` (regen, `resolve-symbol`, `resolve-type`, `infer-expr`, `definition`).
  - `vctx symbols` failures print `[E_CLI_SYMBOLS_UNAVAILABLE]` (and file decode/read errors print `[E_IO_ERROR]`); `vctx imports` decode/read errors print `[E_IO_ERROR]` — `test_cli_dev_tool_codes.py` covers these via temp projects.
  - `vctx tokens` decode/read errors print `[E_IO_ERROR]` (and unexpected lexer failures print `[E_CLI_TOKENS_UNAVAILABLE]`) — also covered by `test_cli_dev_tool_codes.py` via a temp project.
  - `vctx highlight` when no highlights are found prints `[E_CLI_HIGHLIGHTS_NOT_FOUND]`; `vctx outline` (document symbols) with an empty outline prints `[E_CLI_DOCUMENT_SYMBOLS_EMPTY]` — covered by `test_cli_dev_tool_codes.py` via temp projects.
  - `vctx outline` decode/read errors print `[E_IO_ERROR]` (no traceback) — also covered by `test_cli_dev_tool_codes.py`.
  - `vctx hover` prints `[E_CLI_HOVER_EMPTY]` if hover output is empty (and `[E_INTERNAL]` on unexpected hover crashes) — `test_cli_dev_tool_codes.py` includes a temp-project coverage point.
  - `vctx discover` missing/unresolvable targets print `[E_CLI_TARGET_RESOLVE_FAILED]` (and should not traceback) — covered by `test_cli_dev_tool_codes.py` via a temp project.
  - `vctx structure` decode/read errors print `[E_IO_ERROR]`; empty/failed structure prints `[E_CLI_STRUCTURE_UNAVAILABLE]` — temp-project coverage is in `test_cli_dev_tool_codes.py`.
- **`vctx mlir --top`:** unresolved `--top` prints `[E_MLIR_TOP_UNRESOLVED]`; missing/ambiguous default top discovery prints `[E_MLIR_TOP_REQUIRED]` — `vctx-lang/tests/test_mlir_cli_target_codes.py` (bad `--top`, and a temp project with no `@top` component).

## Goal: known error codes for every on-purpose failure

**Target:** For every file in `on_purpose_failures_check/` and `on_purpose_failures_sim/`, a failure must be associated with a **stable machine id** from `vctx-lang/diagnostics.py` (`E_…`), carried in `CheckResult.context["code"]` for `check`, and visible in sim output (including `E_SIM_*` lines) for `sim`.

**Enforced today:** `vctx-lang/tests/test_on_purpose_error_codes.py` (when `vctx-examples` is next to `vctx-lang`) asserts (1) `check` / `sim` exits **nonzero** and (2) output contains **at least one** `[E_SNAKE_CASE]`.

**Not enforced yet (gaps in automation):**

| Risk | What happens | Mitigation |
|------|----------------|------------|
| **Wrong code** | A file still prints *some* `E_…` but not the one we intend (e.g. secondary diagnostic). | Per-file **expected** `E_…` map in tests or a small table in the header comment + assertion. |
| **Too weak** | Regex accepts any `E_…` including unrelated cascade noise. | Tighten to a single **primary** code per file, or forbid unexpected severities. |
| **Batch vs pytest** | Batch now requires an ``[E_…]`` line when the tool exits nonzero (same regex family as pytest). | CI should still run pytest for primary-code tables (`test_on_purpose_primary_codes`). |
| **Sim layout** | Integration test skipped if repos aren’t side-by-side. | CI checkout that clones or nests `vctx-examples` so `test_on_purpose_error_codes` always runs. |

## Gap analysis: language, diagnostics, and tests

### A. Former “blocked” checks (now covered)

These are implemented under `on_purpose_failures_check/` with stable `E_…` codes (see checklist rows above): import alias collision, signedness mismatch, runtime ternary arm mismatch, negative comptime dim/width, illegal intrinsics in `when` arms.

*Next candidates:* lift remaining **emit-only** diagnostics into `check` where cheap (struct field paths, …); `on_purpose_failures_mlir/` already covers several lowering gaps.

### B. When **`vctx check` passes** but **emit** can still fail

- **Dynamic bracket slice** with non-constant bounds: the common case is caught in **`check`** as `E_TYPE_UNKNOWN` (`type_dynamic_bracket_slice_unknown_width.vctx`). If something slips through, MLIR reports `E_MLIR_DYNAMIC_SLICE_UNSUPPORTED`.
- **Struct / bundle** field paths the emitter does not handle yet: `E_MLIR_FIELD_ACCESS_UNSUPPORTED` (see `on_purpose_failures_mlir/` for Int-only generic gaps, etc.).

*Risk:* rare “check green, mlir red” cases. *Mitigation:* on-purpose MLIR suite + `mlir_cli_code_for_exception` mapping (see `vctx-lang/tests/test_mlir_cli_code_mapping.py`); sim compile uses `sim_compile_code_for_exception` (`test_sim_compile_code_mapping.py`).

### C. Sim suite **coverage / semantics** gaps

| Topic | Note |
|-------|------|
| **Poke unknown name** | Covered by `sim_poke_unknown_name_should_fail.vctx` (unresolved `poke` target → `E_UNKNOWN_IDENTIFIER` during precheck). |
| **`sim_poke_driven_wire_should_fail`** | ~~Was assertion-based~~ — now fails at compile with `[E_SIM_POKE_TARGET_INVALID]` after fixing sim pokeability analysis for ``:=`` LHS. |

### D. “Tests pass that shouldn’t” / “fail that should pass” (runner health)

- **`[OK: failed as expected]` with exit code 1** can still hide **wrong reason** (e.g. import error instead of the intended type error) unless you read logs. *Mitigation:* per-file **expected primary `E_…`** in pytest.
- **Unexpected pass** (`exit 0` on an xfail file) is what the batch script is designed to flag; keep running it after refactors to the graph or `check` registration.
- **pytest `test_on_purpose_error_codes`**: A file that **should** typecheck but is accidentally under `on_purpose_failures_check` is not represented here — that’s a *wrong placement* problem; use a separate “golden” / **should-pass** corpus (or normal project tests) for those.

### E. Language areas with **no** (or thin) on-purpose **check** coverage today

Not exhaustive: extend `on_purpose_failures_check` as the language grows.

- **Formal** properties (parser has `formal` blocks; `vctx formal` is still a stub and exits nonzero with ``[E_CLI_NOT_IMPLEMENTED]`` until wired up)
- **Generics** edge cases beyond current generic inst checks
- **Bundles / structs** end-to-end in `check` (vs MLIR-only)
- **Larger scheduling** classes (latch inference, multiple clocks) if the language exposes them
- **Import** variants (circular import, re-export) once specified

## MLIR-only suite (implemented)

- Directory: `on_purpose_failures_mlir/` (listed in `vctx.toml` `exclude_path_parts`)
- Regression: `vctx-lang/tests/test_on_purpose_error_codes.py` → `test_mlir_xfails_emit_codes` runs `vctx mlir --top <package>` and asserts a nonempty `[E_…]` line (including `[E_MLIR_PRE_EMIT_CHECK_FAILED]` if analysis fails before emit).
- Manual: `python ..\vctx-lang\vctx-cli.py mlir --top on_purpose_failures_mlir.mlir_function_call_generic_unlowered` (from `vctx-examples/`).

Keep MLIR-only cases out of `on_purpose_failures_check/` unless they genuinely fail static analysis.


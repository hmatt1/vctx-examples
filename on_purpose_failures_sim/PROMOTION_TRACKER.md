# Promotion tracker: sim expected-fails that should become passing tests

These `sim_*_should_work.vctx` files intentionally fail **today** and serve as
living documentation for compiler work that remains.

Promotion rule:
- Keep file in `on_purpose_failures_sim/` while it fails.
- Move to regular passing examples/tests once behavior is implemented and stable.
- Remove from `_SIM_FIRST` (and `_SIM_ALSO` if present) in `vctx-lang/tests/test_on_purpose_primary_codes.py` at the same time you delete the xfail file.

**Candidates to move to passing sims later:** every row below. When a row’s “Promotion trigger” is met, that file is ready to **graduate** out of this directory (not to remain as an xfail).

## By failure stage (how sim fails today)

| Stage | Typical first `[E_…]` | What it means for implementers |
|--------|------------------------|--------------------------------|
| **Precheck** | `E_SIM_PRECHECK_FAILED` | Static pipeline failed before sim compile; often with `E_COMPTIME_REQUIRED` for parametric carriers, or `E_TYPE_UNKNOWN` when comptime evaluation hits an unsupported node. |
| **Sim compile** | `E_SIM_COMPILE_FAILED` | Late compile (e.g. width folding); fix folding/typecheck before runtime. |
| **Runtime assert** | `E_SIM_ASSERTION_FAILED` | Reached sim but value wrong (comptime/concat/intrinsic gap). |
| **Poke / harness** | `E_SIM_POKE_TARGET_INVALID` / `E_SIM_PRECHECK_FAILED`+`E_UNKNOWN_IDENTIFIER` | Testbench rules; not “should work” promotion cases unless renamed. |

| File | Area | Intended behavior (future pass) | Why this exists now | Promotion trigger |
|---|---|---|---|---|
| `sim_concat_basic_should_work.vctx` | Intrinsics / lowering | `concat(high, low)` packs into `0xDEAD` | Documents current concat runtime mismatch | Assert passes and stays stable in regular sim suite |
| `sim_concat_variadic_should_work.vctx` | Intrinsics / lowering | `concat(a,b,c,d)` on four `u4` packs into `0xABCD` | Isolates variadic concat (today `out` is 0) | Four-nibble concat matches expected `u16` in sim |
| `sim_slice_concat_byteswap_should_work.vctx` | Slicing + concat | `concat(x[7..0], x[15..8])` on `u16` should byte-swap to `0x3412` | Today `y` is 0; same class of gap as `sim_concat_basic_should_work` but adds slices | Byte-swap assert passes in sim |
| `sim_intrinsics_is_comptime_should_work.vctx` | Comptime intrinsics | `is_comptime` is true for folded constants | Locks current semantic gap in constant-ness reporting | `is_comptime` behavior matches language contract in sim |
| `sim_zero_extend_generic_should_work.vctx` | Generic functions | generic function call resolves and widens correctly | Tracks generic call/value path in sim | Generic function call passes with expected value |
| `sim_parametric_carrier_component_should_work.vctx` | Parametric carriers | `u<WIDTH>` component ports specialize at sim/check/lowering | Documents that carrier-width generics still fail precheck | `u<WIDTH>` ports typecheck+simulate with no precheck errors |
| `sim_parametric_carrier_pipeline_should_work.vctx` | Parametric carriers | nested `u<W>` generic carriers flow through hierarchy | Ensures hierarchical specialization is covered | Nested generic carriers elaborate and pass assertions |
| `sim_parametric_carrier_expr_should_work.vctx` | Parametric carriers | derived width `u<(W + 1)>` specializes from Int generics | Tracks expression-based carrier-width folding gap | Carrier-width expressions fold during specialization |
| `sim_parametric_carrier_function_should_work.vctx` | Parametric carriers + functions | generic function signatures with `u<W>` should specialize | Captures function-level generic carrier gap (not just components) | Function `u<W>` param/return paths pass under sim |
| `sim_parametric_two_width_params_should_work.vctx` | Parametric carriers | two independent `A`, `B` in `u<A>`, `u<B>` and `u<(A+B)>` in one unit | Extends single-parameter `W` cases to multi-argument width generics | `TwoWidths<A,B>` typechecks, elaborates, and `concat`+assert pass |
| `sim_parametric_carrier_nested_expr_should_work.vctx` | Parametric carriers | nested Int expressions like `u<(W+W)>` should fold | Ensures nested expression folding is tracked separately from `W+1` | Nested width expressions specialize and simulate correctly |
| `sim_parametric_signed_carrier_should_work.vctx` | Parametric carriers (signed) | signed carriers `s<W>` should specialize like `u<W>` | Tracks signed parametric carrier support separately from unsigned | `s<W>` generic ports typecheck/simulate and assertion passes |
| `sim_parametric_mixed_arith_should_work.vctx` | Parametric arithmetic | mixed arithmetic result widths like `u<(W+1)>` should fold and cast correctly | Captures arithmetic + width-specialization path in one minimal case | Arithmetic over generic widths lowers and passes stable assertion |
| `sim_parametric_slice_should_work.vctx` | Parametric carriers + slicing | slices over `u<W>` should specialize and produce typed slices | Tracks slice typing/lowering path for parametric carriers | `u<W>` slicing typechecks and passes stable nibble assertion |
| `sim_parametric_signed_cast_should_work.vctx` | Parametric carriers + casts | casts between `s<W>` and `u<W>` should specialize cleanly | Isolates signed/unsigned generic-cast behavior | Generic signed/unsigned cast path passes deterministic assertion |
| `sim_parametric_concat_should_work.vctx` | Parametric carriers + concat | `concat(u<W>, u<W>)` should specialize to `u<(W+W)>` | Tracks concat typing/lowering over generic carriers | Concat over specialized generic widths passes stable assertion |
| `sim_parametric_width_intrinsic_should_work.vctx` | Parametric carriers + intrinsics | `width(u<W>)` should fold after specialization | Captures compile-stage gap where width does not fold and emits `E_SIM_COMPILE_FAILED` | `width(...)` folds in sim path with no compile-stage bail-out |

## Index: `sim_*_should_work` by theme (for maintenance)

| Theme | Files |
|--------|--------|
| **Concat / slice** | `sim_concat_basic_should_work`, `sim_concat_variadic_should_work`, `sim_slice_concat_byteswap_should_work`, `sim_parametric_concat_should_work` |
| **Comptime** | `sim_comptime_clog2_should_fold`, `sim_comptime_eval_cov_should_work`, `sim_comptime_loop_control_should_work`, `sim_comptime_value_containers_should_work`, `sim_comptime_len_array_should_work`, `sim_comptime_nested_call_should_work`, `sim_comptime_recursion_should_work` |
| **Intrinsics** | `sim_intrinsics_is_comptime_should_work`, `sim_parametric_width_intrinsic_should_work` |
| **Parametric `u<W>` / `s<W>`** | all `sim_parametric_*_should_work` except concat-only row above, plus `sim_zero_extend_generic_should_work` |
| **Arrays / `reg` / `wire` index + assign** | `sim_array_literal_init_should_work`, `sim_reg_array_index_should_work`, `sim_wire_array_element_assign_should_work` |
| **Dynamic `w[hi..lo]` slice (runtime bounds)** | `sim_dynamic_bracket_slice_should_work` (see also check-only twin: `type_dynamic_bracket_slice_unknown_width.vctx`) |

**Passing-sim target:** any row whose promotion trigger is met should leave `on_purpose_failures_sim/` and live under normal `vctx-examples` packages (or project tests), not stay as an xfail. Every table row and checklist item is a **promotion candidate**: once the trigger is met, the file is deleted from this suite and removed from the pytest primary-code maps; it should **not** remain as an xfail.

## Promoted (graduated to passing examples)

The following files have been moved out of `on_purpose_failures_sim/` into the normal passing corpus:

- `sim_parametric_carrier_component_should_work.vctx` → `comptime/generics/parametric_carrier_component.vctx`
- `sim_parametric_carrier_function_should_work.vctx` → `comptime/generics/parametric_carrier_function.vctx`
- `sim_parametric_carrier_pipeline_should_work.vctx` → `comptime/generics/parametric_carrier_pipeline.vctx`
- `sim_parametric_signed_carrier_should_work.vctx` → `comptime/generics/parametric_signed_carrier.vctx`
- `sim_parametric_signed_cast_should_work.vctx` → `comptime/generics/parametric_signed_cast.vctx`
- `sim_parametric_slice_should_work.vctx` → `comptime/generics/parametric_slice.vctx`
- `sim_parametric_carrier_expr_should_work.vctx` → `comptime/generics/parametric_carrier_expr.vctx`
- `sim_parametric_carrier_nested_expr_should_work.vctx` → `comptime/generics/parametric_carrier_nested_expr.vctx`
- `sim_parametric_mixed_arith_should_work.vctx` → `comptime/generics/parametric_mixed_arith.vctx`
- `sim_parametric_two_width_params_should_work.vctx` → `comptime/generics/parametric_two_width_params.vctx`
- `sim_parametric_concat_should_work.vctx` → `comptime/generics/parametric_concat.vctx`
- `sim_parametric_width_intrinsic_should_work.vctx` → `comptime/generics/parametric_width_intrinsic.vctx`
- `sim_zero_extend_generic_should_work.vctx` → `comptime/generics/zero_extend_generic.vctx`
- `sim_concat_basic_should_work.vctx` → `operators/concat_basic.vctx`
- `sim_concat_variadic_should_work.vctx` → `operators/concat_variadic.vctx`
- `sim_slice_concat_byteswap_should_work.vctx` → `operators/slice_concat_byteswap.vctx`
- `sim_intrinsics_is_comptime_should_work.vctx` → `intrinsics/is_comptime_should_be_true.vctx`
- `sim_array_literal_init_should_work.vctx` → `operators/array_literal_init.vctx`
- `sim_wire_array_element_assign_should_work.vctx` → `operators/wire_array_element_assign.vctx`
- `sim_reg_array_index_should_work.vctx` → `registers/reg_array_index.vctx`
- `sim_dynamic_bracket_slice_should_work.vctx` → `operators/dynamic_bracket_slice.vctx`
- `sim_comptime_nested_call_should_work.vctx` → `comptime/comptime_nested_call.vctx`
- `sim_comptime_len_array_should_work.vctx` → `comptime/comptime_len_array.vctx`
- `sim_parametric_array_carrier_should_work.vctx` → `comptime/generics/parametric_array_carrier.vctx`
- `sim_comptime_clog2_should_fold.vctx` → `comptime/comptime_clog2_fold.vctx`
- `sim_comptime_eval_cov_should_work.vctx` → `comptime/comptime_eval_coverage.vctx`
- `sim_comptime_loop_control_should_work.vctx` → `comptime/comptime_loop_control.vctx`
- `sim_comptime_recursion_should_work.vctx` → `comptime/comptime_fact_iter.vctx`
- `sim_comptime_value_containers_should_work.vctx` → `comptime/comptime_value_containers.vctx`
- `sim_reg_comb_assignment_should_work.vctx` → `registers/reg_seq_assignment.vctx`
- `sim_wire_seq_assignment_should_work.vctx` → `operators/wire_comb_assignment.vctx`
- `sim_width_mismatch_assignment_should_work.vctx` → `operators/explicit_truncate_cast.vctx`
- `sim_signedness_assignment_should_work.vctx` → `operators/explicit_signedness_cast.vctx`
- `sim_ternary_runtime_arm_mismatch_should_work.vctx` → `operators/ternary_runtime_normalized_width.vctx`
- `sim_ternary_runtime_signedness_mismatch_should_work.vctx` → `operators/ternary_runtime_normalized_signedness.vctx`
- `sim_output_signedness_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_output_width_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_input_signedness_reverse_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_input_width_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_input_width_narrowing_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_input_width_signedness_combo_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_output_width_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_output_width_signedness_combo_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_signedness_instance_mismatch_should_work.vctx` → `operators/port_boundary_adapters.vctx`
- `sim_port_width_instance_mismatch_sim_compile_should_work.vctx` → `operators/port_boundary_adapters.vctx`


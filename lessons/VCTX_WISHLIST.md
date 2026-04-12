# VCTX wish list (from bring-up pain)

Each item has a **lesson file** under `lessons/` that illustrates the issue, a workaround, or both.

| # | Wish | Lesson |
|---|------|--------|
| 1 | **`check` vs MLIR emission** — `vctx-cli.py check` can succeed while `mlir` fails on the same package; CI and docs should make “emit succeeds” a first-class gate. | [`check_vs_mlir_emission.vctx`](./check_vs_mlir_emission.vctx) |
| 2 | **Combinational paths across instances** — errors don’t always point at the *break* (e.g. “move ROM read inside the block that owns `pc_track`”). | [`combinational_path_across_instances.vctx`](./combinational_path_across_instances.vctx) |
| 3 | **Multiple `when` trees + shared `reg` + `out`** — arcilator sim can disagree with the mental HDL model; splitting **Regs** vs **read decode** into separate components is reliable. | [`reg_read_when_split.vctx`](./reg_read_when_split.vctx) |
| 4 | **Block RAM / array-backed storage** — modeling RAM as `m0..m15` works but scales poorly; a supported memory/array story would help. | [`memory_without_arrays.vctx`](./memory_without_arrays.vctx) |
| 5 | **Relational operator spelling** — `<==` / `>==` are easy to confuse with `<=` (assignment) or other languages’ `<=`. | [`relational_operators.vctx`](./relational_operators.vctx) |
| 6 | **Hierarchical sim quirks** — reg-driven harnesses feeding combinational buses sometimes need the same structural fixes as (2) and (3); clearer tooling would help isolate. | [`hierarchical_bus_harness.vctx`](./hierarchical_bus_harness.vctx) |

See also existing lessons: [`combinational_cycles.vctx`](./combinational_cycles.vctx), [`emitter_instance_port_order.vctx`](./emitter_instance_port_order.vctx).

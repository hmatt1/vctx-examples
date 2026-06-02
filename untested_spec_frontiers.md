# Untested vctx Spec Frontiers

This document tracks "dark corners" of the Vctx language—features and constraints defined in `docs/language-spec.md` that are currently under-represented or entirely missing from the `vctx-examples` suite and the `prioritized_ideas.md` roadmap.

---

## 1. String-to-Hardware Interpretation (§3.5, §8.3)
The spec defines a specific MSB-first ASCII bitstream representation for strings.
*   **Target Test:** Assigning `"Hi"` (0x4869) to a `u16` and verifying the value.
*   **Target Test:** Verifying zero-padding behavior for strings shorter than the target (e.g., `"A"` into `u16` results in `0x0041`).
*   **Target Test:** Multi-byte string concatenation behavior in `concat("A", "B")`.

## 2. Comptime Maps and Resource Limits (§5.6, §18)
The `comptime` interpreter has specific container types and hard termination limits.
*   **Target Test:** `Map<String, Int>` operations: insertion, nested lookup, and `len()`.
*   **Target Test:** Intentionally exceeding `FOLD_STEPS` (1M) or `CALL_DEPTH` (256) to verify `E_COMPTIME_RESOURCE_LIMIT`.
*   **Target Test:** Verifying that `Map` keys must be literals as per §8.6.

## 3. Aggregate Nesting (Structs-in-Structs) (§5.3, §8.5)
The type model supports `STRUCT` and `ARRAY` nesting, but coverage is currently scalar-heavy.
*   **Target Test:** Deep field access: `struct A { b: B }, struct B { c: u8 }` -> `a.b.c := 1`.
*   **Target Test:** Arrays of Structs: `MyStruct[4]` and verifying indexing vs. field access precedence.
*   **Target Test:** Structs as component ports and their MLIR lowering.

## 4. Hierarchical Simulation Visibility (§13.2)
The spec allows `sim` blocks to read internal signals of direct children.
*   **Target Test:** Reading a `reg` or `wire` from an instantiated component (`dut.internal_signal`).
*   **Target Test:** Verifying the "Read-Only" constraint (attempting to drive a child signal from a sim should fail).
*   **Target Test:** Probing the boundary of "Deep Access" (2+ levels deep) to ensure it fails with `E_MLIR_FIELD_ACCESS_UNSUPPORTED` rather than a crash.

## 5. Qualified Lookup & Ambiguity (§15.2)
Resolution logic for imports and package heads is complex.
*   **Target Test:** "Diamond Imports": Importing the same package under two different aliases and using them in the same scope.
*   **Target Test:** Local vs. Global Priority: A local top-level symbol shadowing a package head of the same name.
*   **Target Test:** Verifying that `package.path` exact matches take precedence as defined.

## 6. Implicit Clock/Reset Propagation (§6.7)
Single-clock synchronous behavior is handled by the compiler.
*   **Target Test:** Deep Nesting Stress: A 10-level deep component hierarchy to ensure `rst` correctly clears a register at the bottom.
*   **Target Test:** Verifying that local declarations of `clk` or `rst` produce appropriate shadowing or collision errors.

## 7. Non-Goal Rejection (Negative Grammar) (§19)
The spec lists several "Non-goals" that must be explicitly rejected.
*   **Target Test:** Systematic rejection of Verilog-style literals: `'hFF`, `'b1010`.
*   **Target Test:** Rejection of legacy syntax: `u<8>`, `port: expr`.
*   **Target Test:** Rejection of C-style operators: `!`, `!=`, `<=`, `>=` (in favor of `not`, `!==`, `<==`, `>==`).

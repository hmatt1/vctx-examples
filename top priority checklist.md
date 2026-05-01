# Top priority checklist

## What this is about

Some example files carry the **main teaching story in long comment blocks** (spec prose, cross-references to internal docs, “vision vs today” notes, markdown-style tables) while the **executable vctx is a stub, a workaround, or only hints at the intended program** in comments (for example `// Would be: …` instead of real code). That makes examples harder to trust at a glance: readers must parse comments to understand what the language is supposed to demonstrate.

A related issue is **commented-out vctx source** (`/* … */` or commented “would be” lines): it is easy for that to drift from the compiler and it is not exercised by `check` / `sim`.

**Goal:** Each example should tell its story **primarily through code** (components, functions, sims, asserts). Keep comments short—naming, one-line intent, non-obvious invariants—not full spec chapters or dead code blocks.

---

## Checklist progress

- [x] `arrays_slicing/dynamic_index_extract.vctx`
- [x] `comptime/array_type_dimension.vctx`
- [x] `comptime/attributes_and_metadata.vctx`
- [x] `comptime/expressions_in_dimensions.vctx`
- [x] `comptime/forbidden_runtime_positions.vctx`
- [x] `comptime/generics_type_parameters.vctx`
- [x] `comptime/intrinsics_comptime.vctx`
- [x] `comptime/slice_known_width.vctx`
- [x] `comptime/ternary_casts_in_dimensions.vctx`
- [x] `comptime/generics/binop_component_parameter.vctx`
- [x] `comptime/generics/conditional_generate.vctx`
- [x] `comptime/generics/fold_vs_specialize.vctx`
- [x] `comptime/generics/function_vs_component_width.vctx`
- [x] `comptime/generics/signed_width_carrier.vctx`
- [x] `comptime/generics/type_kind_generic_T.vctx`
- [x] `comptime/generics/uses_width_call_by_name.vctx`
- [x] `comptime/generics/wrap_inner_component.vctx`
- [x] `lessons/memory_without_arrays.vctx`

---

## Files to refactor (doc-first / story-in-comments pattern)

These examples were flagged because they lean on **large narrative headers** (often `See:` / `Vision:`, `kinds-types-wire-reg.md`, `§`, `Language position:`, “today’s toolchain” workarounds, or lesson-style “wish / future” prose) such that the pedagogical contract competes with or replaces what the code alone expresses.

**Live file list:** use [Checklist progress](#checklist-progress) above (single source of truth).

---

## Files with commented-out example code

Remove or replace with a real expected-fail under `on_purpose_failures_*`, or delete if redundant.

- [x] `operators/arrays_and_slicing.vctx` (was: `/* … */` invalid-slice sim; now `on_purpose_failures_sim/sim_ascending_slice_compile_should_fail.vctx` — [E_SIM_COMPILE_FAILED] at sim emit)
- [x] `on_purpose_failures_sim/on_purpose_failure.vctx` (inline `/* … */` removed; xfail = intentional [E_SIM_ASSERTION_FAILED])

---

## “Intended code only as a comment” (highest smell)

- [x] `comptime/generics/fold_vs_specialize.vctx` (refactored: live `AdderW<W>` + `AdderW<(2+2)>`; old fence in **DOCS**)

---

## Suggested direction per file

Treat each listed example as a **small executable test** whose meaning is obvious from **names + types + sim asserts**. Comments are for **local** context only (one line, or a tight block under ~5 lines if something is genuinely non-obvious).

### Definition of done

- A new reader can answer **“what does this file prove?”** after reading **only** components, functions, port types, and sim `assert` messages—without reading a spec essay in the header.
- **No** `// Would be:` / “pseudocode we wish compiled” as the only expression of the main idea. Either it compiles and runs, or it lives under `on_purpose_failures_*` with a stable `[E_…]` and a one-line `// Expected failure: …`.
- **No** commented-out vctx (`/* … */` or large disabled sim blocks) in the normal corpus. If the point is “this is illegal,” make it a real xfail check/sim with an assert on the diagnostic contract—or delete it.
- After edits: `python ../vctx-lang/vctx-cli.py check` and `python ../vctx-lang/vctx-cli.py sim` from `vctx-examples` still pass; if you touched an xfail path, `run_on_purpose_failures.bat` still reports **0 unexpected passes**.

### What to do with long material today

- **Move** language design tables, kind ladders, and cross-chapter explanations to the docs section at the bottom of this file (DOCS) so I can review it later.
- If one sentence must point at in-repo design notes, use a **single** line, e.g. `// Teaches: parametric carrier specialization (see docs).`—not a pasted spec.

### How to refactor (concrete steps)

1. **Rewrite the header** down to: (a) one-line purpose, (b) optional one-line pointer to external docs. Delete markdown tables, “Vision vs today” essays, and duplicated rules already enforced elsewhere.
2. **Make the code the thesis:** prefer **one** primary `sim` (or a tiny set) whose asserts state the property under test. If you need two scenarios, use **two small components** with boring names (`Add8`, `MuxDemo`) rather than one giant comment explaining both.
3. **Rename or split** when the implementation is intentionally incomplete: avoid files where the executable is a `*Stub` unless the sim’s asserts prove a real, checkable behavior—or move that file to `on_purpose_failures_check` / delete it.
4. **Use assert messages for pedagogy** where it helps: `assert(cond, "short why this must hold")` carries teaching **next to** the check without hiding the program in comments.
5. **If the compiler cannot express the story yet:** do **not** keep a “ghost” program in comments. Add a **minimal** `on_purpose_failures_check/…` (or sim xfail) that locks the current error contract in one screen of code.

### Commented-out example files (extra)

- [x] `operators/arrays_and_slicing.vctx`: the invalid ascending slice is a **sim** xfail (`on_purpose_failures_sim/sim_ascending_slice_compile_should_fail.vctx` — **`[E_SIM_COMPILE_FAILED]`**; `vctx check` still passes on the invalid slice, so the harness is **sim**, not `on_purpose_failures_check`).
- [x] `on_purpose_failures_sim/on_purpose_failure.vctx`: moved removed inline code to **DOCS**; file is minimal (`OrGate` + `TestOr` with one false assert, **`[E_SIM_ASSERTION_FAILED]`**).

# DOCS

(put docs here that you find while working on above checklist)

### From `operators/arrays_and_slicing.vctx` (removed commented sim, 2026)

Replaced the disabled **`TestInvalidSliceAscending`** block with **`on_purpose_failures_sim/sim_ascending_slice_compile_should_fail.vctx`**.

```
/*
sim TestInvalidSliceAscending {
    wire data: u8 = 0xFF
    // ERROR: Ranges must be descending. [0..7] is explicitly invalid.
    wire bad: u8 = data[0..7]
}
*/
```

Note: the sim pipeline message is that the **high** index must be **>=** the **low** (MSB-first slice); **`[0..7]`** is treated as “ascending” in that sense. If you prefer **`data[7..0]`** for a full byte, that is the legal spelling.

### From `on_purpose_failures_sim/on_purpose_failure.vctx` (tidy xfail harness, 2026)

The harness still fails sim with **`[E_SIM_ASSERTION_FAILED]`** (second `assert` expects `x == 2`). Removed the inline block-comment “example” in **`OrGate`** and extra **`wire y2`**.

```
component OrGate(in a: u1, in b: u1, out y: u1) {
    y := a | b
    wire y2: u1 = a | b
    /* y3: u1 = a | b  */
}

sim TestOr {
    // 1. Inputs driven with initial values
    wire a: u1 = 1
    wire b: u1 = 0
    // 2. Output wire
    wire x: u1
    // 3. Instantiate the component
    // Connect inputs 'a', 'b' and output 'y'
    OrGate(a, b, x)
    cycle()
    cycle()
    cycle()
    assert(x == 1, "assert 1 | 0 should result in 1")
    assert(x == 2, "on purpose error to test failure reporting")
    assert(x == 1, "assert 1 | 0 should result in 1")
}
```

### From `arrays_slicing/dynamic_index_extract.vctx` (removed header, 2026)

Dynamic index and variable-position extract (arrays / slicing companion examples).

Most `arrays_and_slicing` demos use constant indices like `data[7]` or `data[7..0]`.
Real hardware often selects a bit or a *fixed-width field* at a runtime position:

- Single bit: `data[idx]` (lowered as logical shift + extract LSB)
- Nibble/word: shift the bus so the field sits at the LSBs, then slice with constants, e.g. `((data >> shamt) as u8)[3..0]`

Full `data[high..low]` with both bounds dynamic is not part of the type system today (slice width must be known at analysis time). Use shift + constant slice instead.

Index changes after `poke`: same hardware, new select each cycle (`TestDynBitPickAfterPoke`).

Dynamic index on a signed bus: bit pattern is still an unsigned bit pick (`DynBitPickSigned`).

Wider value: two dynamic nibbles stitched from the same word (`DynTwoNibbles`); shift amount still dynamic.

### From `comptime/array_type_dimension.vctx` (removed header, 2026)

```
// =============================================================================
// Language position: ARRAY TYPE DIMENSION
// Syntax: base_type "[" dimension_expr "]"  (repeatable for future rank > 1)
// Examples: u8[4],  bool[1],  s16[256]
// Vision: vctx-lang/kinds-types-wire-reg.md — dimension is an **Int**; not a
// **wire**/**reg** temporal value (§2). Carrier `u8` vs `u<WIDTH>` both use the
// same bracket rules for rank-1 arrays.
// =============================================================================
//
// MUST be comptime-known:
//   The dimension_expr must fold to a fixed non-negative integer before the
//   array type is real hardware. Storage size is inner_width * dim.
//
// Allowed forms (target — some may not fold in the compiler yet):
//   - Decimal literal: 4, 1_000
//   - Hex literal: 0x10 (value must be usable as dimension)
//   - Binary literal: 0b1000
//   - Parenthesized comptime expr: (2 + 2), ((3 * 4) + 1)
//   - Calls that are comptime-pure: width(some_wire)  (returns known width)
//
// Signedness:
//   Dimension is a *size*; treat as unsigned counting number. If the folded
//   value is negative, that is an error. Signed types (s8, etc.) describe
//   element bit pattern, not the bracket size — the bracket still holds a
//   size, not a two’s-complement “count” unless you explicitly allow it.
//
// ILLEGAL (should be rejected — examples for reviewer; may be commented so this
// file still parses):
//   wire a: u8[my_reg]           // reg / runtime
//   wire b: u8[my_input_port]   // port
//   wire c: u8[-1]              // negative size
//
// =============================================================================
```

Illegal dimension shapes belong in `on_purpose_failures_check/` (e.g. `comptime_negative_array_dim.vctx`, `comptime_non_foldable_array_dim.vctx`) with stable `[E_…]` codes—not as commented “wish” lines in passing examples.

### From `comptime/expressions_in_dimensions.vctx` (removed header, 2026)

```
// =============================================================================
// Language position: COMPTIME EXPRESSIONS inside ARRAY DIMENSIONS
// Vision: vctx-lang/kinds-types-wire-reg.md §6–§9 — bracket sizes are **Int**
// positions; the constant folder must reduce them before the array type is real
// hardware. Distinct from **component** instantiation (e.g. `Adder<8>`).
// =============================================================================
//
// Goal: any expression in `type[..]` that appears in a *type* position should
// be foldable using the same rules as other comptime integer math, so users can
// write `u8[K * 4]` or `u8[(W + 1)]` when `K` / `W` are generic **Int**
// parameters (e.g. in `u<W>` style generics).
//
// Operators (intended for comptime folding where both operands are comptime):
//   +  -  *  /  %   with fixed-width wrap/trunc semantics matching RTL
//   << >>           when shift amount is comptime
//   & | ^ ~         bitwise
//   ( )             grouping
//
// Comparisons in dimensions:
//   Usually dimensions are built from arithmetic; if you allow `cond ? a : b`,
//   both arms must be comptime when the condition is comptime.
//
// Signedness:
//   If operands mix signed and unsigned, document one promotion rule and stick
//   to it (e.g. match `core.py` width promotion). Result must still be a valid
//   non-negative dimension when used as array size.
//
// NOT in scope for a counting dimension:
//   Logical `and` / `or` on non-boolean integers unless they are C-style; vctx
//   uses word operators `and` / `or` / `not` for booleans — prefer explicit
//   numeric ops for dimensions.
//
// ILLEGAL examples (commented — runtime values):
//   wire n: u8[5]
//   reg idx: u8 = 0
//   wire bad: u8[idx + 1]   // idx is reg → not comptime
//
// =============================================================================
```

Runtime-dependent dimensions: `on_purpose_failures_check/comptime_non_foldable_array_dim.vctx` and related xfails.

### From `comptime/attributes_and_metadata.vctx` (removed header, 2026)

```
// =============================================================================
// Language position (FUTURE / SPEC): ATTRIBUTES with COMPTIME ARGUMENTS
// Example: @frequency(50_000_000), @keep_hierarchy
// Vision: vctx-lang/kinds-types-wire-reg.md §3 — attribute numerics are **Int** /
// elaboration-time constants, not **Wire**/**Reg** nets (they vanish before silicon).
// =============================================================================
//
// When an attribute takes a parenthesized expression, that expression is a
// comptime-only position in many toolchains: synthesis frequency, memory depth
// hints, etc.
//
// Allowed forms (target):
//   - Integer literals and underscores
//   - Comptime-only arithmetic if the compiler folds attributes
//
// Signedness:
//   Frequency / counts are non-negative integers unless a specific attribute
//   documents otherwise.
//
// ILLEGAL:
//   @frequency(clk_count)  // if clk_count is a reg
//
// ---------------------------------------------------------------------------
// vctx today: parse attributes on components; evaluation semantics TBD.
// This stub keeps the file valid without asserting a particular @-syntax value.
// ---------------------------------------------------------------------------
```

Inline `//` on `reg c` in the old file referenced temporal §2; the sim asserts (counter width, one cycle vs `cycle(16)`) are what the file actually checks.

### From `comptime/forbidden_runtime_positions.vctx` (removed header + ghost `//` examples, 2026)

The passing example is now a tiny `ConstantLow` + `SimConstantLow` (replaces the old `ForbiddenRuntimeDocStub` names). The following was the old banner (included commented “wish” / illegal fragments—do not paste back into `.vctx`; use `on_purpose_failures_check/` for real error contracts).

```
// =============================================================================
// CHECKLIST: RUNTIME VALUES THAT MUST *NOT* SATISFY COMPTIME POSITIONS
// (Some lines stay commented so this package can parse before diagnostics exist;
//  uncomment when testing errors.)
// Vision: vctx-lang/kinds-types-wire-reg.md — **Int** / type args fold in the
// constant folder; they are not **Wire**/**Reg** (L0) values.
// =============================================================================
//
// Array dimension:
//   // reg r: u8 = 0
//   // wire bad: u8[r]
//
// Generic argument (must be comptime-**Int** or allowed literal, not a net):
//   // reg r: u8 = 0
//   // Adder<r>(...)
//
// Attribute numeric argument:
//   // reg r: u8 = 0
//   // @depth(r)
//
// Slice — narrowing when `known_width` is unknown (dynamic bounds):
//   // component BadDynamicCast(in word: u32, in i: u3, out o: u8) {
//   //     s: Slice(word, (i + 7), i)
//   //     o := s as u8   // ERROR: span not statically known → cannot prove u8
//   // }
//
//   Use `.bits` / `.span`, or only `as uK` when hi/lo fold so known_width == K.
//   Prefer **`Slice(word, hi, lo)`** for the dynamic case; see dynamic_slicing_proposal.md.
//
// Why it matters:
//   Comptime positions size hardware before elaboration; a **reg** read or port
//   **signal** is an L0 value that varies per cycle — it cannot stand in for an
//   **Int** used in `u<WIDTH>`, array sizes, or templates.
//
// =============================================================================
```

Targeted `check` xfail: `on_purpose_failures_check/comptime_forbidden_runtime_position.vctx` (`[E_COMPTIME_REQUIRED]`).

### From `comptime/intrinsics_comptime.vctx` (removed header, 2026)

`IntrinsicsComptimeHarness` no longer uses tautology `assert(ic == ic)`; it now asserts `is_comptime` the same way as `intrinsics/is_comptime_should_be_true.vctx`. Stale “tracked as xfail sim” text was removed (that xfail file is gone / graduated).

```
// =============================================================================
// Language position: BUILT-INS THAT QUERY COMPTIME FACTS
// Intrinsics: width(expr), is_signed(expr), is_comptime(expr)
// Vision: vctx-lang/kinds-types-wire-reg.md — `width` / type queries yield **Int**
// (or bool) in the constant folder when the carrier type is known; they classify
// **L2** shape, not L0 per-cycle values.
// =============================================================================
//
// These return values that are comptime-known when their arguments are typed:
//   - width(x): bit width of x’s type → **Int** (documented as u32 carrier in places)
//   - is_signed(x): 1 if signed scalar type
//   - is_comptime(x): 1 iff the *expression* folded to a constant value
//
// Allowed:
//   Use inside other comptime expressions once the compiler threads const
//   through all call sites, e.g. u1[width(port) == 8] (illustrative).
//
// Signedness:
//   width / is_comptime results are unsigned small integers in the current model.
//
// Pitfall — `reg`:
//   `is_comptime(r)` for a `reg` r is 0: the read is **Reg<T>** **state** (L0),
//   not an **Int**, even if `r` has a reset literal or only ever holds small
//   integers. Compare with `is_comptime(0 as u8)` or a `wire` driven by literals.
//
// =============================================================================
```

### From `comptime/slice_known_width.vctx` (removed header, 2026)

```
// =============================================================================
// Slicing + comptime (spec-first)
// See: vctx-lang/kinds-types-wire-reg.md §7, vctx-lang/dynamic_slicing_proposal.md
//
// When `hi..lo` has **known_width == K** at comptime, a bracket slice may appear as a
// plain **`uK`** on a **`wire`** (declaration = name + carrier + **temporal** contract:
// **`wire` ⇒ combinational / `:=`**).
//
// When **known_width** is unknown (dynamic bounds), use **builtin component**
// **`Slice(word, hi, lo)`** — elaboration / hierarchy (§9.2), not the constant folder.
// Prefer instance syntax `s: Slice(...)` over `wire s: Slice := …` as the main story.
//
// Single-bit `x[i]` stays a separate construct; this file is about **`[hi..lo]`**.
// =============================================================================
```

`SliceWidthMismatchForbidden` remains a placeholder; width-mismatch rejects belong in `on_purpose_failures_check/`, not in comments in this file.

### From `comptime/ternary_casts_in_dimensions.vctx` (removed header, 2026)

```
// =============================================================================
// Ternary `cond ? a : b` — COMPTIME vs RUNTIME
// Vision: vctx-lang/kinds-types-wire-reg.md §9 — folded ternary in a dimension
// is **constant-folder** work (**Int**). Runtime ternary on signals is **L1**
// hardware (mux); **reg** reads participate as **Reg<T>** current value (L0).
// =============================================================================
//
// COMPTIME (array dimensions, generic **Int** args, etc.):
//   When `cond`, `a`, and `b` all fold to constants, the whole expression folds.
//   Use for parameterized sizes: `u8[(true ? 8 : 4)]`, `u8[((W == 8) ? 4 : 2)]` when
//   W is a generic **Int**.
//
// RUNTIME (normal hardware mux):
//   When `cond` is a **`wire`** / port / **`reg`** read, the ternary is a 2:1 mux;
//   both arms are evaluated as hardware; no folding. Same family as `when` for
//   simple scalar muxes.
//
// Casts in dimensions (`expr as uN`):
//   Dimension must be a comptime integer after trunc/extend; final value ≥ 0.
//
// =============================================================================
```

### From `comptime/generics_type_parameters.vctx` (removed header, 2026)

`SimZeroExtendGeneric` used to use smoke `assert(wide == wide)` and cited a removed xfail; it now asserts `wide == 3` like `comptime/generics/zero_extend_generic.vctx`.

```
// =============================================================================
// Language position: GENERIC PARAMETERS (spec-first; see vctx-lang/kinds-types-wire-reg.md)
//
// Kinds (L3): WIDTH, W, IN_W, … here are **Int** — compile-time integers used in types
// (e.g. `u<WIDTH>`), not `wire`/`reg`. They disappear at elaboration (§3 of that doc).
//
// Types (L2): `u<WIDTH>` is the **carrier** width; ports use **`wire`/`reg`** at the
// L1–L0 boundary for the **temporal contract** (§2, §4.2).
//
// Syntax:
//   component Name<P, Q, ...>( ports using u<P>, … ) { ... }
//   function name<P, ...>(...) -> ...
//   Instantiation: Target<arg, ...>( ... )
//   Generic function call: name<arg, ...>( value args ) — explicit `<...>` required today.
//   Use parentheses for compound args: Adder<(W + 1)>(...) so `>` is not comparison.
//
// Comptime **evaluation** (§9.1): each `<...>` argument list is folded in the constant
// folder before monomorphization. That is **not** the same as **component
// instantiation** (§9.2), which allocates hierarchy after specialization.
// =============================================================================
//
// MUST be comptime-known at each instantiation:
//   Every specialization (`Adder<8>`, `Adder<(4+4)>`, …) folds its arguments
//   before monomorphizing (one generated module per distinct argument tuple).
//
// Allowed forms (target):
//   - Literals: 8, 0x10
//   - Parenthesized arithmetic: (4 + 4)
//   - Name of an enclosing generic **Int** parameter when nesting instantiations
//
// Signedness:
//   WIDTH in `u<WIDTH>` is a *bit width* (count). It must fold to a positive
//   integer. Zero or negative width → compile error.
//
// NOT allowed:
//   - `Adder<count_reg>` where `count_reg` is a `reg` or unspecialized port
//
// Note: The toolchain may not accept `u<WIDTH>` until the parser/typechecker
// implements parameterized carrier types with angle brackets.
// =============================================================================
```

**NOTE** (old file body): *Until parameterized carrier types `u<WIDTH>` on ports are fully supported, this example used fixed `u8` on `Adder<WIDTH>` ports; `<WIDTH>` still drove specialization/monomorphization.*

### From `comptime/generics/binop_component_parameter.vctx` (removed header, 2026)

```
// =============================================================================
// §8.2 pattern **C**: “operation” as a **small component** (functor over **BinOp**)
// See: vctx-lang/kinds-types-wire-reg.md — pass **`M : Component`** with ports
// shaped like **`BinOp<T>`**, not a function pointer.
//
// **Concrete**: **`Add84`** adds two **`u4`**; **`UseBinOpAdd`** fixes **`M`** to
// that implementation. Vision:
//
//   component BinOp<T>(in a: T, in b: T, out r: T) { ... }  // contract sketch
//   component UseBinOp<M, T>(...) { op: M(a -- ..., b -- ..., r -- ...) }
//
// **Comptime**: choosing **`M`** is template specialization (§9.2); **`T`** may be
// a **Type** parameter (see `type_kind_generic_T.vctx`).
// =============================================================================
```

### From `comptime/generics/conditional_generate.vctx` (removed header, 2026)

`ConditionalElabDocStub` was renamed to **`OutHigh`**; `SimConditionalElabDocStub` → **`SimOutHigh`**. The old name implied “documentation only”; the sim still only checks a constant `1` on a `u1` output.

```
// =============================================================================
// §9.2 **Conditional structure** at elaboration time
// See: vctx-lang/kinds-types-wire-reg.md — if **`N > 4`** pick **BigFifo** else
// **SmallFifo**; the **branch** is resolved **comptime**; the discarded arm
// need not appear in the final netlist.
//
// Target surface (illustrative — exact `if`/`generate` syntax TBD):
//
//   component PickFifo<N>(in d: u1, out q: u1) {
//       if (N > 4) {
//           big: BigFifo<N>(...)
//       } else {
//           small: SmallFifo<N>(...)
//       }
//   }
//
// This is **structural elaboration**, not a runtime mux between two fifos (unless
// you intentionally build both and select — different design).
//
// **Stand-ins**: two small components with **different** storage widths; each
// `sim` picks one. Replace with a single generic **`PickFifo<N>`** when the
// elaborator supports comptime branches.
// =============================================================================
```

### From `comptime/generics/fold_vs_specialize.vctx` (removed header, 2026)

The example **now implements** the former “would be” line: `AdderW<W>` with `u<W>` ports and `FoldThenSpecializeDemo` instantiates **`AdderW<(2 + 2)>`** so `(2+2)` folds to **4** before specialization. The old “parser does not accept `u<WIDTH>`” note is obsolete.

```
// =============================================================================
// §9.3 **Side-by-side**: comptime **fold** vs template **specialize**
// See: vctx-lang/kinds-types-wire-reg.md §9.3–9.4.
//
// | Mechanism              | Primary effect                          |
// |-------------------------|-----------------------------------------|
// | **`(W * 2)` in `u<(W*2)>`** | **Int** result in the constant folder |
// | **`Adder<8>(...)`**     | Concrete module / netlist after **<>** |
//
// Same front-end discipline (generic args comptime-known); **different** back-end:
// **`eval(...)`** vs **`instantiate(...)`**.
//
// Vision: **`Adder<(2 + 2)>(...)`** — **(2+2)** folds to **4**, then **Adder<4>**
// specializes with **`u<4>`** ports. Today’s parser does not accept **`u<WIDTH>`**
// in types; this file uses fixed **`Adder4`** and keeps the fold story in comments.
// =============================================================================
```

### From `comptime/generics/function_vs_component_width.vctx` (removed header, 2026)

`scale_u8` and `scale_uW<W>(…)`: **generic `*`** on `u<W>` (unlike `+` in e.g. `AdderW`) does not type-check in the current toolchain, so the live example stays **`u8`**. The story below (function vs component, call syntax `f<8>(x)`) remains design context.

```
// =============================================================================
// §8.1 **Function** vs **component** with the same width idea
// See: vctx-lang/kinds-types-wire-reg.md — **function** ≈ inlined recipe (§9.1
// when args comptime); **component** ≈ **ports** + hierarchy (§9.2).
//
// **`scale_u8`**: expression reuse (inlined at each **`:=`**). **`Scaler8`**:
// same math behind **named ports** — a small **structural** boundary.
//
// Vision (spec): **`function scale_uW<W>(...)`** + **`Scaler<W>`** with **`u<W>`**;
// today’s grammar calls functions as **`name(x, k)`** only (no **`f<8>(...)`**),
// so this file uses fixed **`u8`** and documents the generic form in comments.
// =============================================================================
```

Note: calls like **`id_n<8>(a)`** and **`scale_uW<8>(...)`** do exist for *some* functions; the old “no `f<8>(…)`” line was overstated—see `parametric_carrier_function.vctx`. Generics for **multiply** on `u<W>` are the practical blocker here, not the call form.

### From `comptime/generics/signed_width_carrier.vctx` (removed header, 2026)

The example now uses **`SignedAddW<W>`** with **`s<W>`** ports and **`SimSignedAdd8`** instantiates **`SignedAddW<8>`** (same pattern as `AdderW` / `u<W>`). The old “fixed `s8` only / vision in comment” setup is obsolete.

```
// =============================================================================
// §4.1 **Signed** parameterized carriers: **`s<WIDTH>`**
// See: vctx-lang/kinds-types-wire-reg.md — same angle-bracket story as **`u<WIDTH>`**;
// **`s8`**, **`s16`** are fixed special cases.
//
// Target:
//   component SignedAlu<WIDTH>(in a: s<WIDTH>, in b: s<WIDTH>, out s: s<WIDTH>) { ... }
//
// **Comptime**: **WIDTH** is an **Int**; carrier shape is fixed per specialization.
// **`wire` / `reg`** still carry the **temporal** contract for those carriers (§4.2).
//
// Below: fixed **`s8`** only so today’s toolchain can typecheck arithmetic.
// =============================================================================

// Vision (comment): SignedAdd<WIDTH> with `s<WIDTH>` ports and `as s<WIDTH>` casts.
```

### From `comptime/generics/type_kind_generic_T.vctx` (removed header, 2026)

A naïve **`component Buf<T>(in x: T, out y: T)`** + **`Buf<u8>(a, b)`** does not compile today: **`E_GENERIC_INST`** (Int generic argument) rejects **`u8`** in angle brackets, and the body hits **`E_TYPE_UNKNOWN`** for assignments with **`T`**. The example therefore keeps a concrete **`BufU8`**. Distinct from width generics **`W`** in **`u<W>`**.

```
// =============================================================================
// Kind **Type** (L3): generic data-carrier parameter **T**
// See: vctx-lang/kinds-types-wire-reg.md §3, §6 — `T` classifies *types* (`u8`,
// structs, …); it is not an **Int** and not a **Component**.
//
// Target surface (spec — full **Type** generics when the checker supports them):
//   component Buf<T>(in x: T, out y: T) { y := x }
//   buf_u8: Buf<u8>(a, b)   // or named connections once `Buf<u8>` specializes
//
// **Comptime** here: each specialization `Buf<u8>`, `Buf<u16>`, … is chosen at
// instantiate time; the **carrier** `T` is fixed before elaboration (§9.2).
//
// Stand-in: **`BufU8`** (concrete) so **`vctx check`** exercises ports and **sim**.
// =============================================================================
```

### From `comptime/generics/uses_width_call_by_name.vctx` (removed header, 2026)

**Live file:** `double_uW<W>(x) -> u<W>` with `(x + x) as u<W>`, and **`UsesWidth8`** calls **`double_uW<8>(x)`** — the “call a known function by name at specialization” pattern, without a generic **`UsesWidth<W>(…)`** wrapper. A direct **`component UsesWidth<W> { y := double_uW<W>(x) }`** hits **`[E_TYPE_UNKNOWN] Unknown types: LHS=u<W>, RHS=unknown`** in the current toolchain; keep that shape in the fence below, not in source, until the checker can type nested generic function applications.

`double_u8` (non-generic) is superseded in the example by `double_uW<8>(…)` to show the width argument on the function name.

```
// =============================================================================
// §8.2 pattern **A**: type/**Int** generic + call a **known function by name**
// See: vctx-lang/kinds-types-wire-reg.md — “pluggable part” is the **name**
// `double_uW` and arguments like **W**, not a function-valued parameter.
//
// Concrete width (parses like today’s vctx):
//   `double_u8` + `UsesWidth8`.
//
// Vision (same pattern, **Int** **W**):
//   component UsesWidth<W>(in x: u<W>, out y: u<W>) {
//       y := double_uW(x)   // family of functions you wrote per discipline
//   }
//
// **Comptime**: **W** folds in `u<W>`; **double_uW** is resolved by name at
// specialization — still **not** a higher-order runtime value (§8).
// =============================================================================
```

### From `comptime/generics/wrap_inner_component.vctx` (removed header, 2026)

**Live file** already implements **`Wrap<Component M>`** with **`Wrap<CoreDup>(x, y)`**; no stand-in. The long header’s spec language (kind **Component** as template parameter) is kept below.

```
// =============================================================================
// Kind **Component** (L3): functor `Wrap` with inner template **M**
// See: vctx-lang/kinds-types-wire-reg.md §6, §8.2 D — **Outer<M>** with
// `inner: M(...)`; no runtime component “value,” only compile-time abstraction.
//
// **Concrete**: `Wrap<CoreDup>` specializes `Wrap` with `M = CoreDup`; the inner
// instance is one `hw.instance` per outer specialization (named ports required
// for `M(...)` because the callee is a type parameter).
//
//   component Wrap<Component M>(in x: u8, out y: u8) {
//       inner: M(x -- x, y -- y)
//   }
//   user: Wrap<CoreDup>(...)
// =============================================================================
```

### From `lessons/memory_without_arrays.vctx` (removed header, 2026)

```
// Wish #4: First-class block RAM or array-backed `reg` for modeling WRAM/HRAM/cart RAM
//
// Today, small memories are often spelled as many scalar `reg` lines and a mux tree.
// That is correct HDL-wise but verbose and error-prone at scale.
//
// This lesson shows the **explicit** style: two cells, explicit decode. A future array
// type could collapse this to `reg mem: u8[2]` (or a `memory` keyword) with well-defined
// read/write ports for emission and sim.
```
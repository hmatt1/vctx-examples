# comptime checklist overview

This folder is a **review checklist** for compile-time (“comptime”) positions in vctx: what must fold to a known constant before elaboration, and what the allowed surface forms are.

Companion `.vctx` files in this folder (`array_type_dimension.vctx`, `generics_type_parameters.vctx`, …) drill into each language position; each file includes `sim` blocks that instantiate the components so `vctx sim` can run them once the matching features compile. General literal forms are also covered under `literals/` and `operators/` in this repo.

**Vision doc:** `vctx-lang/kinds-types-wire-reg.md` — **kinds** (`Int`, `Type`, `Component`), **carrier types** (`u<WIDTH>`), **`wire`/`reg`** as **`Wire<T>`/`Reg<T>`** (temporal contract), and **§9** (constant folding vs component template instantiation).

## Cross-cutting rules

Intended semantics — refine as the compiler hardens.

### 1) Comptime value (**Int** / constant folder)

An expression is comptime-known when the checker can assign it a definite value (typically an **`Int`**: widths, sizes) with **no dependence** on **`reg`** reads, ports, or simulation time. That is **evaluation in the compiler** (§9.1), not hardware.

### 2) Signedness

Dimension and generic **width** arguments are counting quantities: they must be interpretable as a non-negative integer in the comptime model. A negative **literal** or a signed expression that folds negative should be rejected for array dimensions and for bit widths in **`u<WIDTH>`**.

### 3) Literals

Decimal, hex (`0x`), binary (`0b`), underscores (`1_000`), and boolean literals participate in folding once the const-propagation story is complete. Hex/binary are unsigned bit patterns unless the grammar applies a signed rule to decimal negatives only.

### 4) What is NOT comptime

Values driven from **`reg`** (L0 **state**), input ports (**Wire** discipline from outside), `sym` in formal blocks (unless later restricted), or anything that requires a clock edge to know, are **runtime** signals. They must not satisfy a “must be comptime” position — those positions expect **`Int`** or other static data, not nets.

### 5) Diagnostics

Each comptime-required position should get a dedicated error at the offending expression (e.g. “array dimension (comptime-required): … must fold …”), not a late width/unknown-type error elsewhere.

### 6) Components vs expressions

**Generic arguments** and **dimensions** use the **constant folder**. **`Slice(word, hi, lo)`** and **`Adder<8>(...)`** use **template instantiation / elaboration** (§9.2): different compiler pipeline step from “fold this arithmetic to an **Int**.”

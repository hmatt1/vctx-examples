"""
check_spec_coverage.py — report spec coverage from // spec: and // expect: headers.

Run from vctx-examples/ or any directory:
    python check_spec_coverage.py [--json] [--uncovered-only]

Each .vctx file may carry one or more header lines:
    // spec: §3.5
    // expect: pass
    // expect: fail check [E_WIDTH_MISMATCH]
    // expect: fail sim [E_SIM_ASSERTION_FAILED]
    // expect: fail mlir [E_MLIR_OUTPUT_UNDRIVEN]

Files with no // spec: header are reported as uncategorised.
Spec sections marked Supported or Partial in language-spec.md with no coverage are gaps.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import NamedTuple

# ---------------------------------------------------------------------------
# Spec section metadata (section number → (title, status))
# Extracted from docs/language-spec.md.
# ---------------------------------------------------------------------------
SPEC_SECTIONS: dict[str, tuple[str, str]] = {
    "§2":    ("Language model",                     "Supported/Required update"),
    "§2.1":  ("Type-system philosophy",             "Required update"),
    "§3":    ("Lexical grammar",                    "Supported/Required update"),
    "§3.1":  ("Whitespace and comments",            "Supported"),
    "§3.2":  ("Identifiers",                        "Supported"),
    "§3.3":  ("Keywords",                           "Supported"),
    "§3.4":  ("Delimiter whitespace / < disambig.", "Required update"),
    "§3.5":  ("Literals",                           "Supported/Required update"),
    "§4":    ("Files, packages, and imports",       "Supported"),
    "§4.1":  ("Top-level items",                    "Supported"),
    "§4.2":  ("Imports",                            "Supported"),
    "§5":    ("Declarations",                       "Supported/Partial"),
    "§5.1":  ("Components",                         "Supported/Partial"),
    "§5.2":  ("Attributes",                         "Partial"),
    "§5.3":  ("Structs",                            "Partial"),
    "§5.4":  ("Bundles",                            "Partial"),
    "§5.5":  ("Functions",                          "Supported/Partial"),
    "§5.6":  ("Comptime functions",                 "Partial"),
    "§5.7":  ("Sim blocks",                         "Supported"),
    "§5.8":  ("Formal blocks",                      "Reserved"),
    "§6":    ("Statements",                         "Supported/Required update"),
    "§6.1":  ("Blocks and bodies",                  "Supported"),
    "§6.2":  ("Declarations",                       "Supported"),
    "§6.3":  ("Assignments",                        "Supported"),
    "§6.4":  ("when",                               "Supported"),
    "§6.5":  ("Comptime/control statements",        "Supported"),
    "§6.7":  ("Global clock and reset",             "Supported"),
    "§6.8":  ("Simulation builtins",                "Supported"),
    "§7":    ("Expressions",                        "Supported"),
    "§7.1":  ("Precedence",                         "Supported"),
    "§7.2":  ("Postfix expressions",                "Supported"),
    "§7.3":  ("Function calls",                     "Supported"),
    "§7.5":  ("Operator result rules",              "Supported"),
    "§7.6":  ("Dynamic indexing and slicing",       "Supported"),
    "§8":    ("Types",                              "Supported"),
    "§8.1":  ("Type grammar",                       "Supported"),
    "§8.2":  ("Type categories",                    "Supported"),
    "§8.3":  ("Scalar types",                       "Supported"),
    "§8.4":  ("Arrays",                             "Supported"),
    "§8.5":  ("Aggregates",                         "Partial"),
    "§8.6":  ("Literals",                           "Supported"),
    "§8.7":  ("Casts",                              "Supported"),
    "§9":    ("Type compatibility",                 "Supported"),
    "§9.1":  ("Type equivalence",                   "Supported"),
    "§9.2":  ("Assignments",                        "Supported"),
    "§9.3":  ("Ports",                              "Supported"),
    "§9.4":  ("Ternary arms",                       "Supported"),
    "§10":   ("Generics and specialization",        "Supported/Partial"),
    "§10.1": ("Syntax",                             "Supported"),
    "§10.2": ("Generic parameter kinds",            "Supported/Reserved"),
    "§10.3": ("Int generics",                       "Supported"),
    "§10.4": ("Type generics",                      "Supported"),
    "§10.5": ("Component generics",                 "Supported"),
    "§10.6": ("Function generics",                  "Reserved"),
    "§10.7": ("Comptime generics",                  "Reserved"),
    "§10.8": ("Fn generics",                        "Reserved"),
    "§10.9": ("Specialization identity",            "Supported"),
    "§10.10":("Carrier substitution",               "Supported"),
    "§11":   ("Instantiation and connections",      "Supported/Partial"),
    "§12":   ("Builtins and intrinsics",            "Supported"),
    "§12.1": ("Expression builtins",                "Supported"),
    "§12.2": ("Statement builtins",                 "Supported"),
    "§13":   ("Simulation",                         "Supported"),
    "§13.2": ("Visibility and hierarchical access", "Partial"),
    "§14":   ("Formal verification",                "Reserved"),
    "§15":   ("Name resolution and scopes",         "Supported"),
    "§15.1": ("Scope hierarchy",                    "Supported"),
    "§15.2": ("Qualified lookup",                   "Supported"),
    "§15.3": ("Shadowing",                          "Supported"),
    "§16":   ("Scheduling, drivers, lowering",      "Supported/Partial"),
    "§17":   ("Diagnostics and hard constraints",   "Supported"),
    "§18":   ("Comptime termination",               "Supported"),
    "§19":   ("Non-goals",                          "—"),
}

RESERVED = {"Reserved"}
SKIP_COVERAGE = {"—"}  # §19 non-goals

_SPEC_RE = re.compile(r"//\s*spec:\s*(§[\d.]+(?:\s*,\s*§[\d.]+)*)")
_EXPECT_RE = re.compile(r"//\s*expect:\s*(.+)")


class FileRecord(NamedTuple):
    path: Path
    sections: list[str]
    expect: str  # raw expect string or "" if missing


def _parse_file(path: Path) -> FileRecord:
    sections: list[str] = []
    expect = ""
    try:
        for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
            line = line.strip()
            if not line.startswith("//"):
                break
            m = _SPEC_RE.match(line)
            if m:
                for part in m.group(1).split(","):
                    s = part.strip()
                    if s:
                        sections.append(s)
            m2 = _EXPECT_RE.match(line)
            if m2:
                expect = m2.group(1).strip()
    except Exception:
        pass
    return FileRecord(path=path, sections=sections, expect=expect)


def _collect(root: Path) -> list[FileRecord]:
    records = []
    for p in sorted(root.rglob("*.vctx")):
        # Skip build artefacts
        if "build" in p.parts or p.name.startswith("_tmp"):
            continue
        records.append(_parse_file(p))
    return records


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", action="store_true", help="Emit JSON report")
    parser.add_argument(
        "--uncovered-only",
        action="store_true",
        help="Only list sections with no coverage",
    )
    parser.add_argument(
        "root",
        nargs="?",
        default=str(Path(__file__).parent),
        help="Root directory to scan (default: directory of this script)",
    )
    args = parser.parse_args()

    root = Path(args.root).resolve()
    records = _collect(root)

    # Build section → files map
    coverage: dict[str, list[FileRecord]] = {sec: [] for sec in SPEC_SECTIONS}
    uncategorised: list[FileRecord] = []

    for rec in records:
        if not rec.sections:
            uncategorised.append(rec)
        else:
            for sec in rec.sections:
                if sec in coverage:
                    coverage[sec].append(rec)
                # unknown section: ignore for now

    # Determine gaps: Supported/Partial sections with zero coverage
    gaps: list[str] = []
    for sec, (title, status) in SPEC_SECTIONS.items():
        if status in SKIP_COVERAGE:
            continue
        if any(s in status for s in ("Reserved",)):
            continue
        if not coverage.get(sec):
            gaps.append(sec)

    if args.json:
        report = {
            "coverage": {
                sec: [str(r.path.relative_to(root)) for r in recs]
                for sec, recs in coverage.items()
                if recs
            },
            "gaps": gaps,
            "uncategorised": [str(r.path.relative_to(root)) for r in uncategorised],
        }
        print(json.dumps(report, indent=2))
        return 0

    # Human-readable table
    col1 = 10
    col2 = 36
    col3 = 22

    def _hdr(label: str) -> None:
        print(f"\n{'=' * 72}")
        print(f"  {label}")
        print(f"{'=' * 72}")

    if not args.uncovered_only:
        _hdr("SPEC COVERAGE REPORT")
        print(f"  Root: {root}")
        print(f"  Files scanned: {len(records)}  |  Uncategorised: {len(uncategorised)}")
        print()
        print(f"{'Section':<{col1}}  {'Title':<{col2}}  {'Status':<{col3}}  Files")
        print(f"{'-'*col1}  {'-'*col2}  {'-'*col3}  -----")
        for sec, (title, status) in SPEC_SECTIONS.items():
            files = coverage.get(sec, [])
            n = len(files)
            flag = "" if n > 0 else ("—" if "Reserved" in status or status in SKIP_COVERAGE else "✗ GAP")
            pass_n = sum(1 for r in files if "pass" in r.expect.lower() or not r.expect)
            fail_n = sum(1 for r in files if "fail" in r.expect.lower())
            detail = f"{pass_n}p / {fail_n}f" if n else flag
            print(f"{sec:<{col1}}  {title:<{col2}}  {status:<{col3}}  {detail}")

    _hdr(f"GAPS — Supported/Partial sections with no .vctx coverage ({len(gaps)})")
    if gaps:
        for sec in gaps:
            title, status = SPEC_SECTIONS[sec]
            print(f"  {sec:<10}  {title}  [{status}]")
    else:
        print("  None — all active sections have at least one example file.")

    if uncategorised:
        _hdr(f"UNCATEGORISED FILES — missing // spec: header ({len(uncategorised)})")
        for rec in uncategorised:
            try:
                rel = rec.path.relative_to(root)
            except ValueError:
                rel = rec.path
            print(f"  {rel}")

    # Summary
    covered = sum(1 for sec, recs in coverage.items() if recs)
    active = sum(
        1 for sec, (_, st) in SPEC_SECTIONS.items()
        if st not in SKIP_COVERAGE and "Reserved" not in st
    )
    print(f"\nCoverage: {covered}/{len(SPEC_SECTIONS)} sections have files "
          f"({active} are active, {len(gaps)} active gaps)\n")

    return 1 if gaps else 0


if __name__ == "__main__":
    sys.exit(main())

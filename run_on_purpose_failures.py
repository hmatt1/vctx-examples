"""
Run all on-purpose expected-fails and ensure they still fail.

This is a Python replacement for `run_on_purpose_failures.bat` that:
- streams output (no silent hangs),
- enforces that failing runs include at least one `[E_...]` code,
- returns non-zero if any xfail unexpectedly passes.
"""

from __future__ import annotations

import os
import re
import subprocess
import sys
from pathlib import Path
from typing import Iterable, Sequence


_E_CODE = re.compile(r"\[E_[A-Z0-9_]+\]")


def _repo_root() -> Path:
    return Path(__file__).resolve().parent


def _vctx_cli() -> Path:
    return (_repo_root().parent / "vctx-lang" / "vctx-cli.py").resolve()


def _iter_vctx_files(dir_path: Path) -> Iterable[Path]:
    if not dir_path.is_dir():
        return ()
    return sorted(p for p in dir_path.glob("*.vctx") if p.is_file())


def _run(cmd: Sequence[str], cwd: Path) -> tuple[int, str]:
    p = subprocess.run(cmd, cwd=str(cwd), capture_output=True, text=True)
    out = (p.stdout or "") + (p.stderr or "")
    return p.returncode, out


def _print_header(title: str) -> None:
    print("\n" + title)


def main() -> int:
    root = _repo_root()
    cli = _vctx_cli()
    py = sys.executable

    total = 0
    ok = 0
    bad = 0

    def run_group(kind: str, paths: Iterable[Path], pkg_from: callable | None = None) -> None:
        nonlocal total, ok, bad
        for path in paths:
            total += 1
            print()
            label = path.name
            print(f"[{kind} xfail] {label}")

            if kind == "MLIR":
                assert pkg_from is not None
                pkg = pkg_from(path)
                cmd = [py, str(cli), "mlir", "--top", pkg]
            else:
                cmd = [py, str(cli), kind.lower(), str(path.relative_to(root))]

            code, out = _run(cmd, cwd=root)
            sys.stdout.write(out)
            if not out.endswith("\n"):
                print()

            if code == 0:
                print(f"[UNEXPECTED PASS] {label}")
                bad += 1
                continue

            if not _E_CODE.search(out):
                print(f"[MISSING E_ code in output] {label}")
                bad += 1
                continue

            print(f"[OK: failed as expected with E_ code] {label} - exit {code}")
            ok += 1

    _print_header("=== Expected-fail sims: on_purpose_failures_sim ===")
    run_group("SIM", _iter_vctx_files(root / "on_purpose_failures_sim"))

    _print_header("=== Expected-fail checks: on_purpose_failures_check ===")
    run_group("CHECK", _iter_vctx_files(root / "on_purpose_failures_check"))

    _print_header("=== Expected-fail MLIR: on_purpose_failures_mlir ===")
    mlir_dir = root / "on_purpose_failures_mlir"
    run_group(
        "MLIR",
        _iter_vctx_files(mlir_dir),
        pkg_from=lambda p: f"on_purpose_failures_mlir.{p.stem}",
    )

    print("\n=== Summary ===")
    print(f"Total: {total}  OK(xfail): {ok}  UnexpectedPass: {bad}")

    return 1 if bad else 0


if __name__ == "__main__":
    raise SystemExit(main())


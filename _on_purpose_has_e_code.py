"""Return 0 if stdin or a file contains ``[E_SNAKE_CASE]``, else 1. Used by run_on_purpose_failures.bat."""
from __future__ import annotations

import re
import sys
from pathlib import Path

_RE = re.compile(r"\[E_[A-Z0-9_]+\]")


def main() -> int:
    if len(sys.argv) > 1:
        text = Path(sys.argv[1]).read_text(encoding="utf-8", errors="replace")
    else:
        text = sys.stdin.read()
    return 0 if _RE.search(text) else 1


if __name__ == "__main__":
    raise SystemExit(main())

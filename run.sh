#!/usr/bin/env python3
"""Start Boot Asteroids on Windows, macOS, or Linux."""

from pathlib import Path
import shutil
import subprocess
import sys


PROJECT_DIR = Path(__file__).resolve().parent


def main() -> int:
    uv = shutil.which("uv")
    if uv:
        command = [uv, "run", "--project", str(PROJECT_DIR), "main.py"]
    else:
        command = [sys.executable, str(PROJECT_DIR / "main.py")]

    try:
        completed = subprocess.run(command, cwd=PROJECT_DIR, check=False)
    except FileNotFoundError as error:
        print(f"Unable to start Boot Asteroids: {error}", file=sys.stderr)
        return 1

    return completed.returncode


if __name__ == "__main__":
    raise SystemExit(main())

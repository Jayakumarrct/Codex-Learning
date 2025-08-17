#!/bin/bash
set -e
python3 --version
pip3 --version
python3 - <<'PY'
import PIL, py2app, tkinter
print(f"Pillow {PIL.__version__}")
print(f"py2app {py2app.__version__}")
print(f"Tk {tkinter.TkVersion}")
PY

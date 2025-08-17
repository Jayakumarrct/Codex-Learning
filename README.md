# Image to EPS (macOS)

Convert JPG/JPEG/JPS/PNG → EPS.

## Install options
**A) DMG (drag-and-drop)**
1. Open `ImageToEPS.dmg`
2. Drag **Image to EPS.app** → **Applications**
3. Launch via Spotlight

**B) Setup.pkg (double-click installer)**
1. Unzip `ImageToEPS-Setup.zip`
2. Run `ImageToEPS-Setup.pkg`
3. App installs to **/Applications**

Gatekeeper: right-click → Open (first run).

## Use
Open app → “Open Images…” → pick files → choose output folder → EPS files appear there.

## Local build (macOS)
```bash
make dist
# Outputs:
#   ./ImageToEPS.dmg
#   ./ImageToEPS-Setup.zip  (contains ImageToEPS-Setup.pkg)
```

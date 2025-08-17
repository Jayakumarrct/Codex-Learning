# Image to EPS (macOS)

Convert JPG/JPEG/JPS/PNG → EPS. Two installers provided.

## Install options
**Option A — DMG (drag-and-drop)**
1. Open `ImageToEPS.dmg`
2. Drag **Image to EPS.app** to **Applications**
3. Launch from Spotlight: type “Image to EPS”

**Option B — Setup.pkg (double-click installer)**
1. Unzip `ImageToEPS-Setup.zip`
2. Double-click `ImageToEPS-Setup.pkg`
3. Follow prompts. The app is installed to **/Applications**

Gatekeeper: if blocked, right-click the app → Open once.

## Use
Open app → “Open Images…” → select .jpg/.jpeg/.jps/.png → choose output folder → EPS files are written there.

## Local build (macOS)
```bash
make dist
# Outputs:
#   ./ImageToEPS.dmg
#   ./ImageToEPS-Setup.zip  (contains ImageToEPS-Setup.pkg)
```

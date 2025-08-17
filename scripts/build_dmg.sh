#!/bin/bash
set -e
APP_NAME="Image to EPS"
DMG_NAME="ImageToEPS"
rm -rf build dist package "${DMG_NAME}.dmg"
python3 setup.py py2app
mkdir -p package
cp -R "dist/${APP_NAME}.app" package/
hdiutil create -volname "${APP_NAME}" -srcfolder package -ov -format UDZO "${DMG_NAME}.dmg"

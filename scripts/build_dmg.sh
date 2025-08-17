#!/bin/bash
set -e
APP_NAME="ImageToEPS"
rm -rf build dist package "${APP_NAME}.dmg"
python3 setup.py py2app
codesign --deep --force --sign - "dist/${APP_NAME}.app"
mkdir -p package
cp -R "dist/${APP_NAME}.app" package/
hdiutil create -volname "${APP_NAME}" -srcfolder package -ov -format UDZO "${APP_NAME}.dmg"

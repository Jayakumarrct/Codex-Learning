#!/bin/bash
set -e
rm -rf build dist
python3 setup.py py2app
APP_NAME="Image to EPS.app"
hdiutil create -volname "Image to EPS" -srcfolder "dist/${APP_NAME}" ImageToEPS.dmg

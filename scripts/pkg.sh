#!/bin/bash
set -e
APP_PATH=./build/export/Image2EPS.app
PKG_ROOT=./pkgroot/Applications
mkdir -p "$PKG_ROOT"
rsync -a "$APP_PATH" "$PKG_ROOT/"
pkgbuild --root ./pkgroot --install-location /Applications --identifier com.example.image2eps --version 1.0.0 --sign "Developer ID Installer" ./build/Image2EPS.component.pkg || pkgbuild --root ./pkgroot --install-location /Applications --identifier com.example.image2eps --version 1.0.0 ./build/Image2EPS.component.pkg
productbuild --distribution ./scripts/Distribution.xml --resources ./scripts/Resources --package-path ./build --sign "Developer ID Installer" ./dist/Image2EPS.pkg || productbuild --distribution ./scripts/Distribution.xml --resources ./scripts/Resources --package-path ./build ./dist/Image2EPS.pkg
shasum -a 256 ./dist/Image2EPS.pkg > ./dist/SHA256.txt

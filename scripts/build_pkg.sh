#!/bin/bash
set -e
APP_NAME="Image to EPS.app"
PKGROOT="pkgroot"
rm -rf "$PKGROOT"
mkdir -p "$PKGROOT/Applications"
cp -R "dist/${APP_NAME}" "$PKGROOT/Applications/"
pkgbuild --root "$PKGROOT" --identifier com.example.ImageToEPS --install-location / ImageToEPS-Setup.pkg

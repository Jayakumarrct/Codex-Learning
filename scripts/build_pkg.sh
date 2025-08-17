#!/bin/bash
set -e
APP_NAME="Image to EPS"
PKG_NAME="ImageToEPS-Setup.pkg"
rm -rf pkgroot "${PKG_NAME}"
mkdir -p pkgroot/Applications
cp -R "dist/${APP_NAME}.app" pkgroot/Applications/
pkgbuild --root pkgroot --identifier com.example.imagetoeps --install-location / "${PKG_NAME}"

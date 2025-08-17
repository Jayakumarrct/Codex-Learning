#!/bin/bash
set -e
PKG_NAME="ImageToEPS-Setup.pkg"
ZIP_NAME="ImageToEPS-Setup.zip"
rm -f "${ZIP_NAME}"
zip -r "${ZIP_NAME}" "${PKG_NAME}"

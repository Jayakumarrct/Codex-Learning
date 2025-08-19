#!/bin/bash
set -e
xcodebuild archive -scheme Image2EPS -configuration Release -archivePath ./build/Image2EPS.xcarchive
xcodebuild -exportArchive -archivePath ./build/Image2EPS.xcarchive -exportOptionsPlist ./scripts/ExportOptions.plist -exportPath ./build/export

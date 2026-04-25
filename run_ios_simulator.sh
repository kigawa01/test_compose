#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SIMULATOR_ID="9DBE993F-F3A8-4848-B8B8-E216D264F0DA"
BUNDLE_ID="com.example.test_compose.test_compose"
DERIVED_DATA="$SCRIPT_DIR/build/ios"

cd "$SCRIPT_DIR"

echo "==> Building KMP framework..."
./gradlew :composeApp:linkDebugFrameworkIosSimulatorArm64

echo "==> Building iOS app..."
xcodebuild \
  -scheme iosApp \
  -project iosApp/iosApp.xcodeproj \
  -configuration Debug \
  -destination "platform=iOS Simulator,id=$SIMULATOR_ID" \
  -derivedDataPath "$DERIVED_DATA" \
  build

echo "==> Booting simulator..."
BOOT_STATE=$(xcrun simctl list devices | grep "$SIMULATOR_ID" | grep -o "(Booted)\|(Shutdown)" | tr -d '()')
if [ "$BOOT_STATE" != "Booted" ]; then
  xcrun simctl boot "$SIMULATOR_ID"
fi
open -a Simulator

echo "==> Installing app..."
APP_PATH="$DERIVED_DATA/Build/Products/Debug-iphonesimulator/test_compose.app"
xcrun simctl install "$SIMULATOR_ID" "$APP_PATH"

echo "==> Launching app..."
xcrun simctl launch --console-pty "$SIMULATOR_ID" "$BUNDLE_ID"
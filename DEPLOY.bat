@echo off
setlocal EnableDelayedExpansion

echo ============================================
echo FamilyForge - Build and Deploy Script
echo ============================================
echo.

:: Check Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js not found. Please install Node.js first.
    pause
    exit /b 1
)

:: Check dependencies
echo [1/5] Checking dependencies...
if not exist "node_modules" (
    echo Installing dependencies...
    npm install --legacy-peer-deps
)

:: Check for required files
echo [2/5] Checking configuration...
if not exist "assets\icon.png" (
    echo WARNING: Missing assets/icon.png
    echo Please add app icons to assets/ folder
)

:: Prebuild
echo [3/5] Prebuilding for native code...
npx expo prebuild --clean

if errorlevel 1 (
    echo ERROR: Prebuild failed!
    pause
    exit /b 1
)

:: iOS Build (if on macOS)
echo [4/5] Building...
if exist "ios" (
    echo iOS project found. Building...
    cd ios
    pod install
    cd ..
    npx expo run:ios --configuration Release
)

:: Android Build
if exist "android" (
    echo Android project found. Building...
    cd android
    if not exist "android\app\src\main\assets" mkdir android\app\src\main\assets
    cd ..
    npx expo run:android --variant release
)

echo.
echo ============================================
echo BUILD COMPLETE!
echo.
echo Next steps:
echo 1. Test the app on a physical device
echo 2. Update AdMob IDs in source files
echo 3. Configure app signing
echo 4. Submit to App Store / Play Store
echo.
echo For EAS Build:
echo   eas build:configure
echo   eas build --platform all
echo ============================================
pause

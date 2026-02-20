@echo off
echo ============================================
echo FamilyForge - Quick Run (No Build Needed)
echo ============================================
echo.

node -v >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Install Node.js first: https://nodejs.org/
    pause
    exit /b 1
)

echo [1/2] Installing packages...
if not exist "node_modules" (
    call npm install
)

echo.
echo [2/2] Starting app...
echo.
echo ============================================
echo FOLLOW THESE STEPS:
echo ============================================
echo.
echo 1. Install "Expo Go" app on your phone
echo    - iPhone: App Store
echo    - Android: Play Store
echo.
echo 2. Make sure your phone is on the SAME WiFi as this computer
echo.
echo 3. A QR code will appear below - scan it with your phone camera
echo.
echo 4. The app will open in Expo Go instantly!
echo.
echo ============================================
echo Press any key to start...
pause >nul

call npx expo start

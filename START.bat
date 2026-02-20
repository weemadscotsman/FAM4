@echo off
setlocal EnableDelayedExpansion

echo ============================================
echo FamilyForge - Quick Start
echo ============================================
echo.

:: Check Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js not found. Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo Node.js version:
node -v
echo.

:: Check if dependencies are installed
if not exist "node_modules" (
    echo [1/2] Installing dependencies...
    call npm install
    if errorlevel 1 (
        echo ERROR: npm install failed!
        pause
        exit /b 1
    )
) else (
    echo [1/2] Dependencies already installed
)

echo.
echo [2/2] Starting Expo development server...
echo.
echo Scan the QR code with Expo Go app on your phone
echo Or press 'a' to open Android emulator
echo.

call npx expo start

pause

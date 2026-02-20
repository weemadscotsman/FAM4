@echo off
setlocal EnableDelayedExpansion

echo ============================================
echo FamilyForge - APK Builder
echo ============================================
echo.

:: Check Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js not found. Please install Node.js first.
    pause
    exit /b 1
)

:: Check if dependencies are installed
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
)

:: Check if EAS CLI is installed
eas --version >nul 2>&1
if errorlevel 1 (
    echo Installing EAS CLI...
    call npm install -g eas-cli
)

:: Check if logged in to EAS
echo.
echo Checking Expo login status...
call eas whoami >nul 2>&1
if errorlevel 1 (
    echo.
    echo You need to log in to Expo first.
    echo Run: eas login
    echo Or create an account at https://expo.dev/signup
    pause
    exit /b 1
)

echo.
echo ============================================
echo Choose build option:
echo ============================================
echo [1] Build APK (for testing - 5 min, local install)
echo [2] Build AAB (for Play Store upload)
echo [3] Cancel
echo.
set /p choice="Enter choice (1-3): "

if "!choice!"=="1" goto build_apk
if "!choice!"=="2" goto build_aab
if "!choice!"=="3" goto cancel
goto invalid

:build_apk
echo.
echo Building APK for Android...
echo This will take about 5-10 minutes...
echo.
call eas build --platform android --profile preview
if errorlevel 1 (
    echo.
    echo Build failed! Check the error messages above.
    pause
    exit /b 1
)
goto done

:build_aab
echo.
echo Building AAB for Play Store...
echo This will take about 10-15 minutes...
echo.
call eas build --platform android --profile production
if errorlevel 1 (
    echo.
    echo Build failed! Check the error messages above.
    pause
    exit /b 1
)
goto done

:cancel
echo.
echo Build cancelled.
pause
exit /b 0

:invalid
echo.
echo Invalid choice.
pause
exit /b 1

:done
echo.
echo ============================================
echo Build initiated successfully!
echo ============================================
echo.
echo You can monitor the build at:
echo https://expo.dev/builds
echo.
echo Once complete, download the APK/AAB from the link provided.
echo.
pause

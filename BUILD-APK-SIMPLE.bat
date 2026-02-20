@echo off
echo ============================================
echo FamilyForge APK Builder - Simple Mode
echo ============================================
echo.

REM Check Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Node.js not found! Install from https://nodejs.org/
    pause
    exit /b 1
)

REM Install dependencies
echo [1/4] Installing dependencies...
if not exist "node_modules" (
    npm install
)

REM Prebuild Android project
echo.
echo [2/4] Preparing Android project...
call npx expo prebuild --platform android --clean
if errorlevel 1 (
    echo [ERROR] Prebuild failed!
    pause
    exit /b 1
)

REM Build debug APK
echo.
echo [3/4] Building APK (this may take a few minutes)...
cd android

REM Fix gradle permissions and build
if exist "gradlew.bat" (
    call gradlew.bat assembleDebug --console=plain
) else (
    echo [ERROR] Gradle not found. Install Android Studio!
    pause
    exit /b 1
)

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    echo.
    echo Common fixes:
    echo 1. Install Android Studio from https://developer.android.com/studio
    echo 2. Open Android Studio, let it download SDK automatically
    echo 3. Set ANDROID_HOME environment variable
    echo 4. Run this script again
    cd ..
    pause
    exit /b 1
)

cd ..

REM Copy APK
echo.
echo [4/4] Copying APK...
if not exist "output" mkdir output

for /f "delims=" %%a in ('dir /s /b "android\app\build\outputs\apk\debug\app-debug.apk" 2^>nul') do (
    copy "%%a" "output\FamilyForge.apk" >nul
    echo.
    echo ============================================
    echo SUCCESS! APK built!
    echo ============================================
    echo.
    echo Location: output\FamilyForge.apk
    echo.
    echo Install to your phone:
    echo   1. Enable "Developer Options" on phone
    echo   2. Enable "USB Debugging"
    echo   3. Connect phone via USB
    echo   4. Run: adb install output\FamilyForge.apk
    echo.
    echo OR just copy the APK to your phone and tap it.
    echo.
    goto done
)

echo [WARNING] Could not find APK automatically.
echo Search in: android\app\build\outputs\apk\debug\

:done
pause

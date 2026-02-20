@echo off
setlocal EnableDelayedExpansion

echo ============================================
echo FamilyForge - Local APK Builder
echo ============================================
echo.
echo This script builds the APK locally using Android Studio.
echo Make sure you have Android Studio installed with SDK.
echo.

:: Check Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js not found. Please install Node.js first.
    pause
    exit /b 1
)

:: Check JAVA_HOME
if "!JAVA_HOME!"=="" (
    echo WARNING: JAVA_HOME not set. Trying to find Java...
    where java >nul 2>&1
    if errorlevel 1 (
        echo ERROR: Java not found. Please install JDK 17 or 21.
        pause
        exit /b 1
    )
)

:: Install dependencies if needed
if not exist "node_modules" (
    echo [1/4] Installing dependencies...
    call npm install
    if errorlevel 1 (
        echo ERROR: npm install failed!
        pause
        exit /b 1
    )
) else (
    echo [1/4] Dependencies already installed
)

:: Prebuild for Android
echo.
echo [2/4] Prebuilding native Android project...
call npx expo prebuild --platform android --clean
if errorlevel 1 (
    echo ERROR: Prebuild failed!
    pause
    exit /b 1
)

:: Check if android folder exists
if not exist "android" (
    echo ERROR: Android project folder not created!
    pause
    exit /b 1
)

:: Build debug APK
echo.
echo [3/4] Building debug APK...
cd android

:: Make gradlew executable (if on Windows with WSL/git bash)
if exist "gradlew" (
    call gradlew.bat assembleDebug
) else (
    echo ERROR: Gradle wrapper not found!
    echo Make sure Android Studio is properly configured.
    pause
    exit /b 1
)

if errorlevel 1 (
    echo.
    echo ERROR: Build failed! 
    echo Common issues:
    echo - Android SDK not properly installed
    echo - ANDROID_HOME not set
    echo - Gradle daemon issues (try: cd android ^&^& gradlew --stop)
    cd ..
    pause
    exit /b 1
)

cd ..

:: Copy APK to root
echo.
echo [4/4] Copying APK to output folder...
if not exist "output" mkdir output

for /f "delims=" %%a in ('dir /s /b "android\app\build\outputs\apk\debug\app-debug.apk" 2^>nul') do (
    copy "%%a" "output\FamilyForge-debug.apk" >nul
    echo APK copied to: output\FamilyForge-debug.apk
    goto success
)

echo WARNING: Could not find APK file automatically.
echo Search in: android\app\build\outputs\apk\debug\
goto done

:success
echo.
echo ============================================
echo BUILD SUCCESSFUL!
echo ============================================
echo.
echo Install the APK on your device:
echo   adb install output\FamilyForge-debug.apk
echo.

:done
pause

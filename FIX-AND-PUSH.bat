@echo off
echo ============================================
echo FamilyForge - Fix & Push to GitHub
echo ============================================
echo.

echo Checking git status...
git status
echo.

echo [1/5] Making sure we're on main branch...
git checkout main 2>nul || git checkout -b main
echo.

echo [2/5] Adding ALL files (not just README)...
git add -A
echo.

echo [3/5] Checking what files are staged...
git status --short
echo.

echo [4/5] Committing everything...
git commit -m "FamilyForge v1.0 - Full React Native app with 3D heritage visualization"
echo.

echo [5/5] Pushing to GitHub...
git remote remove origin 2>nul
git remote add origin https://github.com/weemadscotsman/familyforge.git
git push -u origin main --force

echo.
echo ============================================
IF %ERRORLEVEL% EQU 0 (
    echo SUCCESS! View at:
    echo https://github.com/weemadscotsman/familyforge
) ELSE (
    echo PUSH FAILED!
    echo.
    echo Try logging in again:
    echo   git credential-manager reject https://github.com
    echo   git push -u origin main
    echo.
    echo Or use token:
    echo   git push https://TOKEN@github.com/weemadscotsman/familyforge.git main
)
echo ============================================
pause

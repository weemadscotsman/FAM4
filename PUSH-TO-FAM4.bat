@echo off
echo ============================================
echo Pushing FamilyForge to FAM4 Repo
echo ============================================
echo.

echo [1/4] Adding ALL app files...
git add -A
echo.

echo [2/4] Committing...
git commit -m "FamilyForge v1.0 - Full React Native heritage app"
echo.

echo [3/4] Setting remote to FAM4...
git remote remove origin 2>nul
git remote add origin https://github.com/weemadscotsman/FAM4.git
git branch -M main
echo.

echo [4/4] Pushing to FAM4...
git push -u origin main --force

echo.
echo ============================================
IF %ERRORLEVEL% EQU 0 (
    echo SUCCESS! View your code:
    echo https://github.com/weemadscotsman/FAM4
) ELSE (
    echo ERROR! Try this manual command:
    echo git push https://YOUR_TOKEN@github.com/weemadscotsman/FAM4.git main --force
)
echo ============================================
pause

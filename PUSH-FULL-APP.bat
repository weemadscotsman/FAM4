@echo off
echo ============================================
echo Pushing FULL FamilyForge App to GitHub
echo ============================================
echo.

git init
git add .
git commit -m "FamilyForge v1.0 - Full React Native app"
git branch -M main
git remote add origin https://github.com/weemadscotsman/familyforge.git 2>nul
git push -u origin main

echo.
echo ============================================
echo DONE! View your code at:
echo https://github.com/weemadscotsman/familyforge
echo ============================================
pause

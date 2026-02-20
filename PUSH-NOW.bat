@echo off
echo ============================================
echo Pushing FamilyForge to GitHub
echo ============================================
echo.

git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git not installed!
    echo Get it from: https://git-scm.com/download/win
    pause
    exit /b 1
)

if not exist ".git" (
    echo [1/5] Initializing git...
    git init
) else (
    echo [1/5] Git ready
)

echo [2/5] Adding files...
git add .

echo [3/5] Committing...
git commit -m "FamilyForge v1.0 - Initial commit"

echo [4/5] Connecting to GitHub...
git remote remove origin 2>nul
git remote add origin https://github.com/weemadscotsman/familyforge.git
git branch -M main

echo [5/5] Pushing...
git push -u origin main

if errorlevel 1 (
    echo.
    echo PUSH FAILED - Try this:
    echo 1. Set your git email: git config --global user.email "you@email.com"
    echo 2. Set your git name: git config --global user.name "Your Name"
    echo 3. Run this again
    pause
    exit /b 1
)

echo.
echo ============================================
echo SUCCESS! View at:
echo https://github.com/weemadscotsman/familyforge
echo ============================================
pause

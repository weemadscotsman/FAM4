@echo off
echo ============================================
echo FamilyForge - Upload to GitHub
echo ============================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git not found!
    echo Install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Check if already initialized
if not exist ".git" (
    echo [1/5] Initializing Git repository...
    git init
) else (
    echo [1/5] Git already initialized
)

echo.
echo [2/5] Adding files...
git add .

echo.
echo [3/5] Committing...
git commit -m "FamilyForge v1.0 - Initial commit"

echo.
echo [4/5] Setting up remote...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/weemadscotsman/familyforge.git

echo.
echo [5/5] Pushing to GitHub...
git branch -M main
git push -u origin main --force

if errorlevel 1 (
    echo.
    echo [ERROR] Push failed!
    echo.
    echo Common issues:
    echo 1. You need to login to GitHub first:
    echo    git config --global user.email "you@example.com"
    echo    git config --global user.name "Your Name"
    echo.
    echo 2. Create the repo on GitHub first:
    echo    https://github.com/new
    echo    Name it: familyforge
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================
echo SUCCESS! Code uploaded to GitHub!
echo ============================================
echo.
echo View your code:
echo https://github.com/weemadscotsman/familyforge
echo.
pause

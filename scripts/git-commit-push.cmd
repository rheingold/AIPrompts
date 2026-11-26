@echo off
:: git-commit-push.cmd — one-shot: add ALL, auto-message commit, push to origin/master
:: Usage:  cd d:\plachy\Dokumenty\Dev\AI\_AIPrompts ^& git-commit-push "optional message"
:: Works on both cmd.exe and PowerShell (via .cmd extension).

setlocal enabledelayedexpansion

:: --- config ---
set BRANCH=master
set USER_NAME=Rheingold
set USER_EMAIL=lukas@plachy.eu
set IGNORE_DIR=scripts\

:: --- check git repo ---
git rev-parse --is-inside-work-tree >nul 2>&1 || ( echo ERROR: not a git repo && exit /b 1 )

:: --- collect changed files ---
for /f "delims=" %%F in ('git status --porcelain') do set LINE=%%F
set FILE_LIST=
set FILE_COUNT=0
for /f "delims=" %%L in ('git status --porcelain') do (
    :: skip scripts dir entries
    if not "!LINE:~3!" == "" if "!LINE:~3!" neq "%IGNORE_DIR%" set LINE=!LINE!
)

:: simpler approach — just use git status output directly
for /f "tokens=2,*" %%A in ('git status --porcelain') do (
    set REL_PATH=%%B
    :: skip our own scripts dir
    if not "!REL_PATH:~0,7!" == "%IGNORE_DIR%" (
        set FILE_LIST=!FILE_LIST! %%B
        set /a FILE_COUNT=!FILE_COUNT!+1
    )
)

if !FILE_COUNT! equ 0 ( echo Nothing to commit. & exit /b 0 )

:: --- build message ---
set MSG=%~1
if "%MSG%"=="" set MSG=Update: %FILE_COUNT% file(s)

echo.
echo === git-commit-push ===
echo Branch : !BRANCH!
echo Files  : !FILE_COUNT!
echo Message: !MSG!
echo -------------------------
for /f "tokens=* delims=" %%X in ('git status --porcelain') do ( echo !LINE:~3!)
echo.

:: --- stage everything ---
git add . >nul 2>&1 || ( echo ERROR: git add failed & exit /b 3 )

:: --- commit ---
git config user.name "%USER_NAME%"
git config user.email "%USER_EMAIL%"
git commit -m "!MSG!" >nul 2>&1
if errorlevel 1 ( echo ERROR: commit failed & exit /b 4 )

:: --- push ---
echo Pushing to origin/!BRANCH! ...
git pull --ff-only origin !BRANCH! 2>nul || git pull --rebase origin !BRANCH! 2>nul
git push origin !BRANCH!
if errorlevel 1 ( echo WARNING: push failed. Try manually: git pull --rebase && git push & exit /b 5 )

echo Done ^<^>
exit /b 0

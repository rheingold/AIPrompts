@echo off
REM ============================================================================
REM  git-commit-push.bat
REM  One-shot: add ALL changed files, auto-message commit, push.
REM  Usage from repo root (cmd.exe or PowerShell):
REM      git-commit-push                     REM   auto-generated message
REM      git-commit-push "my custom msg"     REM   use your own message
REM  Skips its own directory (/scripts/) so the tool never commits itself.
REM ============================================================================

setlocal enabledelayedexpansion

REM --- config ---
set BRANCH=master
set USER_NAME=Rheingold
set USER_EMAIL=lukas@plachy.eu

REM --- 1. must be inside a git repo ---
git rev-parse --is-inside-work-tree >nul 2>&1 || ( echo ERROR: not inside a git repository & exit /b 1 )

REM --- 2. collect changed files, skip our own dir ---
set TMPFILES=%TEMP%\_gcp_files.txt
if exist "%TMPFILES%" del /q "%TMPFILES%"
git status --porcelain > "%TMPFILES%"

REM count non-scripts lines
set FILE_COUNT=0
for /f "tokens=2,*" %%A in ('type "%TMPFILES%"') do (
    set REL=%%B
    REM skip if path starts with scripts\
    if "!REL:~0,8!"=="scripts\" (
        REM nothing — this file is our own tool dir
    ) else (
        set /a FILE_COUNT=!FILE_COUNT!+1
    )
)

if !FILE_COUNT! equ 0 ( echo Nothing to commit. & exit /b 0 )

REM --- 3. message ---
set MSG=%~1
if "%MSG%"=="" set MSG=auto: !FILE_COUNT! file(s) changed

echo.
echo === git-commit-push ===
git rev-parse --abbrev-ref HEAD 2>nul || ( echo Branch : master )
echo Files  : !FILE_COUNT!
echo Message: "!MSG!"
echo -------------------------
type "%TMPFILES%"
echo.

REM --- 4. stage all, commit with auto-message, push ---
git add . >nul 2>&1 || ( echo WARNING: git add failed & del /q "%TMPFILES%" & exit /b 3 )

git config user.name "%USER_NAME%"
git config user.email "%USER_EMAIL%"
git commit -m "!MSG!" >nul 2>&1
if errorlevel 1 ( echo ERROR: commit failed & del /q "%TMPFILES%" & exit /b 4 )

echo Pushing to origin/!BRANCH! ...
REM try fast-forward first; on rejection fall back to rebase
git pull --ff-only origin !BRANCH! >nul 2>&1 || git pull --rebase origin !BRANCH! >nul 2>&1
git push origin !BRANCH!
if errorlevel 1 ( echo WARNING: push failed — try manually: git pull --rebase && git push & del /q "%TMPFILES%" & exit /b 5 )

echo Done ^<^>
del /q "%TMPFILES%"
exit /b 0

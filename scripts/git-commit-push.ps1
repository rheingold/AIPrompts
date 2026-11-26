#Requires -Version 5.1
<#
.SYNOPSIS
    One-shot git add / commit / push — no AI needed.
.DESCRIPTION
    Usage (PowerShell):
        .\scripts\git-commit-push.ps1              # commit ALL changes with auto-msg
        .\scripts\git-commit-push.ps1 "my custom msg"  # use exact message

    Safety: aborts if working tree has unmerged conflicts.
#>
[CmdletBinding()]
param(
    [Parameter(Position=0, HelpMessage="Optional commit message (auto-generated if omitted)")]
    [string]$CommitMessage = ""
)

Set-StrictMode -Version Latest; $ErrorActionPreference = "Stop"

$root   = $PSScriptRoot | Split-Path -Parent  # project root dir
$branch = git -C $root rev-parse --abbrev-ref HEAD 2>$null
if (-not $?) { Write-Warning "Not a git repo"; exit 1 }

# --- safety: no unmerged / conflict state ---
$conflicts = git -C $root diff --name-only --diff-filter=U 2>$null
if ($conflicts) {
    Write-Error "Unmerged conflicts detected — aborting:`n$(($conflicts | ForEach-Object {" $_"})`)" ; exit 2 }

# --- collect changed files (tracked + untracked, exclude our own script tree) ---
$ignorePrefix = Join-Path $root ("scripts" + [IO.Path]::DirectorySeparatorChar)
$changed     = git -C $root status --porcelain -z 2>$null | ForEach-Object { $_ }

# parse porcelain output (NUL-delimited for safety with spaces in names)
$lines = ($changed -split "`0").Trim() | Where-Object { $_ }
$fileList = @()
foreach ($line in $lines) {
    # skip our own script dir
    $fPath = Join-Path $root ($line.Substring(3))
    if ($fPath.StartsWith($ignorePrefix, [ StringComparison ]::OrdinalIgnoreCase)) { continue }
    if (-not (Test-Path $fPath)) { continue }  # deleted during this run — skip
    $fileList += $fPath }

if (-not $fileList) { Write-Host "Nothing to commit." ; exit 0 }

# --- build message ---
$shortMsg = if ($CommitMessage) { $CommitMessage } else { "Update: $($fileList.Count) file(s)" }
$fileSumm = $fileList | ForEach-Object { $_.Replace($root + "\", "") }
echo "" ; echo "=== git-commit-push ==="
echo "Branch : $branch"
echo "Files  : $($fileList.Count)"
echo "Message: $shortMsg"
echo "--- files ---"
$fileSumm | ForEach-Object { Write-Host ("  + $_") }
echo ""

# --- stage ---
git -C $root add . >$null
if ($LASTEXITCODE) { Write-Error "add failed"; exit 3 }

# --- commit ---
git -C $root config user.name "Rheingold"
git -C $root config user.email "lukas@plachy.eu"
git -C $root commit -m $shortMsg >$null
if ($LASTEXITCODE) { Write-Error "commit failed"; exit 4 }

# --- push (rebase first to minimize conflicts) ---
echo "Pushing to origin/$branch ..."
git -C $root pull --ff-only origin $branch 2>$null | Write-Host
$pushOk = git -C $root push origin $branch 2>&1
if ($LASTEXITCODE) {
    # rebase may have been needed — offer a hint
    if ($pushOk -match "updates were rejected") {
        Write-Warning "Rejection received. Run 'git pull --rebase && git push' manually." }
    exit 5 }

Write-Host "`nDone ✔" -ForegroundColor Green

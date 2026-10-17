# Doubao Character Asset Skills - one-click installer (Windows PowerShell)
#
# Quick install:
#   irm https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.ps1 | iex
#
# Upgrade (overwrite with auto-backup):
#   & ([scriptblock]::Create((irm https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.ps1))) -Force
#
# Custom target directory:
#   & ([scriptblock]::Create((irm https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.ps1))) -TargetDir "D:\my-skills"

[CmdletBinding()]
param(
    [string]$Repo = "zh13293895107-creator/doubao-character-asset-skills",
    [string]$Branch = "main",
    [string]$TargetDir = "",
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$Skills = @("photoreal-face-plate", "photoreal-garment-plate", "character-asset-sheet")

# --- Locate the Doubao user skills directory ---
if (-not $TargetDir) {
    $candidates = @(
        (Join-Path $env:USERPROFILE "AppData\Local\Doubao\User Data\Default\.doubao\agent_mode\workspace\.user_skills"),
        (Join-Path $env:APPDATA "Doubao\User Data\Default\.doubao\agent_mode\workspace\.user_skills"),
        (Join-Path $env:USERPROFILE ".doubao\agent_mode\workspace\.user_skills")
    )
    foreach ($c in $candidates) {
        if ($c -and (Test-Path $c)) { $TargetDir = $c; break }
    }
    if (-not $TargetDir) { $TargetDir = $candidates[0] }
}

Write-Host "==> Doubao Character Asset Skills installer"
Write-Host "Target skills directory: $TargetDir"
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

# --- Ensure TLS 1.2 for the download ---
try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 } catch { }

# --- Download and extract the repository zip ---
$tmp = Join-Path $env:TEMP ("dcas_" + [Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
$zip = Join-Path $tmp "skills.zip"
$url = "https://github.com/$Repo/archive/refs/heads/$Branch.zip"
Write-Host "Downloading $url ..."
Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing
Expand-Archive -Path $zip -DestinationPath $tmp -Force

$srcRoot = Get-ChildItem -Path $tmp -Directory | Where-Object { Test-Path (Join-Path $_.FullName "skills") } | Select-Object -First 1
if (-not $srcRoot) { throw "Downloaded package does not contain a skills/ folder." }

# --- Install each skill ---
$installed = 0
$skipped = 0
foreach ($s in $Skills) {
    $src = Join-Path $srcRoot.FullName "skills\$s"
    $dst = Join-Path $TargetDir $s
    if (-not (Test-Path (Join-Path $src "SKILL.md"))) { throw "Package corrupt: $s/SKILL.md missing." }

    if (Test-Path $dst) {
        if ($Force) {
            $bak = "{0}.bak.{1}" -f $dst, (Get-Date -Format "yyyyMMddHHmmss")
            Copy-Item $dst $bak -Recurse -Force
            Remove-Item $dst -Recurse -Force
            Write-Host "  [updated] $s  (backup: $bak)"
        } else {
            Write-Host "  [skipped] $s  (already exists; re-run with -Force to upgrade, old version is auto-backed-up)"
            $skipped++
            continue
        }
    } else {
        Write-Host "  [installed] $s"
    }

    Copy-Item $src $dst -Recurse
    if (-not (Test-Path (Join-Path $dst "SKILL.md"))) { throw "Install failed: $s/SKILL.md missing after copy." }
    $installed++
}

Remove-Item $tmp -Recurse -Force
Write-Host "==> Done. Installed/updated: $installed, skipped: $skipped."
Write-Host "    Restart or reload the Doubao session to load the skills."

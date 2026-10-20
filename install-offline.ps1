# 豆包角色资产技能包 —— 离线安装脚本（Windows / PowerShell）
# 不联网，直接把本文件夹 skills\ 下的三个技能复制到豆包 .user_skills 目录。
# 已存在的同名技能会先备份为 .bak.时间戳 再覆盖，保证幂等、可回退。

[CmdletBinding()]
param(
    [string]$SourceDir = "",
    [string]$TargetDir = "",
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$Skills = @("photoreal-face-plate", "photoreal-garment-plate", "character-asset-sheet")

# 1. 确定技能来源（本文件夹下的 skills 目录）
if (-not $SourceDir) { $SourceDir = $PSScriptRoot }
# 清洗 bat 传入的 %~dp0：去掉泄漏的引号和末尾反斜杠，避免 \" 被当成转义引号
$SourceDir = $SourceDir.Trim('"').TrimEnd('\')
$srcSkills = Join-Path $SourceDir "skills"
if (-not (Test-Path $srcSkills)) {
    Write-Host ""
    Write-Host "[错误] 没有在安装包中找到 skills 文件夹：" -ForegroundColor Red
    Write-Host "       $srcSkills" -ForegroundColor Red
    Write-Host "请先把压缩包完整解压，再到解压后的文件夹里双击运行安装，不要直接在压缩包内运行。" -ForegroundColor Red
    Write-Host ""
    exit 1
}

# 2. 定位豆包用户技能目录（未通过 -TargetDir 指定时自动探测）
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
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "  豆包角色资产技能包 - 离线安装" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "技能来源 : $srcSkills"
Write-Host "安装到   : $TargetDir"
Write-Host ""

# 3. 逐个安装
$ok = 0
foreach ($s in $Skills) {
    $src = Join-Path $srcSkills $s
    $dst = Join-Path $TargetDir $s
    if (-not (Test-Path (Join-Path $src "SKILL.md"))) {
        throw "安装包损坏：缺少 $s\SKILL.md，请重新获取完整压缩包。"
    }

    if (Test-Path $dst) {
        $bak = "{0}.bak.{1}" -f $dst, (Get-Date -Format "yyyyMMddHHmmss")
        Copy-Item $dst $bak -Recurse -Force
        Remove-Item $dst -Recurse -Force
        Write-Host "  [更新] $s" -ForegroundColor Yellow
        Write-Host "         旧版已备份：$bak" -ForegroundColor DarkGray
    } else {
        Write-Host "  [安装] $s" -ForegroundColor Green
    }

    Copy-Item $src $dst -Recurse
    if (-not (Test-Path (Join-Path $dst "SKILL.md"))) {
        throw "安装失败：$s 复制后未找到 SKILL.md。"
    }
    $ok++
}

Write-Host ""
Write-Host "===================================================" -ForegroundColor Green
Write-Host "  完成：成功安装 $ok 个技能" -ForegroundColor Green
Write-Host "  人脸 / 服装 / 人物资产 三个技能均可单独或协同使用" -ForegroundColor Green
Write-Host "  请完全退出并重新打开豆包（或新开会话）后生效" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Green
Write-Host ""

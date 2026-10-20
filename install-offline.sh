#!/usr/bin/env bash
# 豆包角色资产技能包 —— 离线安装脚本（macOS / Linux）
# 不联网，直接把本文件夹 skills/ 下的三个技能复制到豆包 .user_skills 目录。
# 已存在的同名技能会先备份为 .bak 再覆盖。
#
# 用法：
#   1) 先解压压缩包，进入解压后的文件夹
#   2) bash install-offline.sh
#   可选自定义目录：bash install-offline.sh "$HOME/my-skills"

set -euo pipefail

SKILLS="photoreal-face-plate photoreal-garment-plate character-asset-sheet"
SRC="$(cd "$(dirname "$0")" && pwd)/skills"

TARGET="${1:-}"
if [ -z "$TARGET" ]; then
  for c in \
    "$HOME/Library/Application Support/Doubao/User Data/Default/.doubao/agent_mode/workspace/.user_skills" \
    "$HOME/.doubao/agent_mode/workspace/.user_skills"; do
    if [ -d "$c" ]; then TARGET="$c"; break; fi
  done
  TARGET="${TARGET:-$HOME/.doubao/agent_mode/workspace/.user_skills}"
fi

if [ ! -d "$SRC" ]; then
  echo "[错误] 没有在安装包中找到 skills 文件夹：$SRC"
  echo "请先把压缩包完整解压，再在解压后的文件夹里运行本脚本。"
  exit 1
fi

mkdir -p "$TARGET"
echo "==================================================="
echo "  豆包角色资产技能包 - 离线安装"
echo "技能来源 : $SRC"
echo "安装到   : $TARGET"
echo "==================================================="

for s in $SKILLS; do
  if [ ! -f "$SRC/$s/SKILL.md" ]; then
    echo "[错误] 安装包损坏：缺少 $s/SKILL.md" >&2
    exit 1
  fi
  if [ -d "$TARGET/$s" ]; then
    rm -rf "$TARGET/$s.bak"
    cp -R "$TARGET/$s" "$TARGET/$s.bak"
    rm -rf "$TARGET/$s"
    echo "  [更新] $s（旧版已备份为 $s.bak）"
  else
    echo "  [安装] $s"
  fi
  cp -R "$SRC/$s" "$TARGET/$s"
done

echo "==================================================="
echo "  完成：成功安装 3 个技能"
echo "  请完全退出并重新打开豆包（或新开会话）后生效"
echo "==================================================="

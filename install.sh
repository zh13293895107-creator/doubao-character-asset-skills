#!/usr/bin/env bash
# Doubao Character Asset Skills - one-click installer (macOS / Linux)
#
# Quick install:
#   curl -fsSL https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.sh | bash
#
# Custom target directory:
#   curl -fsSL https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.sh | bash -s -- "$HOME/my-skills"

set -euo pipefail

REPO="zh13293895107-creator/doubao-character-asset-skills"
BRANCH="main"
SKILLS="photoreal-face-plate photoreal-garment-plate character-asset-sheet"

TARGET="${1:-}"
if [ -z "$TARGET" ]; then
  for c in \
    "$HOME/Library/Application Support/Doubao/User Data/Default/.doubao/agent_mode/workspace/.user_skills" \
    "$HOME/.doubao/agent_mode/workspace/.user_skills"; do
    if [ -d "$c" ]; then TARGET="$c"; break; fi
  done
  TARGET="${TARGET:-$HOME/.doubao/agent_mode/workspace/.user_skills}"
fi

echo "==> Doubao Character Asset Skills installer"
echo "Target skills directory: $TARGET"
mkdir -p "$TARGET"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Downloading..."
curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar -xz -C "$TMP"

ROOT="$(find "$TMP" -maxdepth 2 -type d -name skills | head -n 1 | xargs dirname)"
if [ -z "$ROOT" ]; then
  echo "Downloaded package does not contain a skills/ folder." >&2
  exit 1
fi

for s in $SKILLS; do
  if [ ! -f "$ROOT/skills/$s/SKILL.md" ]; then
    echo "Package corrupt: $s/SKILL.md missing." >&2
    exit 1
  fi
  if [ -d "$TARGET/$s" ]; then
    rm -rf "$TARGET/$s.bak"
    cp -R "$TARGET/$s" "$TARGET/$s.bak"
    rm -rf "$TARGET/$s"
    echo "  [updated] $s  (backup: $s.bak)"
  else
    echo "  [installed] $s"
  fi
  cp -R "$ROOT/skills/$s" "$TARGET/$s"
done

echo "==> Done. Restart or reload the Doubao session to load the skills."

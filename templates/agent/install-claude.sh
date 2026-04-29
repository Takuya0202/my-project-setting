#!/bin/sh
#
# Claude Code向け汎用ルールのインストールスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | sh
#
# 概要:
#   プロジェクトの .claude/rules/ に汎用ルールファイル（.md）を配置する。
#   既に同名ファイルが存在する場合はスキップする。
#

set -eu

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent"
RULES_DIR=".claude/rules"

mkdir -p "$RULES_DIR"

installed=0
skipped=0

for file in coding.md git.md security.md commands.md; do
  dest="$RULES_DIR/$file"

  if [ -f "$dest" ]; then
    echo "[skip] $dest (already exists)"
    skipped=$((skipped + 1))
  else
    curl -fsSL "$BASE_URL/.claude/rules/$file" -o "$dest"
    echo "[created] $dest"
    installed=$((installed + 1))
  fi
done

echo ""
echo "Done: $installed installed, $skipped skipped"

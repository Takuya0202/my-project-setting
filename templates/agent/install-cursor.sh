#!/bin/sh
#
# Cursor向け汎用ルールのインストールスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.sh | sh
#
# 概要:
#   プロジェクトの .cursor/rules/ に汎用ルールファイル（.mdc）を配置する。
#   既に同名ファイルが存在する場合はスキップする。
#

set -eu

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent"
RULES_DIR=".cursor/rules"

mkdir -p "$RULES_DIR"

installed=0
skipped=0

for file in coding.mdc git.mdc security.mdc; do
  dest="$RULES_DIR/$file"

  if [ -f "$dest" ]; then
    echo "[skip] $dest (already exists)"
    skipped=$((skipped + 1))
  else
    curl -fsSL "$BASE_URL/.cursor/rules/$file" -o "$dest"
    echo "[created] $dest"
    installed=$((installed + 1))
  fi
done

echo ""
echo "Done: $installed installed, $skipped skipped"

#!/bin/sh
#
# Claude Code向け汎用ルール・スキルのインストールスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | sh
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | sh -s -- --force
#
# 概要:
#   プロジェクトの .claude/rules/ に汎用ルールファイル（.md）を配置する。
#   プロジェクトの .claude/skills/ に汎用スキルファイル（SKILL.md）を配置する。
#   既に同名ファイルが存在する場合はスキップする（--force で上書き）。
#

set -eu

FORCE=0
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=1 ;;
  esac
done

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent"
RULES_DIR=".claude/rules"

mkdir -p "$RULES_DIR"

installed=0
skipped=0

install_file() {
  src="$1"
  dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -f "$dest" ] && [ "$FORCE" -eq 0 ]; then
    echo "[skip] $dest (already exists)"
    skipped=$((skipped + 1))
  else
    curl -fsSL "$src" -o "$dest"
    echo "[created] $dest"
    installed=$((installed + 1))
  fi
}

for file in coding.md git.md security.md commands.md; do
  install_file "$BASE_URL/.claude/rules/$file" "$RULES_DIR/$file"
done

for skill in commit pr; do
  install_file "$BASE_URL/.claude/skills/$skill/SKILL.md" ".claude/skills/$skill/SKILL.md"
done

echo ""
echo "Done: $installed installed, $skipped skipped"

#!/bin/sh
#
# React テンプレートの全ファイルをインストールするスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install.sh | sh
#
# 概要:
#   eslint.config.js / .prettierrc / .vscode/settings.json を配置する。
#   Claude Code / Cursor / Codex 向けスキルをすべて配置する。
#   既に同名ファイルが存在する場合はスキップする。
#

set -eu

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react"

installed=0
skipped=0

install_file() {
  src="$1"
  dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -f "$dest" ]; then
    echo "[skip] $dest (already exists)"
    skipped=$((skipped + 1))
  else
    curl -fsSL "$BASE_URL/$src" -o "$dest"
    echo "[created] $dest"
    installed=$((installed + 1))
  fi
}

install_file "eslint.config.js" "eslint.config.js"
install_file ".prettierrc" ".prettierrc"
install_file ".vscode/settings.json" ".vscode/settings.json"
install_file ".claude/skills/react/SKILL.md" ".claude/skills/react/SKILL.md"
install_file ".cursor/skills/react/SKILL.md" ".cursor/skills/react/SKILL.md"
install_file "codex/AGENTS.md" "codex/AGENTS.md"

echo ""
echo "Done: $installed installed, $skipped skipped"

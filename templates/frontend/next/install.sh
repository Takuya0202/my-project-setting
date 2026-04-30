#!/bin/sh
#
# Next.js テンプレートの全ファイルをインストールするスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/next/install.sh | sh
#
# 注意:
#   create-next-app で生成された eslint.config.mjs と競合するため、事前に削除すること。
#

set -eu

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/next"

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
install_file ".claude/skills/next/SKILL.md" ".claude/skills/next/SKILL.md"
install_file ".cursor/skills/next/SKILL.md" ".cursor/skills/next/SKILL.md"
install_file "codex/AGENTS.md" "codex/AGENTS.md"

echo ""
echo "Done: $installed installed, $skipped skipped"

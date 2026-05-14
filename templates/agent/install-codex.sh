#!/bin/sh
#
# Codex向け汎用ルール・スキルのインストールスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | sh
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | sh -s -- --force
#
# 概要:
#   プロジェクトルートに AGENTS.md を、.agents/skills/ 以下にスキルを配置する。
#   既にファイルが存在する場合はスキップする（--force で上書き）。
#

set -eu

FORCE=0
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=1 ;;
  esac
done

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent"

INSTALLED=0
SKIPPED=0

install_file() {
  src="$1"
  dest="$2"
  if [ -f "$dest" ] && [ "$FORCE" -eq 0 ]; then
    echo "[skip] $dest (already exists)"
    SKIPPED=$((SKIPPED + 1))
  else
    mkdir -p "$(dirname "$dest")"
    curl -fsSL "$BASE_URL/$src" -o "$dest"
    echo "[created] $dest"
    INSTALLED=$((INSTALLED + 1))
  fi
}

install_file "codex/AGENTS.md"                        "AGENTS.md"
install_file ".agents/skills/commit/SKILL.md"         ".agents/skills/commit/SKILL.md"
install_file ".agents/skills/pr/SKILL.md"             ".agents/skills/pr/SKILL.md"

echo ""
echo "Done: $INSTALLED installed, $SKIPPED skipped"

#!/bin/sh
#
# Codex向け汎用ルールのインストールスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | sh
#
# 概要:
#   プロジェクトルートに AGENTS.md を配置する。
#   既にファイルが存在する場合はスキップする。
#

set -eu

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/codex"
DEST="AGENTS.md"

if [ -f "$DEST" ]; then
  echo "[skip] $DEST (already exists)"
  echo ""
  echo "Done: 0 installed, 1 skipped"
else
  curl -fsSL "$BASE_URL/$DEST" -o "$DEST"
  echo "[created] $DEST"
  echo ""
  echo "Done: 1 installed, 0 skipped"
fi

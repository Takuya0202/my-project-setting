#!/bin/sh
#
# Docker Compose テンプレートの全ファイルをインストールするスクリプト
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/makefile/docker-compose/install.sh | sh
#
# 概要:
#   Makefile をプロジェクトルートに配置する。
#   既に同名ファイルが存在する場合はスキップする。
#

set -eu

BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/makefile/docker-compose"

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

install_file "Makefile" "Makefile"

echo ""
echo "Done: $installed installed, $skipped skipped"

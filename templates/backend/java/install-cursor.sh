#!/bin/sh
set -eu
BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java"
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

install_file ".vscode/settings.json" ".vscode/settings.json"
install_file ".vscode/extensions.json" ".vscode/extensions.json"
install_file ".cursor/skills/java/SKILL.md" ".cursor/skills/java/SKILL.md"

echo ""
echo "Done: $installed installed, $skipped skipped"

#!/bin/sh
set -eu
BASE_URL="https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/makefile/spring"
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

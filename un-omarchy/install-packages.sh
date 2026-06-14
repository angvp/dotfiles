#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OFFICIAL="$SCRIPT_DIR/packages-official.txt"
AUR="$SCRIPT_DIR/packages-aur.txt"

if ! command -v yay &>/dev/null; then
    echo "ERROR: yay no está instalado. Instálalo primero." >&2
    exit 1
fi

echo "==> Instalando paquetes oficiales ($(wc -l < "$OFFICIAL") paquetes)..."
yay -S --needed --noconfirm - < "$OFFICIAL"

echo "==> Instalando paquetes AUR ($(wc -l < "$AUR") paquetes)..."
yay -S --needed --noconfirm - < "$AUR"

echo "==> Listo."

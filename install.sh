#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"
OMARCHY_CONFIG="$DOTFILES/un-omarchy/config"
OS="$(uname -s)"

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    ln -sfn "$src" "$dst"
    echo "  $dst -> $src"
}

echo "==> Symlinks en home..."
link "$DOTFILES/.zshrc"           "$HOME/.zshrc"
link "$DOTFILES/.zpreztorc"       "$HOME/.zpreztorc"
link "$DOTFILES/.tmux.conf"       "$HOME/.tmux.conf"
link "$DOTFILES/.tmux.conf.local" "$HOME/.tmux.conf.local"
link "$DOTFILES/.vimrc"           "$HOME/.vimrc"

echo ""
echo "==> Symlinks en ~/.config/ (comunes)..."
link "$DOTFILES/nvim"           "$HOME/.config/nvim"
link "$DOTFILES/bat"            "$HOME/.config/bat"
mkdir -p "$HOME/.config/alacritty"
link "$DOTFILES/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

for dir in fastfetch lazygit btop; do
    link "$OMARCHY_CONFIG/$dir" "$HOME/.config/$dir"
done
link "$OMARCHY_CONFIG/starship.toml" "$HOME/.config/starship.toml"

if [[ "$OS" == "Linux" ]]; then
    echo ""
    echo "==> Symlinks en ~/.config/ (Linux)..."
    for dir in hypr waybar walker mako swayosd ghostty; do
        link "$OMARCHY_CONFIG/$dir" "$HOME/.config/$dir"
    done

    echo ""
    echo "==> Symlinks en ~/.local/bin/..."
    mkdir -p "$HOME/.local/bin"
    for script in "$DOTFILES/bin/"*; do
        link "$script" "$HOME/.local/bin/$(basename "$script")"
    done

elif [[ "$OS" == "Darwin" ]]; then
    echo ""
    echo "==> Symlinks en ~/.config/ (macOS)..."
    link "$DOTFILES/ghostty" "$HOME/.config/ghostty"
fi

echo ""
echo "==> Listo."

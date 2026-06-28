angvp's configuration files
============================

## Quick Setup

Clone the repo and run the install script:

```bash
git clone https://github.com/angvp/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` creates symlinks under `~/.config/` and `~/`, detecting the OS automatically:
- **Linux & macOS**: shell (zsh/prezto, tmux, vim), neovim, bat, alacritty, fastfetch, lazygit, btop, starship
- **Linux only**: hypr, waybar, walker, mako, swayosd, ghostty (Hyprland stack), scripts under `~/.local/bin/`
- **macOS only**: ghostty (standalone config)

### Install packages (Arch Linux)

```bash
./un-omarchy/install-packages.sh
```

Requires `yay`. Installs packages from `packages-official.txt` and `packages-aur.txt`.

---

## Available configs

**Terminal & Shell:**
- `.zshrc` (requires [prezto](https://github.com/sorin-ionescu/prezto/))
- `.zpreztorc`
- `.bashrc`
- `.banner`

**Window Managers & Desktop:**
- `un-omarchy/config/hypr/` - [Hyprland](https://hyprland.org/) window manager configuration (Linux)
- `un-omarchy/config/waybar/` - Status bar configuration
- `un-omarchy/config/walker/` - Application launcher configuration
- `un-omarchy/config/mako/` - Notification daemon configuration
- `un-omarchy/config/swayosd/` - On-screen display for volume/brightness
- `awesome/` (4.1 and 3.5) - Complete [AwesomeWM](https://github.com/awesomeWM/awesome) configuration
  - `awesome/rc.lua` - Main configuration
  - `awesome/color.lua` - Color definitions
  - `awesome/wi.lua` - Widgets
  - `awesome/themes/dust/` - Custom theme
  - `awesome/scratch/` - Scratchpad functionality
- `awesome4-custom/` - Custom awesome 4.x configuration
- `.xinitrc` - X11 initialization
- `.xinitrc.office` - Deprecated xinitrc of some work place specific X11 setup

**Terminal Emulators:**
- `ghostty/config` - [Ghostty](https://github.com/ghostty-org/ghostty) terminal configuration (macOS)
- `un-omarchy/config/ghostty/` - Ghostty terminal configuration (Linux/Hyprland)
- `kitty.conf` - [Kitty](https://github.com/kovidgoyal/kitty) terminal configuration
- `iterm2/` - [iTerm2](https://github.com/gnachman/iTerm2) configuration and profiles
- `alacritty.toml` - [Alacritty](https://github.com/alacritty/alacritty) configuration (TOML format)

**Editors:**
- `nvim/` - [Neovim](https://github.com/neovim/neovim) configuration ([LazyVim](https://github.com/LazyVim/LazyVim)-based)
  - `nvim/init.lua` - Main initialization
  - `nvim/lua/config/` - Core configuration files
  - `nvim/lua/plugins/` - Plugin configurations
  - `nvim/lazy-lock.json` - Plugin lock file
  - `nvim/lazyvim.json` - LazyVim configuration
- `.vimrc` - [Vim](https://github.com/vim/vim) configuration (requires [vim-plug](https://github.com/junegunn/vim-plug/))

**System Utilities:**
- `bat/config` - [Bat](https://github.com/sharkdp/bat) (cat alternative) configuration
- `.tmux.conf` - [Tmux](https://github.com/tmux/tmux) configuration (2.5)
- `.tmux.conf.local` - Local tmux overrides
- `un-omarchy/config/btop/` - [btop](https://github.com/aristocratos/btop) resource monitor configuration
- `un-omarchy/config/lazygit/` - [lazygit](https://github.com/jesseduffield/lazygit) terminal UI for git
- `un-omarchy/config/fastfetch/` - [fastfetch](https://github.com/fastfetch-cli/fastfetch) system info configuration
- `un-omarchy/config/starship.toml` - [Starship](https://starship.rs/) prompt configuration
- `.conkyrc` - [Conky](https://github.com/brndnmtthws/conky) desktop widget configuration
- `.conkyrc.desktop` - Desktop-specific conky config
- `conky-scripts/` - Custom conky Lua scripts
- `.makepkg.conf` - [Arch Linux](https://github.com/archlinux) package building configuration
- `.dircolors` - Directory colors configuration
- `Brewfile` - [Homebrew](https://github.com/Homebrew/brew) package list

**Scripts (`bin/`):**
- System scripts for Hyprland, audio, brightness, screenshots, weather, and more (Linux only)

**Display & Colors:**
- `.Xresources` - X11 resource definitions
- `.Xdefaults` - X11 default settings
- `.xcolours/` - Color scheme collection
  - `angvp`, `solarized`, `flaper87`, `marzo`, `orangish`, `popkill`, `sad`, `victorianish-blue`
  - `base16-solarized-dark-256.Xresources`
- `.xscreensaver` - Screen saver configuration

**Screen Layouts:**
- `.screenlayout/` - Multi-monitor setup scripts
  - `current-desktop.sh`, `temp-setup.sh`, `threemonitors.sh`
  - `topactive.sh`, `topmonitor.sh`, `twomonitors.sh`

**Environment & Scripts:**
- `env/` - Environment-specific configurations
  - `env/osx.sh` - macOS environment setup
  - `env/archlinux.zsh` - Arch Linux environment setup
  - `env/colors.sh` - Color definitions

**VIM Templates (deprecated):**
- `vimtpl/` - Vim template files
  - `vimtpl/template.test.js` - JavaScript test template

**Other Configs:**
- `.mailmap` - Git mail mapping
- `.gitignore` - Git ignore patterns
- `.gitmodules` - Git submodules configuration

---

## Deprecated config files (can be useful for some hints)

**Window Managers:**
- `subtle.rb.desktop` - [Subtle](https://github.com/subtle-h/subtle) window manager (desktop)
- `subtle.rb.laptop` - [Subtle](https://github.com/subtle-h/subtle) window manager (laptop)

**Shell & Terminal:**
- `.bashrc` (still present but deprecated) - [Bash](https://github.com/bminor/bash)
- `.screenrc` - [GNU Screen](https://github.com/GNU-Screen/screen) configuration
- `oh-my-zsh/themes/angvp.zsh-theme` - Custom [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) theme

**Media Players:**
- `.ncmpcpp/config` - [Ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) music player configuration

**Legacy Files:**
- `a.cfg` - Quake3 Arena Configuration File (yes this is probably my oldest file here)
- `awesome-copycats/` - [AwesomeWM copycat themes](https://github.com/lcpz/awesome-copycats) (empty directory)

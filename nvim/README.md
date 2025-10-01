# Neovim Configuration

A modern Neovim configuration based on LazyVim with custom plugins and keybindings.

## Installation

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone <your-repo> ~/.config/nvim
   cd ~/.config/nvim
   ```

2. Start Neovim and let Lazy.nvim install all plugins automatically.

## Keybindings

### Leader Key
- Leader key: `<Space>`
- Local leader key: `<Space>`

### Buffer Management
| Key | Action | Description |
|-----|--------|-------------|
| `<C-o>` | `:bp!` | Previous buffer |
| `<C-p>` | `:bn!` | Next buffer |
| `<C-k>` | `:bd!` | Delete current buffer |
| `<C-e>` | `ggVG` | Select all text |

### File Navigation (Telescope)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader><C-P>` | Find Files | Search files in project |
| `<leader>a` | Buffers | List open buffers |
| `<leader>;` | Buffer Lines | Search within current buffer |
| `<leader>.` | Live Grep | Search text across files |
| `<leader>o` | Buffer Tags | Tags in current buffer |
| `<leader>O` | CTags | All tags in project |
| `<leader>?` | History | Recently opened files |
| `<leader>gl` | Git Commits | Git commit history |
| `<leader>ga` | Git Buffer Commits | Git commits for current buffer |

### File Explorer (Oil.nvim)
| Key | Action | Description |
|-----|--------|-------------|
| `-` | Open Oil | Open parent directory |
| `<CR>` | Select | Open file/directory |
| `<C-s>` | Select vsplit | Open in vertical split |
| `<C-h>` | Select split | Open in horizontal split |
| `<C-t>` | Select tab | Open in new tab |
| `<C-p>` | Preview | Preview file |
| `<C-c>` | Close | Close file explorer |
| `<C-l>` | Refresh | Refresh directory |
| `-` | Parent | Go to parent directory |
| `_` | Open CWD | Open current working directory |
| `` ` `` | CD | Change directory |
| `~` | TCD | Change to home directory |
| `gs` | Change sort | Change sorting method |
| `gx` | Open external | Open with external app |
| `g.` | Toggle hidden | Show/hide hidden files |
| `g\` | Toggle trash | Show/hide trash files |
| `g?` | Show help | Show help |

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `-` | Window Picker | Choose window to focus |

### Code Actions
| Key | Action | Description |
|-----|--------|-------------|
| `gJ` | Split/Join | Toggle code splitting/joining |

### Symbols & Outline
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>tt` | Symbols Outline | Show symbols outline |

### ChatGPT Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cc` | ChatGPT Chat | Open ChatGPT chat |
| `<leader>ce` | ChatGPT Edit | Edit with instruction |
| `<leader>cx` | Explain Code | Explain selected code |
| `<leader>cf` | Fix Code | Fix selected code |
| `<leader>co` | Optimize Code | Optimize selected code |
| `<leader>cd` | Add Docstring | Add docstring to code |
| `<leader>ct` | Generate Tests | Generate tests for code |

### Configuration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader><C-R>` | Reload Config | Reload init.lua |

## Commands

### Git (vim-fugitive)
- `:G` - Git status
- `:Git` - Git command
- `:Gdiffsplit` - Git diff in split
- `:Gblame` - Git blame

### Python Environment
- `:VenvSelect` - Select Python virtual environment

### Symbols
- `:SymbolsOutline` - Show symbols outline

## Plugins Included

### Core Plugins
- **LazyVim** - Modern Neovim configuration framework
- **Lazy.nvim** - Plugin manager
- **Telescope** - Fuzzy finder
- **Treesitter** - Syntax highlighting
- **LSP** - Language Server Protocol support
- **Mason** - LSP/DAP/Linter/Formatter installer

### UI & Experience
- **Catppuccin** - Color scheme (macchiato flavor)
- **Lualine** - Status line
- **Mini.animate** - Smooth animations
- **Oil.nvim** - Modern file explorer
- **Window Picker** - Window selection
- **Symbols Outline** - Code symbols navigation

### Development Tools
- **ChatGPT.nvim** - AI code assistance
- **Treesj** - Code splitting/joining
- **Conform** - Code formatting
- **nvim-lint** - Code linting
- **GitSigns** - Git integration
- **vim-fugitive** - Git wrapper

### Language Support
- **TypeScript** - TypeScript/JavaScript support
- **JSON** - JSON language support
- **Python** - Python development
- **venv-selector** - Python virtual environment selection

## Configuration Features

### Editor Settings
- UTF-8 encoding
- System clipboard integration
- Mouse support
- Line numbers
- Cursor line highlighting
- Smart indentation (2 spaces)
- No backup/swap files
- Hidden buffers
- Split below/right by default

### Performance
- Lazy loading for all plugins
- Disabled unnecessary plugins (gzip, tarPlugin, tohtml, tutor, zipPlugin)
- Optimized startup time

## Language Support

The configuration includes support for:
- Python
- JavaScript/TypeScript
- JSON
- Lua
- Vim
- YAML
- HTML/CSS
- Markdown
- Bash
- Dockerfile

## Customization

To customize this configuration:

1. **Add new plugins**: Edit `lua/plugins/` files
2. **Modify keybindings**: Edit `lua/config/keymaps.lua`
3. **Change options**: Edit `lua/config/options.lua`
4. **Update colorscheme**: Edit `lua/plugins/ui.lua`

## Requirements

- Neovim 0.9.0 or higher
- Git
- Node.js (for some language servers)
- Python (for Python development)

## Troubleshooting

If you encounter issues:

1. **Reload configuration**: `<leader><C-R>`
2. **Check plugin status**: `:Lazy`
3. **Update plugins**: `:Lazy update`
4. **Check health**: `:checkhealth`

## Credits

This configuration is based on [LazyVim](https://github.com/LazyVim/LazyVim) with custom additions and modifications.

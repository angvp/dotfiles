# Neovim Keymaps & Shortcuts Reference

This document contains all the custom keymaps and shortcuts configured in your Neovim setup.

## Leader Key
- **Leader**: `<Space>` (configured in `lua/config/options.lua`)

## Buffer Management
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<C-o>` | Normal | `:bp!<CR>` | Go to previous buffer |
| `<C-p>` | Normal | `:bn!<CR>` | Go to next buffer |
| `<C-k>` | Normal | `:bd!<CR>` | Delete/close current buffer |
| `<C-e>` | Normal | `ggVG` | Select all text in buffer |

## Telescope (Fuzzy Finder)
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader><C-P>` | Normal | `find_files` | Find Files |
| `<leader>a` | Normal | `buffers` | Show open buffers |
| `<leader>;` | Normal | `current_buffer_fuzzy_find` | Search lines in current buffer |
| `<leader>.` | Normal | `live_grep` | Live grep search |
| `<leader>o` | Normal | `current_buffer_tags` | Show buffer tags |
| `<leader>O` | Normal | `tags` | Show CTags |
| `<leader>?` | Normal | `oldfiles` | Show file history |

## Git Integration
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader>gl` | Normal | `git_commits` | Show Git commits |
| `<leader>ga` | Normal | `git_bcommits` | Show Git commits for current buffer |

## Configuration Management
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader><C-R>` | Normal | `:source $MYVIMRC<CR>` | Reload init.lua configuration |

## AI/ChatGPT Integration
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader>cc` | Normal | `:ChatGPT<CR>` | Open ChatGPT Chat |
| `<leader>ce` | Normal | `:ChatGPTEditWithInstruction<CR>` | ChatGPT Edit with instruction |
| `<leader>cx` | Normal | `:ChatGPTRun explain_code<CR>` | ChatGPT Explain code |
| `<leader>cf` | Normal | `:ChatGPTRun fix<CR>` | ChatGPT Fix code |
| `<leader>co` | Normal | `:ChatGPTRun optimize<CR>` | ChatGPT Optimize code |
| `<leader>cd` | Normal | `:ChatGPTRun docstring<CR>` | ChatGPT Generate docstring |
| `<leader>ct` | Normal | `:ChatGPTRun tests<CR>` | ChatGPT Generate tests |

## Window Management
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `-` | Normal | Window picker | Pick/switch to a window (nvim-window-picker) |

## Plugin-Specific Keymaps

### Symbols Outline
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader>tt` | Normal | `:SymbolsOutline<CR>` | Toggle symbols outline |

### Oil.nvim (File Explorer)
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `-` | Normal | `:Oil<CR>` | Open parent directory |

#### Oil.nvim Internal Keymaps (within Oil buffer)
| Keymap | Action | Description |
|--------|--------|-------------|
| `g?` | `show_help` | Show help |
| `<CR>` | `select` | Select item |
| `<C-s>` | `select_vsplit` | Select in vertical split |
| `<C-h>` | `select_split` | Select in horizontal split |
| `<C-t>` | `select_tab` | Select in new tab |
| `<C-p>` | `preview` | Preview file |
| `<C-c>` | `close` | Close Oil |
| `<C-l>` | `refresh` | Refresh view |
| `-` | `parent` | Go to parent directory |
| `_` | `open_cwd` | Open current working directory |
| `` ` `` | `cd` | Change directory |
| `~` | `tcd` | Tab-local change directory |
| `gs` | `change_sort` | Change sort order |
| `gx` | `open_external` | Open externally |
| `g.` | `toggle_hidden` | Toggle hidden files |
| `g\` | `toggle_trash` | Toggle trash view |

### TreeSJ (Split/Join)
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `gJ` | Normal | `treesj.toggle()` | Split/Join code structures |

## LazyVim Default Keymaps
Your configuration uses LazyVim, which includes many default keymaps. Some of the most commonly used ones include:

### General LazyVim Keymaps (inherited)
- `<leader>l` - LazyVim related commands
- `<leader>x` - Trouble/Diagnostics
- `<leader>s` - Search related
- `<leader>u` - UI toggles
- `<leader>w` - Window commands
- `<leader>b` - Buffer commands
- `<leader>f` - File commands
- `<leader>g` - Git commands
- `<leader>c` - Code actions
- `<leader>r` - Refactor commands

## Plugin Commands (Available via command palette)
- `:VenvSelect` - Select Python virtual environment
- `:G`, `:Git`, `:Gdiffsplit`, `:Gblame` - Git commands via vim-fugitive
- `:SymbolsOutline` - Toggle symbols outline
- `:Oil` - Open file explorer

## Configuration Structure
```
nvim/
├── init.lua                    # Main initialization
├── lua/
│   ├── config/
│   │   ├── keymaps.lua        # Custom keymaps (main file)
│   │   ├── options.lua        # Vim options & leader key
│   │   └── lazy.lua           # Plugin manager setup
│   └── plugins/
│       ├── core.lua           # Core plugins & their keymaps
│       ├── ui.lua             # UI-related plugins
│       ├── lang.lua           # Language-specific plugins
│       └── chat.lua           # AI chat plugins
└── README.md                  # This file
```

## Notes
- All keymaps are configured with `{ noremap = true, silent = true }` by default
- Telescope commands are lazy-loaded for better performance
- ChatGPT functionality requires `OPENAI_API_KEY` environment variable
- The configuration uses Catppuccin Macchiato color scheme
- LazyVim provides additional keymaps that are loaded automatically

---
*This keymaps reference was automatically generated from your Neovim configuration files.*
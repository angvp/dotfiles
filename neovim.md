# Neovim Keybindings

Reference of all custom keybindings in this dotfiles Neovim setup (LazyVim + lazy.nvim).
Config lives in [`nvim/`](./nvim) (symlinked to `~/.config/nvim`).

- **Leader key:** `<Space>` (set in `nvim/lua/config/options.lua`)
- **Defaults:** `{ noremap = true, silent = true }` unless noted
- **Colorscheme:** Catppuccin Macchiato

---

## Buffers
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<C-o>` | Normal | `:bp!` | Previous buffer |
| `<C-p>` | Normal | `:bn!` | Next buffer |
| `<C-k>` | Normal | `:bd!` | Delete current buffer |
| `<C-e>` | Normal | `ggVG` | Select whole buffer |

## Telescope (fuzzy finder)
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader><C-P>` | Normal | `find_files` | Find files |
| `<leader>fb` | Normal | `buffers` | Open buffers |
| `<leader>;` | Normal | `current_buffer_fuzzy_find` | Fuzzy find in buffer |
| `<leader>.` | Normal | `live_grep` | Live grep |
| `<leader>o` | Normal | `current_buffer_tags` | Buffer tags |
| `<leader>O` | Normal | `tags` | CTags |
| `<leader>?` | Normal | `oldfiles` | Recent files |
| `<leader>gl` | Normal | `git_commits` | Git commits |
| `<leader>ga` | Normal | `git_bcommits` | Git commits (buffer) |

## Config
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader><C-R>` | Normal | `:source $MYVIMRC` | Reload init.lua |

## Claude Code (`coder/claudecode.nvim`)
Prefix `<leader>a` → "AI/Claude Code".
| Keymap | Mode | Command | Description |
|--------|------|---------|-------------|
| `<leader>ac` | Normal | `ClaudeCode` | Toggle Claude |
| `<leader>af` | Normal | `ClaudeCodeFocus` | Focus Claude |
| `<leader>ar` | Normal | `ClaudeCode --resume` | Resume Claude |
| `<leader>aC` | Normal | `ClaudeCode --continue` | Continue Claude |
| `<leader>am` | Normal | `ClaudeCodeSelectModel` | Select model |
| `<leader>ab` | Normal | `ClaudeCodeAdd %` | Add current buffer |
| `<leader>as` | Visual | `ClaudeCodeSend` | Send selection to Claude |
| `<leader>as` | Tree fts | `ClaudeCodeTreeAdd` | Add file (NvimTree/neo-tree/oil/…) |
| `<leader>aa` | Normal | `ClaudeCodeDiffAccept` | Accept diff |
| `<leader>ad` | Normal | `ClaudeCodeDiffDeny` | Deny diff |

> ℹ️ The `<leader>a` prefix is dedicated to Claude Code. Telescope `buffers` was
> moved to `<leader>fb` to avoid a prefix clash.

## AI / ChatGPT (`jackMort/ChatGPT.nvim`)
Requires `OPENAI_API_KEY`.
| Keymap | Mode | Command | Description |
|--------|------|---------|-------------|
| `<leader>cc` | Normal | `:ChatGPT` | Open chat |
| `<leader>ce` | Normal | `:ChatGPTEditWithInstruction` | Edit with instruction |
| `<leader>cx` | Normal | `:ChatGPTRun explain_code` | Explain code |
| `<leader>cf` | Normal | `:ChatGPTRun fix` | Fix code |
| `<leader>co` | Normal | `:ChatGPTRun optimize` | Optimize code |
| `<leader>cd` | Normal | `:ChatGPTRun docstring` | Generate docstring |
| `<leader>ct` | Normal | `:ChatGPTRun tests` | Generate tests |

## Window management
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader>wp` | Normal | window-picker | Pick/switch window |

## Symbols Outline (`simrat39/symbols-outline.nvim`)
| Keymap | Mode | Command | Description |
|--------|------|---------|-------------|
| `<leader>tt` | Normal | `:SymbolsOutline` | Toggle symbols outline |

## TreeSJ (`Wansmer/treesj`)
| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `gJ` | Normal | `treesj.toggle()` | Split/join code structures |

## Oil.nvim (file explorer)
| Keymap | Mode | Command | Description |
|--------|------|---------|-------------|
| `-` | Normal | `:Oil` | Open parent directory |

### Oil internal keymaps (inside the Oil buffer)
| Keymap | Action |
|--------|--------|
| `g?` | Show help |
| `<CR>` | Select |
| `<C-s>` | Select in vertical split |
| `<C-h>` | Select in horizontal split |
| `<C-t>` | Select in new tab |
| `<C-p>` | Preview |
| `<C-c>` | Close |
| `<C-l>` | Refresh |
| `-` | Parent directory |
| `_` | Open cwd |
| `` ` `` | cd |
| `~` | Tab-local cd |
| `gs` | Change sort |
| `gx` | Open externally |
| `g.` | Toggle hidden files |
| `g\` | Toggle trash |

---

## Plugin commands (command palette)
- `:VenvSelect` — select Python virtualenv (`venv-selector.nvim`)
- `:G`, `:Git`, `:Gdiffsplit`, `:Gblame` — git via vim-fugitive
- `:SymbolsOutline` — toggle symbols outline
- `:Oil` — file explorer
- `:ClaudeCode`, `:ClaudeCodeFocus`, `:ClaudeCodeSelectModel`, `:ClaudeCodeAdd`,
  `:ClaudeCodeSend`, `:ClaudeCodeStatus`, `:ClaudeCodeStart`, `:ClaudeCodeStop`,
  `:ClaudeCodeDiffAccept`, `:ClaudeCodeDiffDeny`, `:ClaudeCodeCloseAllDiffs`
- `:ChatGPT*` — ChatGPT.nvim commands

## LazyVim defaults (inherited)
LazyVim ships many default keymaps under these prefixes:
`<leader>f` files · `<leader>s` search · `<leader>g` git · `<leader>x` diagnostics ·
`<leader>u` UI toggles · `<leader>w` windows · `<leader>b` buffers · `<leader>c` code ·
`<leader>l` Lazy · `<leader>q` quit/session.
Run `:Telescope keymaps` or press `<leader>` and wait for which-key to see all of them.

---
*Generated from the Neovim config in this dotfiles repo.*

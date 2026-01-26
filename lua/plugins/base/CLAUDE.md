# Plugins - Base

## Overview

Core functionality plugins that provide essential features for navigation, syntax highlighting, file exploration, and visual theming.

## Plugins

### catppuccin

- **Repository**: catppuccin/nvim
- **Purpose**: Soothing pastel color scheme with extensive plugin integrations
- **Priority**: 1000 (loads first)

#### Configuration

Enabled integrations:
- cmp, fidget, gitsigns, indent_blankline, lsp_trouble
- mason, neotest, neotree, snacks, telescope
- treesitter, treesitter_context, which_key

#### Docs

- https://github.com/catppuccin/nvim

---

### neo-tree

- **Repository**: nvim-neo-tree/neo-tree.nvim
- **Purpose**: File explorer with git status and document symbols
- **Branch**: v3.x
- **Dependencies**: plenary.nvim, nvim-web-devicons, nui.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-n>` | n | Toggle Neo-tree file explorer |

#### Configuration

- Sources: filesystem, buffers, git_status, document_symbols
- Shows dotfiles (except `.git`)
- Always shows `.env` files
- Follow current file enabled
- File watcher enabled (libuv)

#### Docs

- https://github.com/nvim-neo-tree/neo-tree.nvim

---

### telescope

- **Repository**: nvim-telescope/telescope.nvim
- **Purpose**: Fuzzy finder for files, buffers, LSP symbols, and more
- **Branch**: 0.1.x
- **Dependencies**: plenary.nvim, telescope-fzf-native.nvim, telescope-ui-select.nvim, nvim-web-devicons, yaml.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>?` | n | Find recently opened files |
| `<leader><space>` | n | Find existing buffers |
| `<leader>/` | n | Fuzzy search in current buffer |
| `<leader>s/` | n | Search in open files |
| `<leader>ss` | n | Select Telescope picker |
| `<leader>sG` | n | Search git files |
| `<leader>sf` | n | Search files |
| `<leader>sh` | n | Search help tags |
| `<leader>sw` | n | Search current word |
| `<leader>sg` | n | Live grep |
| `<leader>sd` | n | Search diagnostics |
| `<leader>sr` | n | Resume last search |
| `<leader>se` | n | Search Neovim config |
| `<leader>sp` | n | Search installed packages |
| `<leader>sa` | n | Search all files (hidden + ignored) |
| `<leader>sb` | n | Search buffers |
| `<leader>so` | n | Search old files |
| `<leader>sC` | n | Search colorschemes |
| `<leader>sc` | n | Search git commits |
| `<leader>sy` | n | Search in YAML files |

#### Configuration

- Smart path display
- FZF native extension for better performance
- UI-select extension for code actions

#### Docs

- https://github.com/nvim-telescope/telescope.nvim

---

### treesitter

- **Repository**: nvim-treesitter/nvim-treesitter
- **Branch**: main
- **Purpose**: Syntax highlighting, code navigation, and text objects
- **Dependencies**: nvim-treesitter-textobjects, nvim-treesitter-context

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-space>` | n | Init/increment selection |
| `<C-s>` | n | Scope incremental selection |
| `<M-space>` | n | Decrement selection |
| `aa` / `ia` | o,x | Select around/inside parameter |
| `af` / `if` | o,x | Select around/inside function |
| `ac` / `ic` | o,x | Select around/inside class |
| `]m` / `[m` | n | Next/previous function start |
| `]]` / `[[` | n | Next/previous class start |
| `]M` / `[M` | n | Next/previous function end |
| `][` / `[]` | n | Next/previous class end |
| `<leader>a` | n | Swap parameter with next |
| `<leader>A` | n | Swap parameter with previous |

#### Configuration

Installed parsers: bash, c, go, gomod, gosum, json, lua, markdown, markdown_inline, python, query, terraform, vim, vimdoc, yaml

#### Docs

- https://github.com/nvim-treesitter/nvim-treesitter

---

### vim-tmux-navigator

- **Repository**: christoomey/vim-tmux-navigator
- **Purpose**: Seamless navigation between Neovim and tmux panes

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h>` | n | Navigate left |
| `<C-j>` | n | Navigate down |
| `<C-k>` | n | Navigate up |
| `<C-l>` | n | Navigate right |

#### Docs

- https://github.com/christoomey/vim-tmux-navigator

# Plugins - Layout

## Overview

UI components for status line, buffer tabs, diagnostics, and content-specific features.

## Plugins

### lualine

- **Repository**: nvim-lualine/lualine.nvim
- **Purpose**: Fast and customizable status line

#### Configuration

- Theme: catppuccin
- Global statusline enabled
- Shows: filename (with path), active LSP servers, encoding, fileformat, filetype
- Lazy.nvim update indicator

#### Docs

- https://github.com/nvim-lualine/lualine.nvim

---

### bufferline

- **Repository**: akinsho/bufferline.nvim
- **Purpose**: Buffer/tab line with LSP diagnostics
- **Dependencies**: nvim-web-devicons

#### Configuration

- Mode: tabs
- Neo-tree offset configured
- LSP diagnostics enabled
- Modified indicator: bullet point

#### Docs

- https://github.com/akinsho/bufferline.nvim

---

### trouble

- **Repository**: folke/trouble.nvim
- **Purpose**: Pretty diagnostics, references, and quickfix lists

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>xx` | n | Toggle diagnostics |
| `<leader>xX` | n | Toggle buffer diagnostics |
| `<leader>cs` | n | Toggle symbols |
| `<leader>cl` | n | Toggle LSP definitions/references |
| `<leader>xL` | n | Toggle location list |
| `<leader>xQ` | n | Toggle quickfix list |

#### Docs

- https://github.com/folke/trouble.nvim

---

### vim-hugo

- **Repository**: phelipetls/vim-hugo
- **Purpose**: Hugo static site generator support

#### Docs

- https://github.com/phelipetls/vim-hugo

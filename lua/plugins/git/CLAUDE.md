# Plugins - Git

## Overview

Git integration for viewing changes, managing hunks, and exploring history.

## Plugins

### gitsigns

- **Repository**: lewis6991/gitsigns.nvim
- **Purpose**: Git signs in the gutter with hunk management

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `]c` | n,v | Jump to next hunk |
| `[c` | n,v | Jump to previous hunk |
| `<leader>hs` | n,v | Stage hunk |
| `<leader>hr` | n,v | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hR` | n | Reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hi` | n | Preview hunk inline |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff against index |
| `<leader>hD` | n | Diff against last commit |
| `<leader>tb` | n | Toggle line blame |
| `<leader>td` | n | Toggle deleted lines |
| `ih` | o,x | Select hunk (text object) |

#### Configuration

- Current line blame delay: 100ms

#### Docs

- https://github.com/lewis6991/gitsigns.nvim

---

### diffview

- **Repository**: sindrets/diffview.nvim
- **Purpose**: Tabpage interface for git diffs and file history
- **Dependencies**: nvim-web-devicons

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>do` | n | Open Diffview |
| `<leader>dc` | n | Close Diffview |
| `<leader>dh` | n | View file history |

#### Docs

- https://github.com/sindrets/diffview.nvim

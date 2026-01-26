# Plugins - AI

## Overview

AI-powered coding assistants integrated into the Neovim workflow.

## Plugins

### claudecode.nvim

- **Repository**: coder/claudecode.nvim
- **Purpose**: Claude AI integration for code assistance directly in Neovim
- **Dependencies**: folke/snacks.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>cc` | n | Toggle Claude terminal |
| `<leader>cf` | n | Focus Claude window |
| `<leader>cr` | n | Resume previous Claude session |
| `<leader>co` | n | Continue Claude conversation |
| `<leader>cm` | n | Select Claude model |
| `<leader>cb` | n | Add current buffer to context |
| `<leader>ccs` | v | Send visual selection to Claude |
| `<leader>as` | n | Add file from tree explorer |
| `<leader>aa` | n | Accept diff suggestion |
| `<leader>ad` | n | Deny diff suggestion |

#### Configuration

- Custom terminal command path: `~/.local/bin/claude`
- Works with neo-tree, NvimTree, oil, minifiles, and netrw file explorers

#### Docs

- https://github.com/coder/claudecode.nvim

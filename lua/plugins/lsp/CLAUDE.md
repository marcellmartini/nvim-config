# Plugins - LSP

## Overview

Language Server Protocol configuration, autocompletion, and language-specific tooling.

## Plugins

### nvim-lspconfig

- **Repository**: neovim/nvim-lspconfig
- **Purpose**: LSP client configuration and keybindings
- **Dependencies**: mason.nvim, mason-lspconfig.nvim, mason-tool-installer.nvim, nvim-cmp, fidget.nvim, lazydev.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n | Code action |
| `gd` | n | Go to definition |
| `gr` | n | Go to references |
| `gI` | n | Go to implementation |
| `gD` | n | Go to declaration |
| `<leader>D` | n | Type definition |
| `<leader>ds` | n | Document symbols |
| `<leader>ws` | n | Workspace symbols |
| `K` | n | Hover documentation |
| `<leader>wa` | n | Add workspace folder |
| `<leader>wr` | n | Remove workspace folder |
| `<leader>wl` | n | List workspace folders |
| `<leader>bf` | n | Format buffer |
| `<leader>m` | n | Open Mason UI |
| `<leader>li` | n | LSP info |

#### Configured Servers

| Server | Languages | Features |
|--------|-----------|----------|
| gopls | Go | Full IDE: hints, codelenses, staticcheck, gofumpt |
| ts_ls | JavaScript/TypeScript | Basic LSP |
| eslint | JavaScript/TypeScript | Linting |
| lua_ls | Lua | Neovim runtime aware |
| terraformls | Terraform | HCL support |
| pyright | Python | Type checking |
| dockerls | Dockerfile | Basic LSP |
| ansiblels | Ansible | YAML playbooks |

#### Mason-Installed Tools

Formatters: stylua, biome, gofumpt, goimports-reviser, golines, black, isort, shfmt
Linters: shellcheck, staticcheck, hadolint, pylint, bandit, flake8, mypy, tflint, trivy, yamllint, ansible-lint
Debuggers: delve, debugpy

#### Docs

- https://github.com/neovim/nvim-lspconfig

---

### nvim-cmp

- **Repository**: hrsh7th/nvim-cmp
- **Purpose**: Autocompletion engine with multiple sources
- **Dependencies**: LuaSnip, cmp-nvim-lsp, cmp-path, cmp-buffer, cmp_luasnip, friendly-snippets, lspkind.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-n>` | i | Select next item |
| `<C-p>` | i | Select previous item |
| `<C-d>` | i | Scroll docs down |
| `<C-f>` | i | Scroll docs up |
| `<C-y>` | i | Confirm selection (replace) |
| `<C-Space>` | i | Trigger completion |
| `<CR>` | i | Confirm selection (insert) |
| `<C-l>` | i,s | Jump to next snippet position |
| `<C-h>` | i,s | Jump to previous snippet position |

#### Configuration

- Sources: nvim_lsp, luasnip, path, buffer
- Bordered completion and documentation windows
- VSCode-style snippets via friendly-snippets
- Icons via lspkind

#### Docs

- https://github.com/hrsh7th/nvim-cmp

---

### fidget

- **Repository**: j-hui/fidget.nvim
- **Purpose**: LSP progress notifications

#### Docs

- https://github.com/j-hui/fidget.nvim

---

### lazydev

- **Repository**: folke/lazydev.nvim
- **Purpose**: Lua LSP configuration for Neovim development
- **Filetype**: lua

#### Configuration

- Library includes lazy.nvim types

#### Docs

- https://github.com/folke/lazydev.nvim

---

### nvim-ansible

- **Repository**: mfussenegger/nvim-ansible
- **Purpose**: Ansible file detection and utilities

#### Docs

- https://github.com/mfussenegger/nvim-ansible

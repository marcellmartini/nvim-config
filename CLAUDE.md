# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using **lazy.nvim** as the plugin manager. The configuration is modular, with plugins organized by purpose into categorized directories.

## Architecture

### Entry Point & Initialization Flow

1. `init.lua` loads the `Map` utility from `lua/utils/init.lua`
2. Auto-installs lazy.nvim if not present
3. Loads core config via `require("core")` which loads:
   - `lua/core/vim-options.lua` - Editor settings, diagnostics, autocommands
   - `lua/core/keymaps.lua` - Global keybindings
4. lazy.nvim imports all plugin specs from `lua/plugins/` subdirectories

### Plugin Organization

Plugins are organized in `lua/plugins/` by category:
- **ai/** - AI integrations (claudecode.nvim)
- **base/** - Core functionality (telescope, treesitter, neo-tree, colorscheme, tmux-navigator)
- **focus/** - Distraction-free modes (zen-mode, twilight)
- **git/** - Git integration (gitsigns, diffview)
- **layout/** - UI components (lualine, bufferline, trouble)
- **lsp/** - Language servers (nvim-lspconfig, nvim-cmp, nvim-ansible)
- **qol/** - Quality of life (formatting, linting, testing, debugging, harpoon, etc.)

Each `.lua` file in these directories returns a lazy.nvim plugin spec that is auto-discovered.

### Key Patterns

**Plugin spec structure:**
```lua
return {
    "author/plugin-name",
    dependencies = { ... },
    event = { "BufReadPre", "BufNewFile" },  -- Lazy loading trigger
    config = function()
        -- Setup code
        Map("n", "<leader>key", "command", { desc = "Description" })
    end,
}
```

**Global `Map` function** (from `lua/utils/init.lua`):
```lua
Map(mode, lhs, rhs, opts)  -- Wrapper around vim.keymap.set with noremap=true, silent=true
```

## LSP & Tooling

**Configured language servers** (in `lua/plugins/lsp/nvim-lspconfig.lua`):
- gopls (Go with extensive settings)
- ts_ls, eslint (JavaScript/TypeScript)
- lua_ls (Lua with Neovim runtime)
- terraformls, pyright, dockerls

**Mason-installed tools** include formatters (stylua, biome, gofumpt, black, shfmt) and linters (shellcheck, staticcheck, hadolint, pylint).

**Formatting** (conform.nvim): Auto-formats on save. Language-specific formatters in `lua/plugins/qol/formatting.lua`.

**Linting** (nvim-lint): Runs on BufEnter, BufWritePost, InsertLeave. Config in `lua/plugins/qol/linting.lua`.

## Key Keybindings

Leader key is `<space>`.

| Keymap | Action |
|--------|--------|
| `<leader>sf` | Find files (telescope) |
| `<leader>sg` | Live grep |
| `<leader>e` | Toggle neo-tree |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>bf` | Format buffer |
| `<leader>tt` | Run test file |
| `<leader>tr` | Run nearest test |
| `<F5>` | Debug continue |
| `<F10>` | Toggle breakpoint |

## Configuration Conventions

- **Leader**: Space
- **Indentation**: 4 spaces (configured in stylua.toml and vim-options)
- **Colorscheme**: Catppuccin (integrated with multiple plugins)
- **Line numbers**: Relative
- **Column guide**: 80 characters

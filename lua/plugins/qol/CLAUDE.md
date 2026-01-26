# Plugins - QOL (Quality of Life)

## Overview

Productivity enhancements for editing, navigation, testing, debugging, and workflow optimization.

## Plugins

### snacks

- **Repository**: folke/snacks.nvim
- **Purpose**: Collection of small QoL plugins (dashboard, notifications, lazygit, etc.)
- **Priority**: 1000

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>nx` | n | Hide notifications |
| `<leader>lf` | n | Lazygit file history |
| `<leader>lg` | n | Open Lazygit |
| `<leader>ll` | n | Lazygit log |

#### Enabled Features

- bigfile: Optimizes large file handling
- dashboard: Startup screen with recent files, projects, git status
- indent: Indent guides
- input: Better input UI
- lazygit: Git UI integration
- notifier: Notification system
- quickfile: Fast file opening
- words: Word navigation highlighting

#### Docs

- https://github.com/folke/snacks.nvim

---

### harpoon

- **Repository**: ThePrimeagen/harpoon
- **Branch**: harpoon2
- **Purpose**: Quick file navigation bookmarks
- **Dependencies**: plenary.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<A-a>` | n | Add file to harpoon |
| `<A-e>` | n | Toggle harpoon menu |
| `<A-j>` | n | Switch to mark 1 |
| `<A-k>` | n | Switch to mark 2 |
| `<A-l>` | n | Switch to mark 3 |
| `<A-;>` | n | Switch to mark 4 |
| `<A-h>` | n | Switch to mark 5 |

#### Docs

- https://github.com/ThePrimeagen/harpoon

---

### conform

- **Repository**: stevearc/conform.nvim
- **Purpose**: Code formatting with format-on-save

#### Formatters by Filetype

| Filetype | Formatters |
|----------|------------|
| lua | stylua |
| javascript | biome |
| go | gofumpt, goimports-reviser, golines |
| python | isort, black |
| sh | shfmt, shellcheck |
| terraform/tf | tofu_fmt |

#### Configuration

- Format on save enabled (500ms timeout)
- LSP fallback when no formatter configured
- Ignored filetypes: sql, java
- Ignored paths: node_modules

#### Docs

- https://github.com/stevearc/conform.nvim

---

### nvim-lint

- **Repository**: mfussenegger/nvim-lint
- **Purpose**: Asynchronous linting

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>lt` | n | Trigger linting |

#### Linters by Filetype

| Filetype | Linters |
|----------|---------|
| sh | shellcheck |
| go | staticcheck |
| dockerfile | hadolint |
| python | pylint, bandit |

#### Configuration

- Runs on: BufEnter, BufWritePost, InsertLeave
- Virtualenv-aware pylint

#### Docs

- https://github.com/mfussenegger/nvim-lint

---

### neotest

- **Repository**: nvim-neotest/neotest
- **Purpose**: Test runner framework
- **Dependencies**: nvim-nio, plenary.nvim, FixCursorHold.nvim, nvim-treesitter, neotest-go, neotest-jest, neotest-python

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>tt` | n | Run tests in file |
| `<leader>tT` | n | Run all tests |
| `<leader>tr` | n | Run nearest test |
| `<leader>tl` | n | Run last test |
| `<leader>ts` | n | Toggle summary |
| `<leader>to` | n | Show output |
| `<leader>tO` | n | Toggle output panel |
| `<leader>tS` | n | Stop tests |

#### Configured Adapters

- **Go**: 2m timeout, failfast, recursive
- **Jest**: npm test, CI mode
- **Python**: pytest with coverage, DEBUG logging

#### Docs

- https://github.com/nvim-neotest/neotest

---

### nvim-dap

- **Repository**: mfussenegger/nvim-dap
- **Purpose**: Debug Adapter Protocol client
- **Dependencies**: nvim-dap-ui, nvim-nio, nvim-dap-go, nvim-dap-python, nvim-dap-virtual-text

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<F5>` | n | Continue |
| `<F6>` | n | Step into |
| `<F7>` | n | Step over |
| `<F8>` | n | Step out |
| `<F9>` | n | Terminate |
| `<F10>` | n | Toggle breakpoint |
| `<leader>lp` | n | Set log point |
| `<leader>dp` | n | Open DAP UI |
| `<leader>dx` | n | Close DAP UI |
| `<leader>dl` | n | Run last |
| `<leader>dt` | n | Debug Go test |

#### Configuration

- Go and Python debugger support
- Virtual text for variable values
- Custom breakpoint signs

#### Docs

- https://github.com/mfussenegger/nvim-dap

---

### cloak

- **Repository**: laytan/cloak.nvim
- **Purpose**: Hide sensitive values in files

#### Configuration

- Cloak character: `*`
- File patterns: `.env*`, `.*rc`, `.git*`, `.*hist*`
- Cloak patterns: `=.+`, `:.+`, `-.+`

#### Docs

- https://github.com/laytan/cloak.nvim

---

### Comment

- **Repository**: numToStr/Comment.nvim
- **Purpose**: Smart code commenting

#### Usage

- `gc` - Toggle line comment (visual/normal)
- `gb` - Toggle block comment (visual)

#### Docs

- https://github.com/numToStr/Comment.nvim

---

### surround

- **Repository**: tpope/vim-surround
- **Purpose**: Surround text with brackets, quotes, tags

#### Usage

- `cs"'` - Change surrounding `"` to `'`
- `ds"` - Delete surrounding `"`
- `ysiw]` - Surround word with `[]`

#### Docs

- https://github.com/tpope/vim-surround

---

### todo-comments

- **Repository**: folke/todo-comments.nvim
- **Purpose**: Highlight and search TODO comments
- **Dependencies**: plenary.nvim

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `]t` | n | Next todo comment |
| `[t` | n | Previous todo comment |
| `<leader>te` | n | Search todos (Telescope) |

#### Docs

- https://github.com/folke/todo-comments.nvim

---

### undotree

- **Repository**: mbbill/undotree
- **Purpose**: Visual undo history

#### Keymaps

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>u` | n | Toggle undotree |

#### Docs

- https://github.com/mbbill/undotree

---

### vimwiki

- **Repository**: vimwiki/vimwiki
- **Purpose**: Personal wiki for notes

#### Configuration

- Wiki path: `~/.config/vimwiki`
- Syntax: default
- Extension: `.wiki`

#### Docs

- https://github.com/vimwiki/vimwiki

---

### sleuth

- **Repository**: tpope/vim-sleuth
- **Purpose**: Auto-detect indentation settings

#### Docs

- https://github.com/tpope/vim-sleuth

---

### which-key

- **Repository**: folke/which-key.nvim
- **Purpose**: Keybinding hints and documentation
- **Dependencies**: mini.icons

#### Registered Groups

- `<leader>c` - Code
- `<leader>d` - Document
- `<leader>g` - Git
- `<leader>h` - Git Hunk
- `<leader>r` - Rename
- `<leader>s` - Search
- `<leader>t` - Toggle
- `<leader>w` - Workspace

#### Docs

- https://github.com/folke/which-key.nvim

-- Map Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quit all
vim.keymap.set("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "[S]ave and [Q]uit" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "[Q]uit" })

-- Save all
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" })

-- My nvim configs
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorlineopt = "number"
vim.wo.wrap = false
vim.wo.linebreak = true
vim.opt.textwidth = 80
-- vim.wo.list = false -- extra option I set in addition to the ones in your question

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

vim.opt.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- automatically set the tmux session name
-- to the git basename directory
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.fn.system("tmux rename-session " .. vim.fn.system("basename $(git rev-parse --show-toplevel)"))
    end,
})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [['_dP]])

return {}

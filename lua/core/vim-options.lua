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
vim.wo.wrap = true
vim.wo.linebreak = true
vim.o.textwidth = 80
-- vim.wo.list = false -- extra option I set in addition to the ones in your question

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

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
-- based on the directory you are editing with
-- Neovim
vim.api.nvim_exec(
    [[ autocmd BufEnter * :lua vim.fn.system("tmux rename-session " .. vim.fn.system("basename $(git rev-parse --show-toplevel)")) ]],
    false
)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

return {}

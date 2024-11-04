-- Load Map function
Map = require("utils").Map

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("core")
require("lazy").setup({
    spec = {
        { import = "plugins.base" }, -- ./lua/plugins/base/
        { import = "plugins.focus" }, -- ./lua/plugins/focus/
        { import = "plugins.git" }, -- ./lua/plugins/git/
        { import = "plugins.layout" }, -- ./lua/plugins/layout/
        { import = "plugins.lsp" }, -- ./lua/plugins/lsp/
        { import = "plugins.qol" }, -- ./lua/plugins/qol/
    },
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
})

Map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "[L]azy UI" })

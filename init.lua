-- Load Map function
Map = require('utils').Map

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- import files from ./lua/core/
  { import = "core" },

  -- import files from ./lua/plugins/base/
  { import = "plugins.base" },

  -- import files from ./lua/plugins/focus/
  { import = "plugins.focus" },

  -- import files from ./lua/plugins/git/
  { import = "plugins.git" },

  -- import files from ./lua/plugins/layout/
  { import = "plugins.layout" },

  -- import files from ./lua/plugins/lsp/
  { import = "plugins.lsp" },

  -- import files from ./lua/plugins/qol/
  { import = "plugins.qol" },
})

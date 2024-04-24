-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

Map("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        --  Example of how to configure dependencies.
        -- {
        --     's1n7ax/nvim-window-picker',
        --     version = '2.*',
        --     config = function()
        --         require 'window-picker'.setup({
        --             filter_rules = {
        --                 include_current_win = false,
        --                 autoselect_one = true,
        --                 -- filter using buffer options
        --                 bo = {
        --                     -- if the file type is one of following, the window will be ignored
        --                     filetype = { 'neo-tree', "neo-tree-popup", "notify" },
        --                     -- if the buffer type is one of following, the window will be ignored
        --                     buftype = { 'terminal', "quickfix" },
        --                 },
        --             },
        --         })
        --     end,
        -- },
    },
    opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            },
            use_libuv_file_watcher = true,
        },
    },
}

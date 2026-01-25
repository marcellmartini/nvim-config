return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Nvim Tree",
                        separator = false,
                        text_align = "left",
                    },
                },
                diagnostics = "nvim_lsp",
                separator_style = { "", "" },
                modified_icon = "●",
                show_close_icon = false,
                show_buffer_close_icons = true,
            },
        })
    end,
}

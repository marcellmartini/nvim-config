return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                -- rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "biome" },
                go = { "gofumpt", "goimports-reviser", "golines" },
                sh = { "shfmt", "shellcheck" },
                terraform = { "tofu_fmt" },
                tf = { "tofu_fmt" },
                ["terraform-vars"] = { "tofu_fmt" },
            },
            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
                biome = {
                    inherit = true,
                    append_args = {
                        "--quote-style",
                        "single",
                        "--indent-style",
                        "space",
                        "--indent-width",
                        "4",
                        "--bracket-spacing",
                        "false",
                    },
                },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = function(bufnr)
                -- Disable autoformat on certain filetypes
                local ignore_filetypes = { "sql", "java" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                -- Disable autoformat for files in a certain path
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("/node_modules/") then
                    return
                end
                -- ...additional logic...
                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                }
            end,
        })
    end,
}

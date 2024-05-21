return { -- Work as a LSP, but to tool that are not talk LSP, like gofumpt.
    "nvimtools/none-ls.nvim",
    dependencies = {
        "gbprod/none-ls-shellcheck.nvim",
    },
    priority = 900,
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {
                -- lua
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.completion.luasnip, -- broken

                -- javascript
                -- null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.diagnostics.eslint,

                -- Go Lang
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.golines,
                null_ls.builtins.code_actions.gomodifytags,
                null_ls.builtins.code_actions.impl,

                -- spell words
                -- null_ls.builtins.completion.spell,

                -- shell
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { "-i", "2" },
                }),
                -- null_ls.builtins.formatting.shellharden,
                require("none-ls-shellcheck.diagnostics"),
                require("none-ls-shellcheck.code_actions"),

                -- Ansible
                -- null_ls.builtins.diagnostics.ansiblelint,

                -- Makefile
                -- null_ls.builtins.diagnostics.checkmake,

                -- Dockerfile
                null_ls.builtins.diagnostics.hadolint,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end,
}

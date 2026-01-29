return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", opts = {} },
        { "folke/lazydev.nvim", ft = "lua", opts = { library = { "lazy.nvim" } } },
    },
    config = function()
        -- Load custom LSP configs from lua/lsp/
        local lsp_config_path = vim.fn.stdpath("config") .. "/lua/lsp"
        for _, file in ipairs(vim.fn.glob(lsp_config_path .. "/*.lua", false, true)) do
            dofile(file)
        end

        -- LspAttach autocmd for keymaps and features
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local nmap = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Navigation keymaps
                nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                nmap("K", vim.lsp.buf.hover, "Hover Documentation")

                -- Workspace management
                nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                nmap("<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "[W]orkspace [L]ist Folders")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if not client then
                    return
                end

                -- Document highlight on cursor hold
                if client:supports_method("textDocument/documentHighlight") then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                -- Format on save
                if client:supports_method("textDocument/formatting") then
                    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = event.buf })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = event.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = event.buf })
                        end,
                    })
                end

                -- Inlay hints toggle
                if client:supports_method("textDocument/inlayHint") then
                    nmap("<leader>ih", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "[I]nlay [H]ints Toggle")
                end

                Map("n", "<leader>bf", vim.lsp.buf.format, { desc = "[B]uffer [F]ormat" })
            end,
        })

        -- Capabilities for nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- Apply capabilities globally to all LSP servers
        vim.lsp.config("*", { capabilities = capabilities })

        -- Mason setup
        require("mason").setup()
        Map("n", "<leader>m", "<cmd>Mason<CR>", { desc = "[M]ason UI" })
        Map("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP Info" })

        -- Servers to install via Mason
        local servers = {
            "gopls",
            "ts_ls",
            "eslint",
            "lua_ls",
            "terraformls",
            "dockerls",
            "pyright",
            "ansiblels",
        }

        -- Additional tools to install
        local tools = {
            -- lua
            "stylua",
            -- shell
            "shfmt",
            "shellcheck",
            -- GO
            "gofumpt",
            "goimports-reviser",
            "golines",
            "gomodifytags",
            "impl",
            "staticcheck",
            "delve",
            -- Ansible
            "ansible-lint",
            -- Dockerfile
            "hadolint",
            -- javascript
            "biome",
            -- Terraform
            "tflint",
            "trivy",
            -- python
            "bandit",
            "black",
            "debugpy",
            "flake8",
            "isort",
            "mypy",
            "pylint",
            -- yaml
            "yamllint",
        }

        local ensure_installed = vim.list_extend(vim.list_extend({}, servers), tools)
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        -- mason-lspconfig enables servers automatically
        require("mason-lspconfig").setup()
    end,
}

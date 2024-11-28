return { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig", -- help neovim comunicate with LSP.
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        "williamboman/mason-lspconfig.nvim", -- config lsp
        "williamboman/mason.nvim", -- software install
        "hrsh7th/nvim-cmp", -- autocomplete snippet
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- mason Automatically install software

        -- Useful status updates for LSP.
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { "j-hui/fidget.nvim", opts = {} },

        -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        { "folke/neodev.nvim", opts = {} },
    },
    lazy = false,
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                -- NOTE: Remember that lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself
                -- many times.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local nmap = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                -- See `:help K` for why this keymap
                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

                -- Lesser used LSP functionality
                nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                nmap("<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "[W]orkspace [L]ist Folders")

                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = event.buf,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = event.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = event.buf })
                        end,
                    })
                end

                Map("n", "<leader>bf", vim.lsp.buf.format, { desc = "[B]uffer [F]ormat" })
            end,
        })

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local util = require("lspconfig.util")

        local servers = {
            gopls = {
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        codelenses = {
                            gc_details = false,
                            generate = true,
                            regenerate_cgo = true,
                            run_govulncheck = true,
                            test = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                        },
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        analyses = {
                            fieldalignment = true,
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        gofumpt = true,
                        staticcheck = true,
                        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                        semanticTokens = true,
                    },
                },
            },
            -- javascript

            -- biome = {
            --     filetypes = {
            --         "javascript",
            --         "javascriptreact",
            --         "json",
            --         "jsonc",
            --         "typescript",
            --         "typescript.tsx",
            --         "typescriptreact",
            --         "astro",
            --         "svelte",
            --         "vue",
            --     },
            --     root_dir = util.root_pattern("biome.json", "biome.jsonc", ".git"),
            -- },
            ts_ls = {},
            -- tailwindcss = {},
            eslint = {},

            -- snyk_ls = {},
            lua_ls = {
                filetypes = { "lua" },
                root_dir = util.root_pattern(
                    ".luarc.json",
                    ".luarc.jsonc",
                    ".luacheckrc",
                    ".stylua.toml",
                    "stylua.toml",
                    "selene.toml",
                    "selene.yml",
                    ".git"
                ),
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                -- Depending on the usage, you might want to add additional paths here.
                                -- '${3rd}/luv/library'
                                -- '${3rd}/busted/library',
                            },
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file('', true)
                        },
                        telemetry = { enable = false },
                        format = {
                            enable = false,
                            -- Put format options here
                            -- NOTE: the value should be String!
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = 4,
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
            terraformls = {
                filetypes = { "tf", "terraform", "terraform-vars" },
                root_dir = util.root_pattern(".terraform", ".git"),
            },
            dockerls = {},
            -- tflint = {
            --     filetypes = { "terraform" },
            --     cmd = { "tflint", "--langserver" },
            -- },
            pyright = {},
        }

        -- Configure mason
        require("mason").setup()
        Map("n", "<leader>m", "<cmd>Mason<CR>", { desc = "[M]ason UI" })
        Map("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP Info" })

        -- You can add other tools here that you want Mason to install
        -- for you, so that they are available from within Neovim.
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            -- lua
            "stylua", -- used in conform.nvim - Used to format Lua code
            --
            -- Fix words
            -- 'misspell',

            -- shell
            "shfmt",
            "shellcheck",
            -- 'shellharden',

            -- GO
            "gofumpt", -- used in conform.nvim
            "goimports-reviser", -- used in conform.nvim
            "golines", -- used in conform.nvim
            "gomodifytags", -- used in conform.nvim
            "impl", -- used in conform.nvim
            "staticcheck", -- used in gopls configure in nvim-lspconfig
            -- 'gotests',
            "delve", -- used in nvim-dap-go

            -- Ansible
            -- 'ansible-lint',

            -- Makefile
            -- 'checkmake',

            -- Dockerfile
            "hadolint",

            -- javascript
            "biome",

            -- Terraform
            "tflint",
            "trivy",

            -- python
            "black",
            "debugpy",
            "flake8",
            "isort",
            "mypy",
            "pylint",

            -- yaml
            "yamllint",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off
                    -- formatting for tsserver)
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}

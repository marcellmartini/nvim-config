return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-jest",
        "nvim-neotest/neotest-python",
    },
    config = function()
        -- get neotest namespace (api call creates or returns namespace)
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)
        require("neotest").setup({
            -- your neotest config here
            adapters = {
                require("neotest-go")({
                    args = { "-timeout=2m", "-failfast" },
                    recursive_run = true,
                }),
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "jest.config.json",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.fnamemodify(path, ":p:h") -- Define o diretório de trabalho para o diretório do arquivo de teste
                    end,
                    discovery = {
                        enabled = false,
                    },
                }),
                require("neotest-python")({
                    dap = { justMyCode = false },
                    args = { "--cov", "--log-level", "DEBUG" },
                    runner = "pytest",
                    pytest_discover_instances = true,
                }),
            },
        })

        Map("n", "<leader>tt", function()
            require("neotest").run.run(vim.fn.expand("%"))
        end, { desc = "Run File" })

        Map("n", "<leader>tT", function()
            require("neotest").run.run(vim.uv.cwd())
        end, { desc = "Run All Test Files" })

        Map("n", "<leader>tr", function()
            require("neotest").run.run()
        end, { desc = "Run Nearest" })

        Map("n", "<leader>tl", function()
            require("neotest").run.run_last()
        end, { desc = "Run Last" })

        Map("n", "<leader>ts", function()
            require("neotest").summary.toggle()
        end, { desc = "Toggle Summary" })

        Map("n", "<leader>to", function()
            require("neotest").output.open({ enter = true, auto_close = true })
        end, { desc = "Show Output" })

        Map("n", "<leader>tO", function()
            require("neotest").output_panel.toggle()
        end, { desc = "Toggle Output Panel" })

        Map("n", "<leader>tS", function()
            require("neotest").run.stop()
        end, { desc = "Stop" })
    end,
}

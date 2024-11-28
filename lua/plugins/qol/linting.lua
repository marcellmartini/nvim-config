return {
    "mfussenegger/nvim-lint",
    event = { "BufEnter", "BufWritePost" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "biomejs" },
            typescript = { "biomejs" },
            terraform = { "tflint", "trivy" },
            tf = { "tflint", "trivy" },
            yaml = { "yamllint" },
            sh = { "shellcheck" },
            go = { "staticcheck" },
            dockerfile = { "hadolint" },
            python = { "flake8", "mypy", "pylint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        -- Set pylint to work in virtualenv
        -- vim.env.MASON
        if os.getenv("VIRTUAL_ENV") ~= nil then
            local venv_path = os.getenv("VIRTUAL_ENV")
            require("lint").linters.pylint.cmd = venv_path .. "/bin/pylint"
        end

        vim.keymap.set("n", "<leader>lt", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}

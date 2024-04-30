return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local dapgo = require("dap-go")

        dapgo.setup()
        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        --
        -- Key maps
        --
        Map("n", "<F5>", function()
            dap.continue()
        end, { desc = "DAP Continue" })

        Map("n", "<F6>", function()
            dap.step_into()
        end, { desc = "DAP Step Into" })

        Map("n", "<F7>", function()
            dap.step_over()
        end, { desc = "DAP Step Over" })

        Map("n", "<F8>", function()
            dap.step_out()
        end, { desc = "DAP Step Out" })

        Map("n", "<F9>", function()
            dap.terminate()
        end, { desc = "DAP Terminate" })

        Map("n", "<F10>", function()
            dap.toggle_breakpoint()
        end, { desc = "DAP Toggle BreakPoint" })

        Map("n", "<Leader>lp", function()
            dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, { desc = "DAP Log Point Message" })

        Map("n", "<Leader>dp", function()
            dapui.open()
        end, { desc = "DAP Open UI" })

        Map("n", "<Leader>de", function()
            dapui.close()
        end, { desc = "DAP Close UI" })

        Map("n", "<Leader>dl", function()
            dap.run_last()
        end, { desc = "DAP Run Last" })

        Map("n", "<Leader>dt", function()
            dapgo.debug_test()
        end, { desc = "DAP Debug Test" })

        vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

        vim.fn.sign_define(
            "DapBreakpoint",
            { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
        )
        vim.fn.sign_define(
            "DapBreakpointCondition",
            { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
        )
        vim.fn.sign_define(
            "DapBreakpointRejected",
            { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
        )
        vim.fn.sign_define(
            "DapLogPoint",
            { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
        )
        vim.fn.sign_define(
            "DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
        )
    end,
}

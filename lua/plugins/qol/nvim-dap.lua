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

		require("dap-go").setup()
		require("dapui").setup()

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
		end)
		Map("n", "<F6>", function()
			dap.step_into()
		end)
		Map("n", "<F7>", function()
			dap.step_over()
		end)
		Map("n", "<F8>", function()
			dap.step_out()
		end)
		Map("n", "<F9>", function()
			dap.toggle_breakpoint()
		end)
		Map("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		Map("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		Map("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		Map("n", "<Leader>dl", function()
			dap.run_last()
		end)
	end,
}

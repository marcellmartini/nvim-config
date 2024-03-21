return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local trouble = require("trouble")

		-- Lua
		Map("n", "<leader>xx", function()
			trouble.toggle()
		end, { desc = "" })
		Map("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, { desc = "" })
		Map("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end, { desc = "" })
		Map("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end, { desc = "" })
		Map("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end, { desc = "" })
		Map("n", "gR", function()
			trouble.toggle("lsp_references")
		end, { desc = "" })
	end,
}

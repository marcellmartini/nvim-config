return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		-- Lua
		Map("n", "<leader>xx", function()
			require("trouble").toggle()
		end, { desc = "" })
		Map("n", "<leader>xw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "" })
		Map("n", "<leader>xd", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "" })
		Map("n", "<leader>xq", function()
			require("trouble").toggle("quickfix")
		end, { desc = "" })
		Map("n", "<leader>xl", function()
			require("trouble").toggle("loclist")
		end, { desc = "" })
		Map("n", "gR", function()
			require("trouble").toggle("lsp_references")
		end, { desc = "" })
	end,
}

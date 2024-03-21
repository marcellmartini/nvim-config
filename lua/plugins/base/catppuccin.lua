return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			integrations = {
				neotree = true,
			},
		})

		vim.api.nvim_cmd({
			cmd = "colorscheme",
			args = { "catppuccin" },
		}, {})
	end,
}

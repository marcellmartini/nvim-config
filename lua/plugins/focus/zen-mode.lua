return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			plugins = {
				twilight = { enabled = false },
			},
		})

		Map("n", "<leader>z", "<cmd> ZenMode<CR>")
	end,
}

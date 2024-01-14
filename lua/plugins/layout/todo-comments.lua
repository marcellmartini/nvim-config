return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		Map("n", "<leader>st", "<CMD>TodoTelescope<CR>", { desc = "[S]earch [T]odo List" }),
	},
	config = true,
}

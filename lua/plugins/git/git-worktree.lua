return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("git-worktree").setup()
		require("telescope").load_extension("git_worktree")

		Map(
			"n",
			"<leader>gw",
			"<CMD>:lua require('telescope').extensions.git_worktree.git_worktree()<CR>",
			{ desc = "[G]it [W]orktree Switch" }
		)

		Map(
			"n",
			"<leader>gW",
			"<CMD>:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
			{ desc = "[G]it [W]orktree Add" }
		)
	end,
}

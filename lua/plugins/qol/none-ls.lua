return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,

				-- javascript
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.eslint,

				-- spell words
				-- null_ls.builtins.completion.spell,
			},
		})

		Map("n", "<leader>bf", vim.lsp.buf.format, { desc = "[B]uffer [F]ormat" })
	end,
}

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Fix words
				"misspell",

				-- Shell
				"shfmt",
				"shellcheck",

				-- LUA
				"stylua",

				-- GO
				"gofumpt",
				"goimports-reviser",
				"golines",
				"gotests",
				"impl",
				"delve",
			},
		})
	end,
}

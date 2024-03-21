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

				-- Terraform
				"terraform-ls",
				"tflint",

				-- Ansible
				-- "ansible-lint",

				-- Makefile
				-- "checkmake",
			},
		})
	end,
}

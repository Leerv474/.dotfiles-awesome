return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_config = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "󰄳",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_config.setup({
			ensure_installed = {
				-- cpp
				"cmake",
				"clangd",
				-- python
				"pyright",
				-- lua
				"lua_ls",
				-- java
				"jdtls",
				-- web
				"html",
				"cssls",
				-- xml
				"lemminx",
				"jsonls",
				-- bash
				"bashls",
				-- markdown
				"marksman",
				"sqls",
				"tsserver",
			},
		})
	end,
}

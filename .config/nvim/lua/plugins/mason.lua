return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim'
	},

	config = function()
		local mason = require("mason")
		local mason_config = require("mason-lspconfig")
        local mason_installer = require("mason-tool-installer")

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

        mason_installer.setup({
            ensure_installer = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "clang-format",
                "beautysh",
                "sql-formatter",
                -- linters
                "cpplint",
                "eslint_d",
                "checkstyle",
            }
        })
	end,
}

return {
	{
		"williamboman/mason.nvim",
		priority = 1000,

		config = function()
			require("mason").setup()
		end,
	},
	{
		--- lsp servers management
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				-- Replace the language servrs listed here
				-- with the ones you want to install
				ensure_installed = {
					"rust_analyzer",
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
					"biome",
					-- xml
					"lemminx",
					-- bash
					"bashls",
					-- markdown
					"marksman",
				},
			})
		end,
	},
	{
		-- LSP Support
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
							},
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.cmake.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--fallback-style=webkit",
				},
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.biome.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.lemminx.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			vim.diagnostic.config({
				virtual_text = {
					source = "if_many",
					prefix = "  ",
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}

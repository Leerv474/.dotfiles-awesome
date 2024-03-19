return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}

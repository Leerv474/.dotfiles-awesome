return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},

	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				-- Formatters
				"black",
				"isort",
				"prettier",
				"stylua",
				"xmlformatter",
				-- Linters
				"cpplint",
				"eslint_d",
				"biome",
			},
			automatic_installation = false,
			handlers = {},
		})

		local null_ls = require("null-ls")
		null_ls.setup({})
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

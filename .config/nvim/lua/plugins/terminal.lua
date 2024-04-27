return {
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			direction = "float",

			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved",
				-- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
				width = 160,
				height = 35,
				title_pos = "center",
			},
		})
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		vim.keymap.set("n", "<leader>lg", function()
			lazygit:toggle()
		end, { desc = "Open LazyGit", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>to", ":ToggleTerm<CR>", { desc = "Open terminal", noremap = true })
	end,
}

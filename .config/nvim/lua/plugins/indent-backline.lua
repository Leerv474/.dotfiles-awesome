return {
	"lukas-reineke/indent-blankline.nvim",

	config = function()
		local ibl = require("ibl")
		ibl.setup({
			indent = {
				char = { "" },
			},
			scope = {
				enabled = true,
				priority = 2,
				show_start = false,
				show_end = false,
				show_exact_scope = true,
				char = { "" },
			},
		})
	end,
}

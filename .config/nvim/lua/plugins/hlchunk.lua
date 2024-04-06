return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },

	config = function()
		local hlchuck = require("hlchunk")

		hlchuck.setup({
			indent = {
				enable = true,
				chars = { "" },
			},
			chunk = {
				enable = true,
                notify = false,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "",
				},
				style = "#9399b2",
			},
			blank = {
				enable = false,
			},
			line_num = {
				enable = true,
				style = "#9399b2",
			},
		})
	end,
}

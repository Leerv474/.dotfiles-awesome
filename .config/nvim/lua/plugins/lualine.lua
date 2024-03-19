return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"abeldekat/harpoonline",
	},

	priority = 1000,

	config = function()
		-- sections
		local diff = {
			"diff",
			icon = "",
			colored = true, -- displays a colored diff status if set to true
			symbols = { added = " ", modified = "󰛿 ", removed = " " }, -- changes the symbols used by the diff.
			source = nil, -- a function that works as a data source for diff.
		}

		local filename = {
			"filename",
			file_status = true, -- Displays file status (readonly status, modified status)
			newfile_status = false, -- Display new file status (new file means no write after created)
			path = 0, -- 0: Just the filename

			shorting_target = 40, -- Shortens path to leave 40 spaces in the window
			-- for other components. (terrible name, any suggestions?)
			symbols = {
				modified = "  ", -- Text to show when the file is modified.
				readonly = "  ", -- Text to show when the file is non-modifiable or readonly.
				unnamed = "[No Name]", -- Text to show for unnamed buffers.
				newfile = "[New]", -- Text to show for newly created file before first write
			},
			left_padding = 0,
		}

		local harpoonline = require("harpoonline").setup()

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
				lualine_b = { "branch", diff, "diagnostics" },
				lualine_c = { filename },
				lualine_x = { harpoonline.format },
				lualine_y = { "filetype" },
				lualine_z = { { "location", separator = { left = "", right = "" }, right_padding = 2 } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

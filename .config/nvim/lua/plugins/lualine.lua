return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"abeldekat/harpoonline",
	},

	priority = 1000,

	config = function()
		-- sections
		local mode = {
			"mode",
			separator = { left = "" },
			padding = { right = 2, left = 1 },
		}
		local location = {
			"location",
			separator = { right = "" },
			padding = { left = 1, right = 1 },
		}

		local diff = {
			"diff",
			icon = "",
			colored = true, -- displays a colored diff status if set to true
			symbols = { added = " ", modified = "󰛿 ", removed = " " }, -- changes the symbols used by the diff.
			source = nil, -- a function that works as a data source for diff.
		}

		local filetype = {
			"filetype",
			colored = true,
			icon_only = true,
			separator = {},
			padding = { right = 0 },
		}
		local filename = {
			"filename",
			file_status = false, -- Displays file status (readonly status, modified status)
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
			padding = { right = 2 },
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
				lualine_a = { mode },
				lualine_b = { "branch", diff, "diagnostics" },
				lualine_c = {},
				lualine_x = { filetype, filename },
				lualine_y = { { harpoonline.format, padding = { right = 2 } } },
				lualine_z = { location },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { location },
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

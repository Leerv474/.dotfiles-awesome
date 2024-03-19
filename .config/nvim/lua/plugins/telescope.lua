return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					layout_config = {
						horizontal = {
							preview_cutoff = 0,
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden", -- **Also this flag. The combination of the two is the same as `-uu`**
					},
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({
								-- even more opts
							}),
						},
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.setup()
		end,
	},

	-- make everything look like telescope
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}

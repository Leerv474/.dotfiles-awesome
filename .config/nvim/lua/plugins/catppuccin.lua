return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
		})
		vim.cmd.colorscheme("catppuccin")

        vim.api.nvim_set_hl(0, "Normal", {bg = 'none' })
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = 'none' })
	end,
}

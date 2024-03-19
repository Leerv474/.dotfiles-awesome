return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	"theHamsta/nvim-treesitter-pairs",
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"java",
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"bash",
		"html",
		"css",
		"javascript",
		"json",
		"python",
		"xml",
		"sql",
		"json",
		"json5",
		"markdown",
	},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local filename = vim.api.nvim_buf_get_name(buf)
			local ok, stats = pcall(vim.uv.fs_stat, filename)
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},

	pairs = {
		enable = true,
		disable = {},
		highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
		highlight_self = true, -- whether to highlight also the part of the pair under cursor (or only the partner)
		goto_right_end = false, -- whether to go to the end of the right partner or the beginning
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
		keymaps = {
			goto_partner = "<leader>%",
			delete_balanced = "X",
		},
		delete_balanced = {
			only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
			fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
			longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
			-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
		},
	},
}

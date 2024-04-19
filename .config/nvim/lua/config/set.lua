vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver30,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showtabline = 0
vim.opt.mouse = ""

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.wo.cursorline = true

vim.opt.wrap = true

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- so split focuses new window
vim.opt.splitright = true
vim.opt.splitbelow = true

-- xml formatting
vim.api.nvim_command("autocmd FileType xml set equalprg=xmllint\\ --format\\ -")
-- ignore case
vim.opt.ic = true

-- change diagnostic signs
vim.cmd([[ 
    sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl= 
    sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl= 
    sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl= 
    sign define DiagnosticSignHint text=  linehl= texthl=DiagnosticSignHint numhl= 
    ]])

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

vim.g.omni_sql_no_default_maps = 1

-- spellchecking
vim.opt.spelllang = 'en_us'
vim.opt.spell = false 

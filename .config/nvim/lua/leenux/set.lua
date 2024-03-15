vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver30,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.showtabline = 0

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

vim.api.nvim_command('autocmd FileType xml set equalprg=xmllint\\ --format\\ -')
vim.opt.ic = true



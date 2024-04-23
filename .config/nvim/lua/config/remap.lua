vim.g.mapleader = " "
-- netwrd
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- split screen
vim.keymap.set("n", "<leader>s", vim.cmd.vsplit)

-- moving indent as much as you want
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- moving selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeping search results at the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- so paste over doesn't change buffer
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- better yap
vim.keymap.set("v", "<leader>y", '"+y')

-- paste over without buffering
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true })

-- better panes navigation
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

--normal backspace in insert mode
vim.api.nvim_set_keymap('i', '<C-BS>', '<Esc>caw', {noremap = true})

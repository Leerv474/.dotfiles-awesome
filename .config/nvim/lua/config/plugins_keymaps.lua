-- INFO: LSP
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})

-- INFO: GIT SIGNS
local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk_inline)

--INFO: Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- INFO: HARPOON
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>h1", function()
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>h2", function()
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>h3", function()
    harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>h4", function()
    harpoon:list():select(4)
end)

-- INFO: TELESCOPE
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
    builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ft", function()
    builtin.diagnostics({ previewer = false })
end, {})
vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true })

-- INFO: FORMATTING
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

--INFO: Terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

vim.keymap.set("n", "<leader>lg", function()
    lazygit:toggle()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ot", ":ToggleTerm<CR>", { noremap = true })

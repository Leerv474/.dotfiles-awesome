local builtin = require('telescope.builtin')
local telescope = require('telescope')
telescope.setup({
    defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--no-ignore', -- **This is the added flag**
      '--hidden' -- **Also this flag. The combination of the two is the same as `-uu`**
    },
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
  }
})

telescope.load_extension("ui-select")
vim.keymap.set('n', '<leader>ff', function () builtin.find_files({hidden = true}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function ()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ft', function () builtin.diagnostics({previewer = false}) end, {})





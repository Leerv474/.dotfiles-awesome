return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",

        config = function ()
            local gs = require("gitsigns")
            gs.setup()

            vim.keymap.set("n", "<leader>gp", gs.preview_hunk_inline)
        end
    },
}

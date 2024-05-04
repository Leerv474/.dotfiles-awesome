return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        presets = {
            operators = true,
            motions = false,
            g = true,
        },
    },
}

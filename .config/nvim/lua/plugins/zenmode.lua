return {
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 0.85,
            },

            on_open = function(win)
                vim.cmd([[TransparentDisable]])
            end,

            on_close = function()
                vim.cmd([[TransparentEnable]])
            end,
        },
    },

    {
        "folke/twilight.nvim",
        opts = {
        },
    },
}

return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },

    config = function()
        require("mason-null-ls").setup({
            ensure_installed = {
                -- Formatters
                "black",
                "isort",
                "prettier",
                "stylua",
                "xmlformatter",
                -- Linters
                "cpplint",
                "eslint_d",
            },
            automatic_installation = false,
            handlers = {},
        })

        local null_ls = require("null-ls")
        null_ls.setup({})
    end,
}

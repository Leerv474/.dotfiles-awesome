require("tabset").setup({
    defaults = {
        tabwidth = 4,
        expandtab = true
    },
    languages = {
        go = {
            tabwidth = 4,
            expandtab = false
        },
        {
            filetypes = {   
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                "json",
                "yaml",
                "html",
                "css",
            },
            config = {
                tabwidth = 2
            }
        }
    }
})

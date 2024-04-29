return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }

        function MarkdownPreview(url)
            os.execute("firefox --new-window " .. url)
        end

        vim.g.mkdp_browserfunc = "MarkdownPreview"
    end,
    ft = { "markdown" },
}

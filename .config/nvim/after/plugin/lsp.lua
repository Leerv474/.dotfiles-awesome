local lsp = require('lsp-zero')

lsp.preset({
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = {
        preserve_mappings = false,
        omit = {},
    },
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})

lsp.on_attach(function (client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "[d", function () vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function () vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>gr", function () vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>k", function () vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ca", function () vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rr", function () vim.lsp.buf.rename() end, opts)
end)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        prefix = '',
    },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'single',
        source = 'always',
        header = '',
    },
}
)

-- UI
lsp.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = '»'
})

-- Autocompletion
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local cmp_format = lsp.cmp_format();
local vscode = require('luasnip.loaders.from_vscode')


vscode.lazy_load()
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
    formatting = cmp_format,
})


-- LSP servers
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servrs listed here
    -- with the ones you want to install
    ensure_installed = {
        'rust_analyzer',
        'cmake',
        'jedi_language_server',
        'lua_ls',
        'clangd',
        'jdtls',
        'html',
        'cssls',
        'bashls',
        'biome',
        'lemminx',
    },
    handlers = {
        lsp.default_setup,
    }
})

signature = require("lsp_signature")
signature.setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
    hint_enable = false,
})

lspconfig = require("lspconfig")

-- disable arguments insertion in cpp
lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--function-arg-placeholders=0",
    }
}

-- disable vim warning in lua
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}


lsp.setup()

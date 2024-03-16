return {
    {
        'williamboman/mason.nvim',
        priority = 1000,

        config = function ()
            require('mason').setup()
        end
    },
    {
        --- lsp servers management
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function ()
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
                    'marksman',
                },
            })
        end
    },
    {
        -- LSP Support
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function ()
            local lspconfig = require("lspconfig")

            --disable arguments insertion in cpp
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
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {} )
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {} )
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {} )
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {} )
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {} )

            vim.diagnostic.config({
                virtual_text = {
                    source = "if_many",
                    prefix = '  ',
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'if_many',
                    header = '',
                    prefix = '',
                },
            })
        end
    },
    -- Autocompletion
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        'saadparwaiz1/cmp_luasnip',
    },
    {
        'hrsh7th/nvim-cmp',
        config = function ()
            local cmp = require('cmp')
		    require('luasnip.loaders.from_vscode').lazy_load()
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
            })
        end
    },
    -- code hints
    {
        "ray-x/lsp_signature.nvim",

        config = function ()

            require("lsp_signature").setup({
                bind = true,
                handler_opts = {
                    border = "rounded"
                },
                hint_enable = false,
            })
        end
    }
}

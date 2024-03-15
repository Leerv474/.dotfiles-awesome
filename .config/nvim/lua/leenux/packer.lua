--  This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- theme
    use { "catppuccin/nvim", as = "catppuccin"}

    -- TELESCOPE --- 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- make everything look like telescope
    use ('nvim-telescope/telescope-ui-select.nvim')

    -- TREESITTER ---
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- bracket highlighting
    use ('theHamsta/nvim-treesitter-pairs')

    --- UNDO TREE --- 
    use ('mbbill/undotree')

    --- STATUS LINE --- 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --- LSP ---
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- lsp servers management
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            { 'saadparwaiz1/cmp_luasnip' },
            { "rafamadriz/friendly-snippets" }

        }
    }

    -- hints for function arguments
    use {
        "ray-x/lsp_signature.nvim",
    }

    --- CONVENIENCE
    -- auto set tab width for different file types
    use {
        "FotiadisM/tabset.nvim",
    }

    -- IT'S HARPOON WDYM
    use("theprimeagen/harpoon")

    -- adds highlights for comments marked
    -- TODO: 
    -- FIX:
    -- HACK:    
    -- NOTE:
    -- PERF:
    -- WARNING:
    use({
        "folke/todo-comments.nvim",
        requires = { {'nvim-lua/plenary.nvim'} },
    })

    -- adds hotkeys for multi-commenting
    use {
        'numToStr/Comment.nvim',
    }

    -- highlights indentation
    use {
        "lukas-reineke/indent-blankline.nvim"
    }


end)


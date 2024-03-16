return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },


    config = function ()
        require("lualine").setup ({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {{ 'mode', separator = { left = '', right = '' }, right_padding = 2 }},
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        colored = true, -- Displays a colored diff status if set to true
                        symbols = {added = ' ', modified = '󰛿 ', removed = ' '}, -- Changes the symbols used by the diff.
                        source = nil, -- A function that works as a data source for diff.
                    },
                    'diagnostics'
                },
                lualine_c = {'filename'},
                lualine_x = {'encoding'},
                lualine_y = {'filetype'},
                lualine_z = {{'location', separator = {left = '', right = '' }, right_padding = 2}},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}

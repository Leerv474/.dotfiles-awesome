return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        vim.keymap.set("n", "<leader>pv", "<cmd>Neotree position=current<CR>", { desc = "open file tree" })

        local neotree = require("neo-tree")
        neotree.setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                group_empty_dirs = false,
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            },
            window = {
                position = "current",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                nesting_rules = {},
                mappings = {
                    ["Z"] = "expand_all_nodes",
                }
            },
        })
    end,
}

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- For file and folder icons
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                default_component_configs = {
                    icon = {
                        folder_closed = "", -- Icon for closed folders
                        folder_open = "",   -- Icon for open folders
                        folder_empty = "", -- Icon for empty folders
                        default = "",      -- Default icon for files
                    },
                    indent = {
                        with_markers = true,
                    },
                },
                filesystem = {
                    window = {
                        position = "left", -- Sidebar stays on the left
                        width = 30, -- Adjust sidebar width
                    },
                    hijack_netrw_behavior = "open_current", -- Ensure files open in the main area
                },
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function(file_path)
                            -- Do NOT close Neo-tree (leave it open)
                        end,
                    },
                },
            })

            -- Keybindings
            vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
            vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}

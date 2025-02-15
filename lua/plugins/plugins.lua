return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {
            ignore = "^$",
        },
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "K",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<C-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },

    {
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        config = function()
            vim.opt.termguicolors = true
            require("nvim-highlight-colors").setup({
                render = "background",
                enable_named_colors = true,
                enable_tailwind = false,
            })
        end,
    },

    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
        opts = {
            default_file_explorer = true,
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "hedyhli/outline.nvim",
        event = "VeryLazy",
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {},
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                update_focused_file = { enable = true, update_cwd = true },
                view = { width = 30, side = "left" },
                git = { enable = true },
            })
            vim.keymap.set("n", "<leader>e", function() require("nvim-tree.api").tree.toggle() end,
                { desc = "Toggle File Tree" })
        end,
    },
}


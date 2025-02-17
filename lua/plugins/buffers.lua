return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",

    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 20,
                tab_size = 22,
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = true,
                show_close_icon = false,
                show_tab_indicators = true,
                separator_style = "slant",
                enforce_regular_tabs = false,
                always_show_bufferline = true,

                -- Sort buffers based on last accessed
                sort_by = "insert_after_current",

                -- Hover tooltips for diagnostics
                hover = {
                    enabled = true,
                    delay = 150,
                    reveal = { "close" },
                },

                -- Change tab color based on errors/warnings
                highlights = {
                    buffer_selected = {
                        fg = function()
                            local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                            local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                            if errors > 0 then
                                return "#ff5555" -- Red for errors
                            elseif warnings > 0 then
                                return "#ffcc00" -- Yellow for warnings
                            else
                                return "#ffffff" -- Normal white
                            end
                        end,
                        bold = true,
                        italic = false,
                    },
                },
            },
        })
    end,
}

-- plugins/lualine.lua
return {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox", -- You can change this to any theme you prefer
        },
      })
    end,
  }
  
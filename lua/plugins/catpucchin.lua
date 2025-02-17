return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,  -- Enables transparency
        integrations = {
          telescope = true,
          nvimtree = true,
          treesitter = true,
        }
      })
      vim.cmd.colorscheme "catppuccin-mocha"

      -- Set terminal opacity (works best with a compositor like picom)
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end
  }
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      
      -- JavaScript / TypeScript Setup
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      
      -- Ruby Setup
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      
      -- HTML Setup
      lspconfig.html.setup({
        capabilities = capabilities
      })
      
      -- Lua Setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      
      -- C++/C Setup using clangd
      lspconfig.clangd.setup({
        capabilities = capabilities
      })

      vim.filetype.add({
				extension = {
					vert = "glsl",
					tesc = "glsl",
					tese = "glsl",
					frag = "glsl",
					geom = "glsl",
					comp = "glsl",
					vs = "glsl",
					fs = "glsl",
				},
			})

			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {},
				},
				handlers = handlers,
			})
      
      -- Key mappings for LSP features
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

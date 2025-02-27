return {
  {
    'neovim/nvim-lspconfig',
    branch = 'master',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local mason = require('mason')
      local mason_lspconfig = require('mason-lspconfig')
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      -- Mason setup
      mason.setup()
      mason_lspconfig.setup({ automatic_installation = true })

      -- Define LSP servers
      local servers = {
        ts_ls = {
          settings = { implicitProjectConfiguration = { checkJs = true } },
        },
        typos_lsp = {},
        glsl_analyzer = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            },
          },
        },
        rust_analyzer = {},
        clangd = {},
      }

      -- LSP setup loop
      for server, config in pairs(servers) do
        lspconfig[server].setup({
          capabilities = cmp_nvim_lsp.default_capabilities(),
          settings = config.settings,
        })
      end

      -- Autocommand for LSP behavior
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local opts = { buffer = ev.buf, noremap = true }

          -- LSP-based key mappings
          local keymaps = {
            ['gdc'] = vim.lsp.buf.declaration,
            ['gdf'] = vim.lsp.buf.definition,
            ['<C-]>'] = vim.lsp.buf.definition,
            ['gu'] = vim.lsp.buf.hover,
            ['gy'] = vim.lsp.buf.type_definition,
            ['gn'] = vim.lsp.buf.rename,
            ['ca'] = vim.lsp.buf.code_action,
            ['gr'] = vim.lsp.buf.references,
            ['<leader>s'] = ":split | lua vim.lsp.buf.definition()<CR>",
            ['<leader>v'] = ":vsplit | lua vim.lsp.buf.definition()<CR>",
            ['<leader>.'] = "<Cmd>let save_pos = getpos('.')<CR>:tabnew %<CR>:execute 'normal! ' . save_pos[1] . 'G' . save_pos[2] . '|'<CR>:lua vim.lsp.buf.definition()<CR>",
          }

          for key, action in pairs(keymaps) do
            vim.keymap.set('n', key, action, opts)
          end

          -- Disable default formatting for ts_ls
          if client.name == 'ts_ls' then
            client.server_capabilities.documentFormattingProvider = false
            vim.keymap.set('n', '<A-f>', ':RunPrettier<CR>', opts)
          end

          -- Fix for glsl_analyzer's cancel_request issue
          if client.name == 'glsl_analyzer' then
            client.cancel_request = function() end
          end

          -- Enable inlay hints if configured
          if vim.g.lsp_enable_inlay_hints and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end

          -- Enable omnifunc for completion
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Formatting keymap
          if client.server_capabilities.documentFormattingProvider then
            vim.keymap.set('n', '<A-f>', vim.lsp.buf.format, opts)
          end
        end,
      })
    end,
  },
}

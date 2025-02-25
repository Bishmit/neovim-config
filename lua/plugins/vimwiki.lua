-- vimwiki.lua
return {
    "vimwiki/vimwiki",
    config = function()
      -- VimWiki configuration
      vim.g.vimwiki_list = {
        {
          path = '~/vimwiki/', -- Ensure this path exists
          syntax = 'markdown',
          ext = '.md'
        }
      }
    end
  }
  
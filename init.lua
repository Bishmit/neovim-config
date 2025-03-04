vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.g.have_nerd_font = true

--paste from the clipboard 
vim.api.nvim_set_option("clipboard", "unnamed")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("vim-options")
require("mappings")
require("custom-cmd")
require("mason").setup()




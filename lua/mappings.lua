-- Exit insert mode with 'jk'
vim.keymap.set('i', 'jk', '<Esc>', { desc = "Exit insert mode with 'jk'" })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to bottom window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to top window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to right window" })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = "Previous buffer" })

-- File explorer
vim.keymap.set('n', '<leader>fe', ':Oil<CR>', { desc = "Open file explorer" })

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = "Increase window height" })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = "Decrease window height" })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = "Decrease window width" })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Increase window width" })

-- Get project name from folder and use it as executable name
vim.keymap.set("n", "<leader>cb", ":!mkdir -p build && cd build && cmake .. && make<CR>", { desc = "Build CMake project" })
vim.keymap.set("n", "<leader>cr", ":!./build/$(basename $(pwd))<CR>", { desc = "Run CMake project" })


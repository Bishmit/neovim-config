-- Indentation settings
vim.o.expandtab = true  -- Use spaces
vim.o.tabstop = 4        -- Tab width
vim.o.softtabstop = 4    -- Edit tab width
vim.o.shiftwidth = 4      -- Indent width

-- Line numbering
vim.o.number = true       -- Show line numbers
vim.o.relativenumber = true  -- Absolute numbers

-- Miscellaneous settings
vim.o.list = false        -- Hide list chars
vim.o.laststatus = 3      -- Always show status
vim.o.autoread = true     -- Auto-read files
vim.o.termguicolors = true -- Enable true colors
vim.o.mouse = "a"        -- Mouse support
vim.o.showmode = false    -- Hide mode

-- Clipboard setting
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"  -- System clipboard
end)

-- Readability settings
vim.o.breakindent = true  -- Break indent
vim.o.undofile = true      -- Persistent undo
vim.o.ignorecase = true    -- Ignore case
vim.o.smartcase = true     -- Smart case
vim.o.signcolumn = "yes"   -- Sign column
vim.o.updatetime = 250      -- Update time
vim.o.timeoutlen = 300      -- Timeout length
vim.o.splitright = true     -- Right splits
vim.o.splitbelow = true     -- Below splits

-- List characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } 

-- Incremental command feedback
vim.o.inccommand = "split"  -- Show command results

-- Cursor line highlight
vim.wo.cursorline = true    -- Highlight line

-- Scroll offset
vim.o.scrolloff = 10        -- Scroll offset

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights

-- Window separator color
vim.cmd([[highlight WinSeparator guifg=#65ADDC]]) -- Separator color

-- Popup menu height
vim.o.pumheight = 15       -- Popup height

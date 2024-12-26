-- Set highlight on search
vim.o.hlsearch = true
vim.o.showmode = false -- don't show what mode, this will let lualine do it for you

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Disable mouse mode
vim.o.mouse = ''
vim.o.swapfile = false

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
vim.o.wrap = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 100

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.inccommand = 'split'
vim.o.splitright = true -- Vertical split to the right
vim.o.splitbelow = true -- Horizontal split to the bottom

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.colorcolumn = '80'

-- similar to 'scrolloff', but horizontal. allows for character padding around cursor.
vim.o.sidescrolloff = 40
vim.o.cursorline = true

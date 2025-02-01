-- show file title
vim.opt.title = true

-- highlighting and terminal colors
vim.opt.syntax = 'on'
vim.opt.hlsearch = true
vim.opt.termguicolors = true

-- cursor line/column lines
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- don't show mode
vim.opt.showmode = false

-- no backup and swap files
vim.opt.backup = false
vim.opt.swapfile = false

-- clipboard and mouse integration
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- show numbers & sign column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- don't wrap lines
vim.opt.wrap = false

-- default utf-8
vim.opt.fileencoding = "utf-8"

-- change <Tab> to <Space>, etc.
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- indentation
vim.opt.smartindent = true
vim.opt.shiftround = true

-- minimal screen line/columns aroud cursor
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- case-insensitive search UNLESS one or more capital letter in search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- how new splits should be opened
vim.opt.splitbelow = true
vim.opt.splitright = true

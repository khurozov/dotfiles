---------------------
-- S E T T I N G S --
---------------------

-- show file title
vim.opt.title = true

-- highlighting and terminal colors
vim.opt.syntax = 'on'
vim.opt.hlsearch = true
vim.opt.termguicolors = true

-- cursor line/column lines
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- don't show mode and cmd
vim.opt.showmode = false
vim.opt.showcmd = false

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

-- save last position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("LastPosition", {}),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-------------------
-- K E Y M A P S --
-------------------

vim.g.mapleader = " "

-- clear searching higlights on pressing <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- center screen after search
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- spitting windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>")
vim.keymap.set("n", "<leader>wh", ":split<cr>")

-- save
vim.keymap.set({"n", "i"}, "<C-s>", "<cmd>w<cr>")

-- windows-1251 encoding for russian characters
vim.keymap.set("n", "<F8>", ":e ++enc=cp1251<CR>")

-------------------
-- P L U G I N S --
-------------------

-- init lazy
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

-- setup lazy
require("lazy").setup({
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local t = require('tokyonight')
            t.setup({
                style = 'night',
                transparent = true,
            })
            t.load()
        end,
    },
    {
        'vimwiki/vimwiki',
        init = function()
            vim.g.vimwiki_list = {{path = '~/.local/share/notes', auto_diary_index = 1, syntax = 'markdown', ext = '.md'}}
        end
    },
})

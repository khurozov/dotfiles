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

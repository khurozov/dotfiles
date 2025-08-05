vim.g.mapleader = " "

-- clear searching higlights on pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

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

-- insert datetime
vim.keymap.set({"n", "i"}, "<C-S-D>",  function()
    local date = os.date("%Y-%m-%d %H:%M")
    local current_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local new_line = line:sub(1, current_pos[2]) .. date .. line:sub(current_pos[2] + 1)
    vim.api.nvim_set_current_line(new_line)
    vim.api.nvim_win_set_cursor(0, {current_pos[1], current_pos[2] + #date})
end, { noremap = true, silent = true })

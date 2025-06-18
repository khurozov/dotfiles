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

-- add new entry with datetime (notes specific)
vim.keymap.set("n", "<Leader>n", function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local notEmpty = vim.fn.getline(row) ~= ""
    local lines = {"----", os.date("%Y-%m-%d %H:%M"), ""}
    local from = row;
    local to = row
    local x = 0
    if row == 1 then
        from = 0
        if notEmpty then
            to = 0
            table.insert(lines, "")
            x = -1
        else
            to = 0
        end
    elseif notEmpty then
        table.insert(lines, 1, "")
    end

    
    vim.api.nvim_buf_set_lines(0, from, to, false, lines)
    vim.api.nvim_win_set_cursor(0, {from + #lines + x, 0})
    vim.cmd('startinsert')
end, { noremap = true, silent = true })

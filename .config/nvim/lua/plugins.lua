-- setup lazy
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

-- plugins
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
            vim.g.vimwiki_list = {
                {name = 'private', path = '~/.local/share/notes/private', auto_diary_index = 1, syntax = 'markdown', ext = '.md'},
                {name = 'work', path = '~/.local/share/notes/work', auto_diary_index = 1}
            }
        end
    },
    {
        "lmburns/lf.nvim",
        keys = {
            { "<leader>e", "<cmd>Lf<cr>", desc = "lf file explorer"},
        },
        config = function()
            -- This feature will not work if the plugin is lazy-loaded
            vim.g.lf_netrw = 1

            require("lf").setup({
                escape_quit = false,
                border = "rounded",
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "LfTermEnter",
                callback = function(a)
                    vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", {nowait = true})
                end,
            })
        end,
        dependencies = {
            "akinsho/toggleterm.nvim"
        },
    },
})

require("metensis.set")
require("metensis.packer")
-- require("metensis.neogit")


local autocmd = vim.api.nvim_crete_autocmd
local augroup = vim.api.nvim_crete_augroup
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*', 
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

--[[
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
]]

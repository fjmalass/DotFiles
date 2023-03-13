local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight when yanking
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

-- print("remove trailing spaces")
local RhyptGroup = augroup('Rhypt', {})
autocmd({"BufWritePre"}, {
    group = RhyptGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


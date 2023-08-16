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
local rhypt_group = augroup('Rhypt', {})
autocmd({ "BufWritePre" }, {
    group = rhypt_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- added slint
autocmd({ "BufNewFile, BufRead" }, {
    group = rhypt_group,
    pattern = "*.slint",
    command = [[setlocal filetype=slint]],
})

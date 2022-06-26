local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

MetensisGroup = augroup('Metensis', {})

require("metensis.set")
require("metensis.packer")
require("metensis.neogit")
require("metensis.kommentary")


local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = MetensisGroup,
    pattern = "*.py",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = MetensisGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

require("metensis.debugger")

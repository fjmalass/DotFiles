vim.g.mapleader = " "
 
vim.opt.guicursor=""
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth =  4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")

vim.opt.cmdheight = 1
-- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("c")
-- default is 4000 that causes noptticeable delayes
vim.opt.updatetime = 50


vim.keymap.set("n", "<leader>pv", ":Ex<cr>")

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "<leader>Y", "+Y", { remap = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("v", "<leader>p", "\"_dP")

-- resize
vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<leader>rp", "<cmd>resize 100<cr>")
-- replace
vim.keymap.set("n", "<leader>s", "<cmd>%s/vim.fn.expand('<cword>')/<cr>")
-- ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>
-- remove nohl
vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>")

-- go 
vim.keymap.set("n", "<leader>ee", "oif err != nil{<cr>return nit, err<cr>}<cr><esc>kkI<esc>")

-- next greatest remap ever  asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move command in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- move command in insert mode
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi")


-- easier moving between splits
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- sizing window
vim.keymap.set("n", "<C-,>", "<C-W><")
vim.keymap.set("n", "<C-.>", "<C-W>>")
vim.keymap.set("n", "<M-,>", "<C-W>5<")
vim.keymap.set("n", "<M-.>", "<C-W>5>")

vim.keymap.set("n", "J", "mzJ`z")
-- move and key cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep hightlight in paste buffer
-- vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("x", "<leader>p", [["_dP]])

-- put in clipboard for CtrlV
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- sent ot void buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- change working directory for all
vim.keymap.set("n", "<leader>dc", "<cmd>window lcd<CR>")

-- formatters
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


--replace word under cursor and edit globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- source current file
vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>")

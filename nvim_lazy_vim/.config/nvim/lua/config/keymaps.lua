local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- Directory NvimTree
keymap.set("n", "<leader>F", "<cmd>NvimTreeFocus<CR>", opt) -- Next buffer
keymap.set("n", "<leader>m", "<cmd>NvimTreeToggle<CR>", opt) -- Next buffer

-- Buffer Navigation
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", opt) -- Next buffer
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", opt) -- Prev buffer
keymap.set("n", "<leader>bb", "<cmd>e #<CR>", opt) -- Switch to Other Buffer
keymap.set("n", "<leader>`", "<cmd>e #<CR>", opt) -- Switch to Other Buffer

-- Pane and Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opt) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opt) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opt) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opt) -- Navigate Right
-- quicklist and recenter
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- location list and recenter
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Reminder, close others <C-w>o, close current <C-w>c
keymap.set("n", "<C-w>M", "<C-w>| <C-w>_", opt) -- Maximize current window (undo): C-w=
keymap.set("n", "<C-w>m", "<C-w>=", opt) -- Maximize current window (undo): C-w=
--
-- Tmux
keymap.set("t", "<C-h>", "wincmd h", opt) -- Navigate Left
keymap.set("t", "<C-j>", "wincmd j", opt) -- Navigate Down
keymap.set("t", "<C-k>", "wincmd k", opt) -- Navigate Up
keymap.set("t", "<C-l>", "wincmd l", opt) -- Navigate Right
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft", opt) -- Navigate Left
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown", opt) -- Navigate Down
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp", opt) -- Navigate Up
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight", opt) -- Navigate Right
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--Window Management
keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", opt) -- Split Vertically
keymap.set("n", "<leader>sh", "<cmd>split<cr>", opt) -- Split Horizontally
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opt)
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opt)
keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>", opt)
keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>", opt)

--Show Full File-Path
keymap.set("n", "<leader>pa", "<cmd>echo expand('%:p')<cr>", opt) -- Show Full File Path

--Notes
keymap.set("n", "<leader>ng", "<cmd>Neorg workspace general<cr>", opt)
keymap.set("n", "<leader>nw", "<cmd>Neorg workspace work<cr>", opt)
keymap.set("n", "<leader>ny", "<cmd>Neorg workspace youtube<cr>", opt)

-- Indenting
keymap.set("v", "<", "<gv", opt)
keymap.set("v", ">", ">gv", opt)

-- based on ThePrimeagen
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join and say in same location
keymap.set("n", "J", "mzJ`z")
-- move 1/2 a screen and keep centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv") -- next word and unwrap if needed
keymap.set("n", "N", "Nzzzv") -- previous word and unwrap if needed

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- paste to clipboard
keymap.set("n", "<leader>Y", [["+Y]]) -- paste to clipboard

keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without affecting registers

keymap.set("n", "<leader>f", vim.lsp.buf.format) -- format buffer (useless as we have a format when saving)

keymap.set("n", "<leader>s", [[:%s/\(<C-r><C-w>\)/<C-r><C-w>/gI<Left><Left><Left>]]) -- create a replace of word under cursor to allow using \0
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

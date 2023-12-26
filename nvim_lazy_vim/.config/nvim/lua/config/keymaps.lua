local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- Directory NvimTree
keymap.set("n", "<leader>f", "<cmd>NvimTreeFocus<CR>", opt) -- Next buffer
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
keymap.set("n", "<C-w>M", "<C-w>| <C-w>_", opt) -- Maximize current window (undo): C-w=
keymap.set("n", "<C-w>m", "<C-w>=", opt) -- Maximize current window (undo): C-w=
-- Reminder, close others <C-w>o, close current <C-w>c

-- Tmux
-- mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
-- mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
-- mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
-- mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
-- keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft", opt) -- Navigate Left
-- keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown", opt) -- Navigate Down
-- keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp", opt) -- Navigate Up
-- keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight", opt) -- Navigate Right

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
vim.keymap.set("v", "<", "<gv", opt)
vim.keymap.set("v", ">", ">gv", opt)

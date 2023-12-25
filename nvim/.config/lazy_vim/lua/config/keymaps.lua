local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate right

-- Indenting (not loosing the selection)
keymap.set("v", ">", ">gv", opts) -- Shift right
keymap.set("v", "<", "<gv", opts) -- Shift left

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split vertical
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split horizontal
keymap.set("n", "<leader>sm", "<C-w>o", opts) -- Close others
keymap.set("n", "<leader>sH", ":hide<CR>", opts) -- Close current


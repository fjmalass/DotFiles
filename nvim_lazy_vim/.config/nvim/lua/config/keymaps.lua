local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- Directory NvimTree
keymap.set("n", "<leader>m", "<cmd>NvimTreeFocus<CR>", opt)
keymap.set("n", "<leader>m", "<cmd>NvimTreeToggle<CR>", opt)


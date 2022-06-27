
-- noremap is set to true by default
local opts = { silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader><space>", "<cmd>nohlsearch<cr>", opts)
-- replace
keymap("n", "<leader>s", "<cmd>%s/vim.fn.expand('<cword>')/<cr>")

keymap("n", "Y", "yg$", opts)
keymap("n", "<leader>Y", "+Y", { remap = true })
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>fT", "<cmd>Telescope live_grep default_text = nvim.fn.expand('<cWord>')<cr>", opts) -- how do you do that?
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

-- Alpha
keymap("n", "<C-;>", "<cmd>Alpha<cr>", opts)

-- Alpha
keymap("n", "<C-;>", "<cmd>Alpha<cr>", opts)

-- LSP
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap("n", "<leader>ld", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>lF", "<cmd>LspToggleAutoFormat<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)

keymap("n", "<leader>lo", "<cmd>SymbolsOutline<CR>", opts)
keymap("n", "<leader>lg", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

-- Lazygit
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)



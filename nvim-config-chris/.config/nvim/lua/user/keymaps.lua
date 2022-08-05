-- noremap is set to true by default
local opts = { silent = true }

local term_opts = { silent = true }

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
--
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Tabs --
--[[
keymap("n", "<C-t>", ":tabnew %<cr>", opts)
keymap("n", "<C-y>", ":tabclose<cr>", opts)
keymap("n", "<C-\\>", ":tabonly<cr>", opts)
--]]

-- recenter
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "Y", "yg$", opts)
keymap("n", "<leader>Y", "+Y", {remap = true})

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>k", "<cmd>lnext<cr>zz")
keymap("n", "<leader>j", "<cmd>lprev<cr>zz")

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
-- keymap("v", "J" ":mover '>+1<CR>gv=gv")
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("v", "K" ":m '<-2<CR>gv=gv")
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Misc 
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- next greatest remap ever  asbjornHaland
keymap("x", "<leader>p", '"_dP')
keymap("v", "<leader>p", '"_dP')
keymap("n", "<leader>d", '"_d')
keymap("v", "<leader>d", '"_d')
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')

-- recenter
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
-- join but better
keymap("n", "J", "mzJ`z")

keymap("n", "<leader><space>", "<cmd>nohlsearch<cr>", opts)

keymap("n", "Y", "yg$", opts)
keymap("n", "<leader>Y", "+Y", { remap = true })
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":lua require('telescope.builtin').git_files()<CR>")
keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ts", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
-- keymap("n", "<Leader>tf", ":lua require('telescope.builtin').find_files()<CR>") -- alternative to above

-- keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>")
keymap("n", "<leader>tb", ":lua require('telescope.builtin').buffers()<CR>")
keymap("n", "<leader>vh", ":lua require('telescope.builtin').help_tags()<CR>")
-- keymap("n", "<leader>trc", ":lua require('theprimeagen.telescope').search_dotfiles({ hidden = true })<CR>")
-- keymap("n", "<leader>va", ":lua require('theprimeagen.telescope').anime_selector()<CR>")
-- keymap("n", "<leader>tc", ":lua require('theprimeagen.telescope').chat_selector()<CR>")
-- keymap("n", "<leader>td", ":lua require('theprimeagen.telescope').dev()<CR>")
-- keymap("n", "<leader>tc", ":lua require('theprimeagen.telescope').git_branches()<CR>")
keymap("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
keymap("n", "<leader>gm", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
-- keymap( "n", "<leader>tT", ":lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword >')})<CR>")
-- keymap( "n", "<leader>tT", ":lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword >')})<CR>")
-- keymap("n", "<leader>tp", "<cmd>Telescope projects<cr>", opts)
-- keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", opts)

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

-- harpoon
keymap("n", "<leader>a", function() require("harpoon.mark").add_file() end, opts)
keymap("n", "<c-e>", function() require("harpoon.ui").toggle_quick_menu() end, opts)
keymap("n", "<leader>tc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, opts)

keymap("n", "<c-h>", function() require("harpoon.ui").nav_file(1) end, opts)
keymap("n", "<c-t>", function() require("harpoon.ui").nav_file(2) end, opts)
keymap("n", "<c-n>", function() require("harpoon.ui").nav_file(3) end, opts)
keymap("n", "<c-s>", function() require("harpoon.ui").nav_file(4) end, opts)

-- DAP
local dap = require("dap")
keymap("n", "<home>", function() dap.toggle(1) end, opts)
keymap("n", "<end>", function() dap.toggle(2) end, opts)
keymap("n", "<up>", function() dap.continue() end, opts)
keymap("n", "<down>", function() dap.step_over() end, opts)
keymap("n", "<right>", function() dap.step_into() end, opts)
keymap("n", "<left>", function() dap.step_out() end, opts)
keymap("n", "<leader>b", function() dap.toggle_breakpoint() end, opts)
keymap("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
keymap("n", "<leader>rc", function() dap.run_to_cursor() end, opts)
keymap("n", "<leader>rr", "<cmd>DapToggleRepl<cr>", opts)

-- dapui
local dapui = require("dapui")
keymap("n", "<leader>5", function() dapui.open(1) end, opts)
keymap("n", "<leader>6", function() dapui.close() end, opts)
keymap("n", "<leader>v", function() dapui.eval() end, opts)

-- hop
keymap("", "<leader>s", "HopWordCurrentLine<cr>", opts)
keymap("", "<leader>S", "HopChar2<cr>", opts)

keymap("o", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", opts)
keymap("o", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", opts )
keymap("o", "t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
keymap("o", "T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- markdown 
keymap("n", "<leader>pp", "<cmd>MarkdownPreview<cr>", opts)
keymap("n", "<leader>ps", "<cmd>MarkdownPreviewStop<cr>", opts)
keymap("n", "<leader>pt", "<cmd>MarkdownPreviewToggle<cr>", opts)

-- alpha (start up)
keymap("n", "<leader>;", "<cmd>Alpha<cr>")

-- Highlighting
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "<C-S>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)

-- alt binds
keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)

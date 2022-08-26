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
keymap("n", "<C-t>", "<CMD>tabnew %<cr>", opts)
keymap("n", "<C-y>", "<CMD>tabclose<cr>", opts)
keymap("n", "<C-\\>", "<CMD>tabonly<cr>", opts)
--]]

-- recenter
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "Y", "yg$", opts)
keymap("n", "<leader>Y", "+Y", {remap = true})

-- Resize with arrows
keymap("n", "<C-Up>", "<CMD>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-h>", "<CMD>bprevious<CR>", opts)
keymap("n", "<leader>k", "<CMD>lnext<cr>zz")
keymap("n", "<leader>j", "<CMD>lprev<cr>zz")

-- Move text up and down
keymap("n", "<A-j>", "<ESC><CMD>m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<ESC><CMD>m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", "<CMD>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<CMD>m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("v", "J" "<CMD>move '>+1<CR>gv=gv")
keymap("x", "J", "<CMD>move '>+1<CR>gv-gv", opts)
-- keymap("v", "K" "<CMD>m '<-2<CR>gv=gv")
keymap("x", "K", "<CMD>move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", "<CMD>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<CMD>move '<-2<CR>gv-gv", opts)

-- Misc
keymap("n", "<leader>c", "<CMD>Bdelete!<CR>", opts)

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

keymap("n", "<leader><space>", "<CMD>nohlsearch<cr>", opts)

keymap("n", "Y", "yg$", opts)
keymap("n", "<leader>Y", "+Y", { remap = true })
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- NvimTree
keymap("n", "<leader>e", "<CMD>NvimTreeToggle<cr>", opts)

-- Telescope
local telescopebuiltin_ok, _ = pcall(require, "telescope.builtin")
local telescope_ok, _ = pcall(require, "telescope")
if telescopebuiltin_ok and telescope_ok then
  keymap("n", "<C-p>", "<CMD>lua require('telescope.builtin').git_files()<CR>")
  keymap("n", "<leader>tf", "<CMD>Telescope find_files<cr>", opts)
  keymap("n", "<leader>ts", "<CMD>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
  -- keymap("n", "<Leader>tf", "<CMD>lua require('telescope.builtin').find_files()<CR>") -- alternative to above

  -- keymap("n", "<leader>ft", "<CMD>Telescope live_grep<cr>", opts)
  keymap("n", "<leader>tw", "<CMD>lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>")
  keymap("n", "<leader>tb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
  keymap("n", "<leader>vh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
  -- keymap("n", "<leader>trc", "<CMD>lua require('theprimeagen.telescope').search_dotfiles({ hidden = true })<CR>")
  -- keymap("n", "<leader>va", "<CMD>lua require('theprimeagen.telescope').anime_selector()<CR>")
  -- keymap("n", "<leader>tc", "<CMD>lua require('theprimeagen.telescope').chat_selector()<CR>")
  -- keymap("n", "<leader>td", "<CMD>lua require('theprimeagen.telescope').dev()<CR>")
  -- keymap("n", "<leader>tc", "<CMD>lua require('theprimeagen.telescope').git_branches()<CR>")
  keymap("n", "<leader>gw", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
  keymap("n", "<leader>gm", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
  keymap( "n", "<leader>tT", "<CMD>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword >')})<CR>")
  -- keymap( "n", "<leader>tT", "<CMD>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword >')})<CR>")
  -- keymap("n", "<leader>tp", "<CMD>Telescope projects<cr>", opts)
  -- keymap("n", "<leader>tb", "<CMD>Telescope buffers<cr>", opts)
  -- print("'telescope' keymaps installed")
else
  print("'telescope' plugin not installed, skipping keymaps")
end

-- Alpha
local alpha_ok, _ = pcall(require, "user.alpha")
if alpha_ok then
  keymap("n", "<leader>;", "<CMD>Alpha<cr>")
  -- print("'alpha' keymaps installed")
else
  print("'alpha' plugin not installed, skipping keymaps")
end


-- LSP
keymap("n", "<leader>lf", "<CMD>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "<leader>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap("n", "<leader>ld", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "<leader>lF", "<CMD>LspToggleAutoFormat<CR>", opts)
keymap("n", "<leader>li", "<CMD>LspInfo<CR>", opts)
keymap("n", "<leader>lI", "<CMD>LspInstallInfo<CR>", opts)
keymap("n", "<leader>lj", "<CMD>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
keymap("n", "<leader>lk", "<CMD>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
keymap("n", "<leader>ll", "<CMD>lua vim.lsp.codelens.run()<CR>", opts)

keymap("n", "<leader>lo", "<CMD>SymbolsOutline<CR>", opts)
keymap("n", "<leader>lg", "<CMD>lua vim.lsp.codelens.run()<CR>", opts)
keymap("n", "<leader>lr", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>lS", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

-- Lazygit
keymap("n", "<leader>gg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- harpoon
local harpoon_ok, _ = pcall(require, "harpoon.ui")
if harpoon_ok then
  keymap("n", "<leader>a", function() require("harpoon.mark").add_file() end, opts)
  keymap("n", "<c-e>", function() require("harpoon.ui").toggle_quick_menu() end, opts)
  keymap("n", "<leader>tc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, opts)

  keymap("n", "<c-h>", function() require("harpoon.ui").nav_file(1) end, opts)
  keymap("n", "<c-t>", function() require("harpoon.ui").nav_file(2) end, opts)
  keymap("n", "<c-n>", function() require("harpoon.ui").nav_file(3) end, opts)
  keymap("n", "<c-s>", function() require("harpoon.ui").nav_file(4) end, opts)
  -- print("'harpoon' keymaps installed")
else
  print("'harpoon' plugin not installed, skipping keymaps")
end

-- DAP
local dap_ok, dap = pcall(require, "dap")
if dap_ok then
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
  -- print("'dap' keymaps installed")
else
  print("'dap' plugin not installed, skipping keymaps ")
end

-- dapui
local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
  keymap("n", "<leader>5", function() dapui.open(1) end, opts)
  keymap("n", "<leader>6", function() dapui.close() end, opts)
  keymap("n", "<leader>v", function() dapui.eval() end, opts)
  -- print("'dapui' keymaps installed")
else
  print("'dapui' plugin not installed, skipping keymaps")
end

-- hop
local hop_ok, hop = pcall(require, "hop")
local userhop_ok, _ = pcall(require, "user.hop")
if hop_ok and userhop_ok then
  keymap("", "<leader>s", "<CMD>HopWordCurrentLine<cr>", opts)
  keymap("", "<leader>h", "<CMD>HopChar2<cr>", { silent = true })
  -- keymap("", "<leader>l", "<CMD>HopWordCurrentLine<cr>", { silent = true })
  -- keymap("", "<leader>S", "<CMD>HopChar2<cr>", opts)
  -- keymap("", "S", "<CMD>HopChar2<cr>", { silent = true })
  -- keymap("", "Q", "<CMD>HopPattern<cr>", { silent = true })
  -- keymap("", "h", "<CMD>HopChar2<cr>", { silent = true })
-- keymap("", "Q", "<CMD>HopPattern<cr>", { silent = true })

  keymap("o", "f", function() hop.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true }) end, opts)
  keymap("o", "F", function() hop.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true }) end, opts )
  keymap("o", "t", function() hop.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {})
  keymap("o", "T", function() hop.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, {})


  keymap("n", "f", "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
  keymap("n", "F", "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
  keymap("n", "t", "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
  keymap("n", "T", "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)
else
    print("'hop' plugin not installeed, skipping keymaps")
end

-- markdown
local usermarkdown_ok, _ = pcall(require, "user.markdown")
if usermarkdown_ok then
  keymap("n", "<leader>pp", "<CMD>MarkdownPreview<CR>", opts)
  keymap("n", "<leader>ps", "<CMD>MarkdownPreviewStop<CR>", opts)
  keymap("n", "<leader>pt", "<CMD>MarkdownPreviewToggle<CR>", opts)
  -- print("'markdown' keymaps installed")
else
  print("'markdown' plugin not installed, skippping keymaps")
end


-- Highlighting
keymap("n", "<F7>", "<CMD>TSHighlightCapturesUnderCursor<CR>", opts)
keymap("n", "<F12>", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<C-S>", "<CMD>lua vim.lsp.buf.document_symbol()<CR>", opts)

-- alt binds
keymap("n", "<m-v>", "<CMD>lua require('lsp_lines').toggle()<CR>", opts)


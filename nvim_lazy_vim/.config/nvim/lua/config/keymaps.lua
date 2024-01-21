local keymap = vim.keymap
local opt = { noremap = true, silent = true }
local opts = function(desc)
	local l_opt = { noremap = true, silent = true }
	if desc then
		l_opt.desc = desc
	end
	return l_opt
end

-- fix use Ctlr l and ctrl h to move when editing
keymap.set("i", "<C-l>", "<Right>", opt)
keymap.set("i", "<C-h>", "<Left>", opt)

-- Directory NvimTree
keymap.set("n", "<leader>F", "<cmd>NvimTreeFocus<CR>", opt) -- Next buffer
keymap.set("n", "<leader>m", "<cmd>NvimTreeToggle<CR>", opt) -- Next buffer

-- Change to local directory
keymap.set("n", "<leader>cd", function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
end, opts("Change Current Directory"))

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
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts("Quicklist Next and Recenter"))
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts("QuickList Prev and Recenter"))

-- location list and recenter
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", opts("Next Recenter"))
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", opts("Prev recenter"))

-- Reminder, close others <C-w>o, close current <C-w>c
keymap.set("n", "<C-w>M", "<C-w>| <C-w>_", opts("Maximize Current Window")) -- Maximize current window (undo): C-w=
keymap.set("n", "<C-w>m", "<C-w>=", opts("Maximize Current Window Undo")) -- Maximize current window (undo): C-w=
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
keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", opts("Split Vertical")) -- Split Vertically
keymap.set("n", "<leader>sh", "<cmd>split<cr>", opts("Split Horizontal")) -- Split Horizontally
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opts("Resize Horizontal +2"))
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opts("Resize Horizontal -2"))
keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>", opts("Resize Vertical +2"))
keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>", opts("Resize Vertical -2"))

--Show Full File-Path
keymap.set("n", "<leader>pa", "<cmd>echo expand('%:p')<cr>", opt) -- Show Full File Path

--Notes
keymap.set("n", "<leader>ng", "<cmd>Neorg workspace general<cr>", opt)
keymap.set("n", "<leader>nw", "<cmd>Neorg workspace work<cr>", opt)
keymap.set("n", "<leader>ny", "<cmd>Neorg workspace youtube<cr>", opt)

-- Indenting
keymap.set("v", "<", "<gv", opts("Desindent and stay in indent mode")) -- stay in indent mode
keymap.set("v", ">", ">gv", opts("Indent and stay in indent mode")) -- stay in indent mode

-- based on ThePrimeagen
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts("Move down Visual"))
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts("Move up Visual"))

-- join and say in same location
keymap.set("n", "J", "mzJ`z", opts("Join and go back to same location"))
-- move 1/2 a screen and keep centered
keymap.set("n", "<C-d>", "<C-d>zz", opts("Down Recenter"))
keymap.set("n", "<C-u>", "<C-u>zz", opts("Up Recenter"))
keymap.set("n", "n", "nzzzv", opts("Next unwrap if needed")) -- next word and unwrap if needed
keymap.set("n", "N", "Nzzzv", opts("Prve unwrap if needed")) -- previous word and unwrap if needed

-- greatest remap ever will paste/yanke in/from the clipboard
keymap.set("x", "<leader>p", [[remove"_dP]], opts("Paste from clipboard")) -- paste in clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts("Yank to Clipboard")) -- yank to clipboard
keymap.set("n", "<leader>Y", [["+Y]], opts("Yank Line to Clipboard")) -- yank to clipboard

keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts("Delete without affecting registers")) -- delete without affecting registers

keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, opts("LSP: Format")) -- format buffer (useless as we have a format when saving

keymap.set("n", "<leader>s", [[:%s/\(<C-r><C-w>\)/<C-r><C-w>/gI<Left><Left><Left>]], opts("ReplaceUnderCursor")) -- create a replace of word under cursor to allow using \0
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts("Make Executable"))

keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, opts("Source file"))

keymap.set("n", "<leader>+","<C-a>", opts("Increment number"));
keymap.set("n", "<leader>-","<C-x>", opts("Decrement number"));

-- Make sure to install ripgrep
local keymap = vim.keymap
local pickers = {
	find_files = {
		-- theme = "dropdown",
		previewer = true,
		hidden = true,
	},
	live_grep = {
		-- theme = "dropdown",
		previewer = true,
	},
	buffers = {
		-- theme = "dropdown",
		previewer = true,
	},
}

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = pickers,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	})
end

local keys = function()
	local builtin = require("telescope.builtin")
	keymap.set("n", "<leader>fk", builtin.keymaps, {desc="Telescope: Keymaps"})
	keymap.set("n", "<leader>fh", builtin.help_tags, {desc="Telescope: HelpTags"})
	keymap.set("n", "<leader>ff", builtin.find_files, {desc="Telescope: FindFiles"})
	keymap.set("n", "<leader>fg", builtin.live_grep, {desc="Telescope: LiveGrep"})
	keymap.set("n", "<leader>fb", builtin.buffers, {desc="Telescope: Buffers"})
	keymap.set("n", "<leader>fG", builtin.git_files, {desc="Telescope: FindGitFiles"})
	keymap.set("n", "<leader>fa", "<cmd>Telescope <CR>", {desc="Telescope"})
end
--[[ 
	keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>"),
	keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>"),
	keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>"),
	keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>"),
	keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>"),
	keymap.set("n", "<leader>fG", "<cmd>Telescope git_files<CR>"),
	keymap.set("n", "<leader>fa", "<cmd>Telescope <CR>"),
} ]]

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = keys,
}

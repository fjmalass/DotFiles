-- Make sure to install ripgrep
local keymap = vim.keymap

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
		pickers = {
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
		},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	})
end

local keys = {
	keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>"),
	keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>"),
	keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>"),
	keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>"),
	keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>"),
	keymap.set("n", "<leader>fa", "<cmd>Telescope <CR>"),
}

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = keys,
}

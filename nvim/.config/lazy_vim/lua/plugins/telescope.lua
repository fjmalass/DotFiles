local keymap = vim.keymap
local opts = {}

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
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
    keys = {
        keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts),
        keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts),
        keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", opts),
        keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts),
        keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts),
        keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts),
        keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", opts),
    }
}

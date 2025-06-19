-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		version = "*",
		event = "VeryLazy",
		config = function()
			require("aerial").setup({
				backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
				layout = {
					max_width = { 40, 0.2 },
					width = nil,
					min_width = 10,
					placement = "window",
					resize_to_context = true,
					preserve_equality = false,
				},
				attach_mode = "window",
				close_automatic_events = {},
				keymaps = {
					["?"] = "actions.show_help",
					["<CR>"] = "actions.jump",
					["<C-v>"] = "actions.jump_vsplit",
					["<C-s>"] = "actions.jump_split",
					["q"] = "actions.close",
					["o"] = "actions.tree_toggle",
					["l"] = "actions.tree_open",
					["h"] = "actions.tree_close",
				},
				lazy_load = true,
				disable_max_lines = 10000,
				disable_max_size = 20000000,
				filter_kind = {
					"Class",
					"Constructor",
					"Function",
					"Interface",
					"Module",
					"Method",
					"Struct",
				},
				highlight_mode = "split_width",
				highlight_closest = true,
				highlight_on_hover = true,
				highlight_on_jump = 300,
				autojump = false,
				manage_folds = false,
				nerd_font = "auto",
				open_automatic = false,
				post_jump_cmd = "normal! zz",
				close_on_select = false,
				show_guides = false,
			})
		end,
		keys = {
			{ "<leader>A", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
		},
	},
}

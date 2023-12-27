local g = vim.g

g.nvim_tree_add_trailing = 1 --append a trailing slash after a directory
g.nvim_tree_git_hl = 1
g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		deleted = "",
		ignored = "◌",
		renamed = "➜",
		staged = "✓",
		unmerged = "",
		unstaged = "✗",
		untracked = "★",
	},
	folder = {
		default = "",
		empty = "",
		empty_open = "",
		open = "",
		symlink = "",
		symlink_open = "",
	},
}

-- specific key mapping
--
local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up Parent"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("help"))
end
return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	on_attach = on_attach,
	config = function()
        -- transparent lua
        vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
		require("nvim-tree").setup({
    filters = {
			dotfiles = false,
		},
		hijack_netrw = true,
		disable_netrw = true,
		open_on_tab = false,
		hijack_cursor = true,
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		view = default_ui,
		git = {
			ignore = false,
		},
        })
    end,
}

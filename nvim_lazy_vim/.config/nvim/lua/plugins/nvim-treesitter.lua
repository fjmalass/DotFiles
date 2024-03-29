local ensure_installed = {
	"markdown",
	"json",
	"markdown",
	"markdown_inline",
	"json",
	"javascript",
	"typescript",
	"html",
	"css",
	"csv",
	"bash",
	"lua",
	"luadoc",
	"dockerfile",
	"gitignore",
	"python",
	"cpp",
	-- "glsl",
	-- "hlsl",
	"cmake",
	"vim",
	"vimdoc",
	"latex",
	"bibtex",
	"c_sharp",
	"gitcommit",
	"git_config",
	"git_rebase",
	"gitattributes",
	"go",
	"rust",
	"toml",
	"julia",
	-- "wsgl",
	-- "wsgl_bevy",
}

--  WIP
-- local textobjects = {
-- 	lsp_interop = {
-- 		enable = true,
-- 		floating_preview_opts = {},
-- 		peek_definition_code = {
-- 			["<leader>df"] = "@function.outer",
-- 			["<leader>dF"] = "@class.outer",
-- 		},
-- 	},
-- }

local config = function()
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = ensure_installed,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlight = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				scope_decremental = "<bs>",
			},
		},
	})
	-- require("ts_context_commentstring").setup({}) -- check josean-dev
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" }, -- lazy
	-- lazy = false,
	config = config,
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
}

local config = function()
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"markdown",
			"json",
			"javascript",
			"typescript",
			"html",
			"css",
            "c",
            "c_sharp",
            "cmake",
            "make",
            "csv",
            "lua",
            "doxygen",
			"markdown",
			"bash",
			"lua",
			"luadoc",
			"dockerfile",
			"solidity",
			"gitignore",
			"python",
            "rust",
            "slint",
            "gitignore",
            "gitcommit",
            "hlsl",
            "latex",
            "bibtex",
            "nix",
            "toml",
            "cpp",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
}

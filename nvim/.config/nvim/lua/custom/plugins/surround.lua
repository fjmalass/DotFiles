return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}

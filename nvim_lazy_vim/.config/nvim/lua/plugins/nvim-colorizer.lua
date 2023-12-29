return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			filetypes = {
				"css",
				"javascript",
				html = { mode = "background" },
			},
			user_default_options = { mode = "background" },
		})
	end,
    lazy = false,
}

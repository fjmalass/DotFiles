-- make sure to have installed :TSInstall markdown markdow_inline
return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			-- keybinds
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			-- use enter to open file with finder
			finder_action_keys = {
				open = "<CR>",
			},
		})
	end,
}

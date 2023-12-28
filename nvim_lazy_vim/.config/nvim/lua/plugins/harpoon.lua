local config = function()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: add file" })
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Harpoon: QuickMenu"})

	vim.keymap.set("n", "<C-1>", function()
		ui.nav_file(1)
	end, { desc = "Harpoon: Nav File 1" })
	vim.keymap.set("n", "<C-2>", function()
		ui.nav_file(2)
	end, { desc = "Harpoon: Nav File 2" })
	vim.keymap.set("n", "<C-3>", function()
		ui.nav_file(3)
	end, { desc = "Harpoon: Nav File 3" })
	vim.keymap.set("n", "<C-4>", function()
		ui.nav_file(4)
	end, { desc = "Harpoon: Nav File 4" })
end

return {
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}

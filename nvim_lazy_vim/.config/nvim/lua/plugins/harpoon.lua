local config = function()
	local harpoon = require("harpoon")

	vim.keymap.set("n", "<leader>a", function()
		harpoon:list():append()
	end, { desc = "Harpoon: append" })
	vim.keymap.set("n", "<C-e>", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "Harpoon: QuickMenu" })

	-- Direct access
	vim.keymap.set("n", "<leader>1", function()
		harpoon:list():select(1)
	end, { desc = "Harpoon: 1st mark" })
	vim.keymap.set("n", "<leader>2", function()
		harpoon:list():select(2)
	end, { desc = "Harpoon: 2nd mark" })
	vim.keymap.set("n", "<leader>3", function()
		harpoon:list():select(3)
	end, { desc = "Harpoon: 3rd mark" })
	vim.keymap.set("n", "<leader>4", function()
		harpoon:list():select(4)
	end, { desc = "Harpoon: 4th mark" })
	-- Next previous
	vim.keymap.set("n", "<C-S-k>", function()
		harpoon:list():prev()
	end, { desc = "Harpoon: Prev" })
	vim.keymap.set("n", "<C-S-j>", function()
		harpoon:list():next()
	end, { desc = "Harpoon: Next" })
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2", -- will be merge into main > April 2024
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = config,
}

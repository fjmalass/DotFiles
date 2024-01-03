local keys = function()
	local trouble = require("trouble")
	vim.keymap.set("n", "<leader>tt", trouble.toggle, { desc = "Trouble: Toggle" })
	vim.keymap.set("n", "<leader>tn", function()
		trouble.next({ skip_groups = true, jump = true })
	end, { desc = "Trouble: Next" })
	vim.keymap.set("n", "<leader>tp", function()
		trouble.previous({ skip_groups = true, jump = true })
	end, { desc = "Trouble: Prev" })
end

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = keys,
	lazy = false,
}

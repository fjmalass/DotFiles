return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local treesitter_context = require("treesitter-context")
		treesitter_context.setup({
			enable = true,
			throttle = true,
			max_lines = 0, -- no limit
			pattern = {
				default = { "class", "function", "method" },
			},
		})
		vim.keymap.set("n", "[c", function()
			treesitter_context.go_to_context(vim.v.count1)
		end, { silent = true, desc = "Go to []c]ontext" })
	end,
}

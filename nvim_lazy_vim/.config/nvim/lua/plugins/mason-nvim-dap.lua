local ensured_installed = {
	"stylua", -- lua
	-- "cppdbg", --cpptools
	"codelldg", -- codelldb can be ussed for cpp, c, and rust
	"python",
	"delve", -- go
}

local handlers = {}

return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensured_installed = ensured_installed,
			handlers = handlers,
		})
	end,
}

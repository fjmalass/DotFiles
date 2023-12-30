-- make sure to install debugpy
-- add test to key mappings
local dap_python_mappings = function()
	local opts = { silent = true }
	-- debug python run
	vim.keymap.set("n", "<leader>dpr", "<cmd>lua require('nvim-dap-python').test_method()<CR>", opts)
end

-- key mappings generic + python
local dap_mappings = function()
	-- use all the default keybings
	require("nvim-dap").dap_mappings()
	dap_python_mappings()
end

local config = function()
	local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	require("dap-python").setup(path)
	require("nvim-dap-ui").dap_mappings()
	dap_mappings()
end

return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = config,
}

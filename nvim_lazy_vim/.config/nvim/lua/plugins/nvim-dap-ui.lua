-- set up keymaps and launch dapui
local dap_keymaps = function()
	local dap, dapui = require("dap"), require("dapui")

	vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", opts)
	vim.keymap.set("n", "<leader>di", "<cmd>lua require'dapui'.widgets.hover()<cr>", opts)
	-- dapui.float_element(<element ID>, <optional settings>)
	-- elementID breakpoints repl console watches stacks scopes
	dapui.setup()
	-- auto open dapui
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	event = "VeryLazy",
	config = function()
        dap_keymaps()
    end,
}

-- vnoremap <M-k> <Cmd>lua require("dapui").eval()<CR>

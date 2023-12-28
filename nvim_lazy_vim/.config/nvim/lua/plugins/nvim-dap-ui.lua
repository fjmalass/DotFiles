return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
}

-- vnoremap <M-k> <Cmd>lua require("dapui").eval()<CR>
-- local dap, dapui = require("dap"), require("dapui")
-- dapui.float_element(<element ID>, <optional settings>)
-- elementID breakpoints repl console watches stacks scopes
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

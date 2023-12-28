local on_attach = function()
	vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", opts)
	vim.keymap.set("n", "<leader>di", "<cmd>lua require'dapui'.widgets.hover()<cr>", opts)
end
return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
    on_attach = on_attach,
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

local M = {}
local buf_opts = { buffer = bufnr, silent = true }
--Assign keymaps
M.on_attach = function(client, bufnr)
	local opt = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap
	-- keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
	keymap.set("n", "gD", "<cmd>Lspsaga finder<CR>", opt)
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt)
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opt)
	keymap.set("n", "gP", "<cmd>Lspsaga preview_definition<CR>", opt)
	-- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opt)
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opt)
	keymap.set("n", "gO", "<cmd>Lspsaga outline<CR>", opt)
	keymap.set("n", "gI", "<cmd>Lspsaga finder imp<CR>", opt)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostic<CR>", opt)
	keymap.set("n", "gc", "<cmd>Lspsaga show_cursor_diagnostic<CR>", opt)
	-- keymap.set("n", "<leader>e", vim.diagnostic.open_float, opt)
	keymap.set("n", "<leader>e", "<cmd>Lspsage show_workspace_diagnostic ++float", opt)
	keymap.set("n", "<leader>E", "<cmd>Lspsage show_workspace_diagnostic ++normal", opt)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
	keymap.set("n", "[E", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt) -- need to create function to go to error
	keymap.set("n", "]E", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt) -- need to create function to go to error
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opt)
	keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opt)

	-- debug (should  install with dap )
	keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opt) -- toggle breakpoint
	keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opt) -- continue/debug
	if client.name == "pyright" then
		keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opt)
		-- debug should we put that in dap
		keymap.set("n", "<leader>dt", "<cmd>lua require('dap-python').test_method()<CR>", opt) -- run tests
	end
end

return M

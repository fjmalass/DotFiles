local M = {}

--Assign keymaps
M.on_attach = function(client, bufnr)
	local opt = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opt)
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration<CR>", opt)
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
	keymap.set("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opt)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opt)
	keymap.set("n", "gO", "<cmd>Lspsaga outline<CR>", opt)
	keymap.set("n", "gI", "<cmd>Lspsaga finder imp<CR>", opt)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	keymap.set("n", "<leader>q", "<cmd>Lspsaga show_line_diagnostic<CR>", opt)
	keymap.set("n", "<leader>Q", "<cmd>Lspsaga show_cursor_diagnostic<CR>", opt)
	keymap.set("n", "<leader>e", vim.diagnostic.open_float, opt)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opt)
	keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opt)

		-- debug (should  install with dap )
		keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opt) -- toggle breakpoint
		keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opt) -- continue/debug
	if client.name == "pyright" then
		keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opt)
        -- debug
		keymap.set("n", "<leader>dt", "<cmd>lua require('dap-python').test_method()<CR>", opt) -- run tests
	end
end

return M

local M = {}
--Assign keymaps

M.on_attach_pyright = function(_client, bufnr)
	local opt = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap
	keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opt)
end
M.on_attach_clangd = function(client, _bufnr)
	client.server_capabilities.signatureHelpProvider = false
end

M.keys = function(bufnr)
	local opt = function(desc)
		local opt = { noremap = true, silent = true, buffer = bufnr }
		if desc then
			opt.desc = desc
		end
		return opt
	end
	local keymap = vim.keymap
	-- keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
	keymap.set("n", "gD", "<cmd>Lspsaga finder<CR>", opt("Lsp: Finder"))
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt("Lsp: GotoDefinition"))
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opt("Lsp: PeekDefinition"))
	keymap.set("n", "gP", "<cmd>Lspsaga preview_definition<CR>", opt("Lsp: PreviewDefinition"))
	-- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opt)
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opt("Lsp: LspImplmentations"))
	keymap.set("n", "gO", "<cmd>Lspsaga outline<CR>", opt("Lsp: Outline"))
	keymap.set("n", "gI", "<cmd>Lspsaga finder imp<CR>", opt("Lsp: FinderImpl"))
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt("Lsp: CodeAction"))
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt("Lsp: Rename"))
	keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostic<CR>", opt("Lsp: ShowLineDiagnostic"))
	keymap.set("n", "gc", "<cmd>Lspsaga show_cursor_diagnostic<CR>", opt("Lsp: ShowCursorDiagnostic"))
	-- keymap.set("n", "<leader>e", vim.diagnostic.open_float, opt)
	keymap.set(
		"n",
		"<leader>e",
		"<cmd>Lspsage show_workspace_diagnostic ++float<CR>",
		opt("Lsp.ShowWorkspaceDiagnostic Float")
	)
	keymap.set(
		"n",
		"<leader>E",
		"<cmd>Lspsage show_workspace_diagnostic ++normal<CR>",
		opt("Lsp.ShowWorkspaceDiagnostic Normal")
	)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt("Lsp: DiagnosticJumpNext"))
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt("Lsp: DiagnosticJumpPrev"))
	keymap.set("n", "[E", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt("Lsp: DiagnosticJumpNext")) -- need to create function to go to error
	keymap.set("n", "]E", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt("Lsp: DiagnosticJumpPrev")) -- need to create function to go to error
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opt("Lsp: HoverDoc"))
	keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opt("Lsp: OutlineToggle"))

	-- debug (should  install with dap )
	keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opt("Dap: ToggleBreakPoint")) -- toggle breakpoint
	keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opt("Dap: Continue")) -- continue/debug
end

--Assign keymaps
M.on_attach = function(client, bufnr)
	-- setup keys
	M.keys(bufnr)

	if client.name == "pyright" then
		M.on_attach_pyright(client, bufnr)
	end
	-- From nvchad video
	if client.name == "clangd" then
		M.on_attach_clangd(client, bufnr)
	end
end

return M

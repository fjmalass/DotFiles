local M = {}
--
-- enable keybindings only when the lsp server is available
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr } -- vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
	vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts)
	vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts)

	-- global mappings
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    if client.name == "pyright" then
        vim.keymap.set("n", "<leader>oi", "<cmd>PyrightOrgnaizeImports<CR>", opts)
    end
end

return M

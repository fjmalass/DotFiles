local dap = require("dap")

local on_attach = function()
	local opts = { silent = true }
	vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
	vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
	vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
	vim.keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)
	-- vim.keymap.set({ "n", "t" }, "<A-k>", "<cmd>lua require'dap'.step_out()", opts)
	-- vim.keymap.set({ "n", "t" }, "<A-l>", "<cmd>lua require'dap'.step_into()", opts)
	-- vim.keymap.set({ "n", "t" }, "<A-j>", "<cmd>lua require'dap'.step_over()", opts)
	-- vim.keymap.set({ "n", "t" }, "<A-h>", "<cmd>lua require'dap'.continue()", opts)
	vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
	vim.keymap.set(
		"n",
		"<leader>dB",
		"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
		opts
	)
	vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
	vim.keymap.set("n", "<leader>dn", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
	vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
	vim.keymap.set("n", "<leader>dR", "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts)
	vim.keymap.set("n", "<leader>de", "<cmd>lua require'dap'.set_exception_breakpoints({'all'})<cr>", opts)
	vim.keymap.set("n", "<leader>da", "<cmd>lua require'debugHelper'.attach()<cr>", opts)
	vim.keymap.set("n", "<leader>dA", "<cmd>lua require'debugHelper'.attachToRemote()<cr>", opts)
	vim.keymap.set("n", "<leader>d?", function()
		local widgets = require("dap.ui.widgets")
		widgets.centered_float(widgets.scopes)
	end, opts)
	vim.keymap.set("n", "<leader>dk", ":lua require'dap'.up()<CR>zz", opts)
	vim.keymap.set("n", "<leader>dj", ":lua require'dap'.down()<CR>zz", opts)
	vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.toggle({}, 'vsplit')<CR><C-w>l", opts)
end

return {
	"mfussenegger/nvim-dap",
	on_attach = on_attach,
}
-- dap.defaults.fallback.terminal_win_cmd = '20split new'
-- vim.fn.sign_define('DapBreakpoint',
--                    {text = '🟥', texthl = '', linehl = '', numhl = ''})
-- vim.fn.sign_define('DapBreakpointRejected',
--                    {text = '🟦', texthl = '', linehl = '', numhl = ''})
-- vim.fn.sign_define('DapStopped',
--                    {text = '⭐️', texthl = '', linehl = '', numhl = ''})
--
--
-- nvim-telescope/telescope-dap.nvim
-- require('telescope').load_extension('dap')
-- vim.keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
-- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
-- vim.keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')
--
-- require('nvim-dap-virtual-text').setup()
--
-- -- David-Kunz/jester
-- require'jester'.setup({
--     path_to_jest = "/opt/homebrew/bin/jest",
--     dap = {type = 'pwa-node'}
-- })
-- -- require'jester'.setup({ dap = { type = 'pwa-node'}})
-- -- require'jester'.setup({ path_to_jest = "/opt/homebrew/bin/jest", dap = { type = 'pwa-node' } })
-- vim.keymap.set('n', '<leader>tt', function() require"jester".run() end)
-- vim.keymap.set('n', '<leader>t_', function() require"jester".run_last() end)
-- vim.keymap.set('n', '<leader>tf', function() require"jester".run_file() end)
-- vim.keymap.set('n', '<leader>d_', function() require"jester".debug_last() end)
-- vim.keymap.set('n', '<leader>df', function() require"jester".debug_file() end)
-- vim.keymap.set('n', '<leader>dq', function() require"jester".terminate() end)
-- vim.keymap.set('n', '<leader>dd', function() require"jester".debug() end)

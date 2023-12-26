-- check the server [configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
-- Also need to install :TSInstall markdow and markdown_inline
local config = function()
	local lspconfig = require("lspconfig")
	-- set up signs
	local signs = require("utils.icons").diagnostics_signs
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- setup keybindings
	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		local keymap = vim.keymap
		keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
		keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration<CR>", opts)
		keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
		keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opts)
		keymap.set("n", "gO", "<cmd>Lspsaga outline<CR>", opts)
		keymap.set("n", "fd", "<cmd>Lspsaga finder<CR>", opts)
		keymap.set("n", "fI", "<cmd>Lspsaga finder imp<CR>", opts)
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
		keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostic<CR>", opts)
		keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostic<CR>", opts)
		keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts)

		if client.name == "pyright" then
			keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
			keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts) -- toggle breakpoint
			keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opts) -- continue/debug
			keymap.set("n", "<leader>dt", "<cmd>lua require('dap-python').test_method()<CR>", opts) -- run tests
		end
	end

	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			-- make the language settings for lua
			Lua = {
				-- recognize "vim" in global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtimes
					-- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
			},
		},
	})

	-- format on save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })
			if vim.tbl_isempty(efm) then
				return
			end
			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}

-- set up language servers

-- All keybinding
local on_attach = require("util.lsp").on_attach

local config = function()
	require("neoconf").setup({}) -- must be called befor lspconfig
	local lspconfig = require("lspconfig")
	local diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		on_attach = on_attach, -- enable key bindings when the lsp server is available
		settings = { -- custom settings for lua
			Lua = {
				-- make the language recognize vim
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibrarycodeForTypes = true,
					autosearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

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
				python = { flake8, black },
			},
		},
	})

	-- Format on save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })
			if vim.tbl_isempty(efm) then
				-- vim.print("EFM not found not formatting")
				return
			end
			vim.lsp.buf.format({ name = "efm" })
			-- vim.print("Formatting with efm")
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
		"creativenull/efmls-configs-nvim", -- alternative to null-ls that is no longer active
	},
}

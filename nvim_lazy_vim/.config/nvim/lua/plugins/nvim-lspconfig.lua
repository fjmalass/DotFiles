-- Disable the missing-fields luacheck issue
---@diagnostic disable missing-fields

-- check the server [configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
-- Also need to install :TSInstall markdow and markdown_inline
-- Need to install nvm for update of node.js > 20.10 (nvm i 20)
-- lua: lua-language-server, stylua, luacheck
-- python: pyright, black, flake8
-- typescript: typescript-language-server, eslint-lsp, prettierd
-- cpp: clangd, clangformat, cpplint
-- json: fixjson, prettierd
-- rust: rust_analyzer, rustfmt
-- toml: taplo

-- setup keybindings
local on_attach = require("utils.lsp").on_attach
local config = function()
	-- required to setup globals (need to check into .luacheckrc, .luarc.json, and .neoconf.json
	require("neoconf").setup({})
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- set up signs
	local signs = require("utils.icons").diagnostics_signs
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
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
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	})

	--typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "typescript" },
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	--bash
	lspconfig.bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "sh", "aliasrc" },
	})

	-- typescript etc.
	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"css",
			"html",
		},
	})

	-- c/c++ etc.
	lspconfig.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--offset-encoding=utf-8",
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	--typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	-- rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			["rust_analyzer"] = {},
		},
	})

	-- toml
	lspconfig.taplo.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- cmake

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	-- json etc.
	local eslint = require("efmls-configs.linters.eslint")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	-- shell
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	-- cpp
	local cpplint = require("efmls-configs.linters.cpplint")
	local clangformat = require("efmls-configs.formatters.clang_format")
	-- rust
	-- local rustlint = require("efmls-configs.linters.ast-grep")
	local rustfmt = require("efmls-configs.formatters.rustfmt")
	-- toml
	local tomlfmt = require("efmls-configs.formatters.taplo")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"sh",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"markdown",
			"html",
			"css",
			"c",
			"cpp",
			"rust",
			"toml",
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
				javascript = { eslint, prettier_d },
				javascriptreact = { eslint, prettier_d },
				typescript = { eslint, prettier_d },
				typescriptreact = { eslint, prettier_d },
				json = { eslint, fixjson },
				jsonc = { eslint, fixjson },
				sh = { shellcheck, shfmt },
				markdown = { prettier_d },
				html = { prettier_d },
				css = { prettier_d },
				c = { clangformat, cpplint },
				cpp = { clangformat, cpplint },
				rust = { rustfmt },
				toml = { tomlfmt },
			},
		},
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

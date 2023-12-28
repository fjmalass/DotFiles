local opts = {
	ensure_installed = {
		"efm", -- generic insteall of null-ls
		"lua_ls",
		"pyright",
		"tsserver", -- typescript
		"emmet_ls",
		"jsonls",
		"clangd", -- cpp
		"rust_analyzer",
		"taplo", -- toml
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}

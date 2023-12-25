local opts = {
	ensure_installed = {
		"efm", -- formatting protocol
		"lua_ls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williambownam/mason.nvim",
}

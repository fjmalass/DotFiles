-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- adding any nvim-comp sources will menable them with blink
			compat = {},

			keymap = { preset = "default" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },

			-- cmdline = function()
			-- 	local type = vim.fn.getcmdtype()
			-- 	if type == "/" or type == "?" then
			-- 		return { "buffer" }
			-- 	end
			-- 	if type == ":" then
			-- 		return { "cmdline" }
			-- 	end
			-- 	return {}
			-- end,
		},
		opts_extend = { "sources.default" },
	},
}

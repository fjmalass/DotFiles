-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown",
		opts = {},
		-- vim.keymap.set({"n", "i"}, "<M-l><M-o}", "<Cmd>MDListItemBelow<CR>")
		-- vim.keymap.set({"n", "i"}, "<M-l><M-O}", "<Cmd>MDListItemAbove<CR>")
	},
}

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
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
		config = function()
			-- Default table corner is +
			vim.g.table_mode_corner = "|"

			-- Set table mode mappings
			vim.keymap.set("n", "<leader>tm", "<cmd>TableModeToggle<CR>", { desc = "Toggle Table Mode" })
			vim.keymap.set("n", "<leader>tr", "<cmd>TableModeRealign<CR>", { desc = "Realign Table" })

			-- Auto-enable table mode for markdown files (optional)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.cmd("TableModeEnable")
				end,
			})
		end,
	},
}

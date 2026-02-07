-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		-- Use 'config' instead of 'opts' for better control over the provider_selector
		config = function()
			-- Fold settings (can also stay in init if you prefer)
			vim.opt.foldcolumn = "1"
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})

			-- Require recalculation of folds
			vim.api.nvim_create_autocmd("BufReadPost", {
				callback = function()
					vim.schedule(function()
						require("ufo").openAllFolds()
					end)
				end,
			})
		end,
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				desc = "Open all folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				desc = "Close all folds",
			},
			{
				"z1",
				function()
					require("ufo").closeFoldsWith(1)
				end,
				desc = "Close L1 folds",
			},
			{
				"z2",
				function()
					require("ufo").closeFoldsWith(2)
				end,
				desc = "Close L2 folds",
			},
			{
				"K",
				function()
					local winid = require("ufo").peekFoldedLinesUnderCursor()
					if not winid then
						vim.lsp.buf.hover()
					end
				end,
				desc = "Peek Fold / LSP Hover",
			},
		},
	},
}

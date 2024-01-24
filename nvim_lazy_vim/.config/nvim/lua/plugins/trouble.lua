local keys = function()
	local trouble = require("trouble")
	vim.keymap.set("n", "<leader>xx", trouble.toggle, { desc = "Trouble: Toggle" })
    -- next
	vim.keymap.set("n", "<leader>xn", function()
		trouble.next({ skip_groups = true, jump = true })
	end, { desc = "Trouble: Next" })
    -- previous
	vim.keymap.set("n", "<leader>xp", function()
		trouble.previous({ skip_groups = true, jump = true })
	end, { desc = "Trouble: Prev" })
    -- first
	vim.keymap.set("n", "<leader>xf", function()
		trouble.first({ skip_groups = true, jump = true })
	end, { desc = "Trouble: First" })
    -- last
	vim.keymap.set("n", "<leader>xl", function()
		trouble.last({ skip_groups = true, jump = true })
	end, { desc = "Trouble: Last" })
	vim.keymap.set("n", "<leader>xd", function()
		trouble.toggle("document_diagnostics")
	end, { desc = "Trouble: Toggle Document" })
    -- workspace
	vim.keymap.set("n", "<leader>xw", function()
		trouble.toggle("workspace_diagnostics")
	end, { desc = "Trouble: Toggle Workspace" })
    -- quick fix
	vim.keymap.set("n", "<leader>xq", function()
		trouble.toggle("quickfix")
	end, { desc = "Trouble: Toggle QuickFix" })
    -- loc list
	vim.keymap.set("n", "<leader>xl", function()
		trouble.toggle("loclist")
	end, { desc = "Trouble: Toggle LocList" })
    -- lsp references
	vim.keymap.set("n", "gR", function()
		trouble.toggle("lsp_references")
	end, { desc = "Trouble: Lsp References" })
end

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = keys,
	lazy = false,
}

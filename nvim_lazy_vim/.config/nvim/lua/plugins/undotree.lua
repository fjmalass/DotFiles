local keys = function()
	vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "UndotreeToggle" })
end

local config = function()
	-- still unable to do persistent
end

return {
	"mbbill/undotree",
	keys = keys,
	config = config,
	lazy = false,
}

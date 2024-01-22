-- Tutorial
--[[
ys: Add
cs: Change
ds: Delete
Example:
ysiw" (surround word with " )
ds" (delete surrouning" )
cs") (change surrouning" with ) )
-- ]]
return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = true,
}

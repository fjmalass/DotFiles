local keys = function()
	local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
	vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next) --goes forward regardless of last direction
	vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous) -- goes backwar regarless of last direction
	-- make built-in f,F,t,T repeatable with ; and ,
	vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f, { desc = "f is now repeatable with ;," })
	vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F, { desc = "F is now repeatable with ;," })
	vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t, { desc = "t is now repeatable with ;," })
	vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T, { desc = "T is now repeatable with ;," })
end

local keymaps = {
	-- using groups defined in textobjects.scm
	["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
	["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
	["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
	["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
	["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
}

local selection_modes = {
	["@parameters.outer"] = "v", -- charwise
	["@function.outer"] = "V", -- linewise
	["@class.outer"] = "<c-v>", -- blockwise
}

local select = {
	true,
	lookahead = true, -- automatically jump forward to text object, similar to targets.vim
	keymaps = keymaps,
	selection_modes = selection_modes,
	-- If you set this to `true` (default is `false`) then any textobject is
	-- extended to include preceding or succeeding whitespace. Succeeding
	-- whitespace has priority in order to act similarly to eg the built-in
	-- `ap`.
	--
	-- Can also be a function which gets passed a table with the keys
	-- * query_string: eg '@function.inner'
	-- * selection_mode: eg 'v'
	-- and should return true of false
	include_surrounding_whitespace = true,
}

local swap = {
	enable = true,
	swap_next = {
		["<leader>a"] = "@parameter.inner",
	},
	swap_previous = {
		["<leader>A"] = "@parameter.inner",
	},
}

local move = {
	enable = true,
	set_jumps = true, -- setting in the jumplist
	goto_next_start = {
		["]m"] = { query = "@function.outer", desc = "Next function start" },
		["]]"] = { query = "@class.outer", desc = "Next class start" },
		["]o"] = { query = "@loop.*", desc = "Next loop start" }, -- similar to loop.inner loop.outer
		["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
		["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
	},
	goto_next_end = {
		["]M"] = { query = "@function.outer", desc = "Next function end" },
		["]["] = { query = "@class.outer", desc = "Next class end" },
		["]O"] = { query = "@loop.*", desc = "Next loop end" }, -- similar to loop.inner loop.outer
		["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope end" },
	},
	goto_previous_start = {
		["[m"] = { query = "@function.outer", desc = "Previous function start" },
		["[]"] = { query = "@class.outer", desc = "Previous class start" },
		["[o"] = { query = "@loop.*", desc = "Previous loop start" }, -- similar to loop.inner loop.outer
		["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope start" },
		["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold start" },
	},
	goto_previous_end = {
		["[M"] = { query = "@function.outer", desc = "Previous function end" },
		["[["] = { query = "@class.outer", desc = "Previous class end" },
		["[O"] = { query = "@loop.*", desc = "Previous loop end" }, -- similar to loop.inner loop.outer
		["[S"] = { query = "@scope", query_group = "locals", desc = "Previous scope end" },
	},
	goto_next = {
		["]d"] = { query = "@contional.outer", desc = "Next" },
	},

	goto_previous = {
		["[d"] = { query = "@contional.outer", desc = "Previous" },
	},
}

local config = function()
	require("nvim-treesitters.configs").setup({
		textobjext = {
			select = select,
			swap = swap,
			move = move,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = false,
	config = config,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = keys,
}

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
	-- Assignment
	["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
	["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
	["l="] = { query = "@assignment.lhs", desc = "Select left part of an assignment" },
	["r="] = { query = "@assignment.rhs", desc = "Select right part of an assignment" },

	-- -- Property (javascript/typscrypt) (using after/queries/ecma/textobjects.scm)
	-- ["a:"] = { query = "@property.outer", desc = "Select outer part of a property" },
	-- ["i:"] = { query = "@property.inner", desc = "Select inner part of a property" },
	-- ["l:"] = { query = "@property.lhs", desc = "Select left part of a property" },
	-- ["r:"] = { query = "@property.rhs", desc = "Select right part of a property" },

	-- function/class/scope
	["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
	["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

	["am"] = { query = "@call.outer", desc = "Select outer part of a method/function region" },
	["im"] = { query = "@call.inner", desc = "Select inner part of a method/function region" },

	["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
	["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

	["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },

	["ai"] = { query = "@conditional.outer", desc = "Selected outer part of a conditional" },
	["ii"] = { query = "@conditional.inner", desc = "Selected inner part of a conditional" },

	["aa"] = { query = "@parameter.outer", desc = "Selected outer part of a parameter/argument" },
	["ia"] = { query = "@parameter.inner", desc = "Selected inner part of a parameter/argument" },

	["al"] = { query = "@loop.outer", desc = "Selected outer part of a loop" },
	["il"] = { query = "@loop.inner", desc = "Selected inner part of a loop" },
}

local selection_modes = {
	["@parameters.outer"] = "v", -- charwise
	["@function.outer"] = "V", -- linewise
	["@class.outer"] = "<c-v>", -- blockwise
}

local select = {
	enable = true,
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
		["<leader>na"] = "@parameter.inner", -- swap parameter/argument with next
		["<leader>n:"] = "@property.outer", -- swap object property with next
		["<leader>nm"] = "@function.outer", -- swap function with next
	},
	swap_previous = {
		["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with previous
		["<leader>p:"] = "@property.inner", -- swap object property with previous
		["<leader>pm"] = "@function.inner", -- swap function with previous
	},
}

local move = {
	enable = true,
	set_jumps = true, -- setting in the jumplist
	goto_next_start = {
		["]f"] = { query = "@function.outer", desc = "Next function definition start" },
		["]m"] = { query = "@call.outer", desc = "Next method/function call start" },
		["]c"] = { query = "@class.outer", desc = "Next class start" },
		["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
		["]l"] = { query = "@loop.*", desc = "Next loop start" }, -- similar to loop.inner loop.outer
		["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
		["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
	},
	goto_next_end = {
		["]F"] = { query = "@function.outer", desc = "Next function definition end" },
		["]M"] = { query = "@call.outer", desc = "Next method/function call end" },
		["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
		["]C"] = { query = "@class.outer", desc = "Next class end" },
		["]L"] = { query = "@loop.*", desc = "Next loop end" }, -- similar to loop.inner loop.outer
		["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope end" },
	},
	goto_previous_start = {
		["[f"] = { query = "@function.outer", desc = "Previous function definition start" },
		["[m"] = { query = "@call.outer", desc = "Previous method/function call start" },
		["[c"] = { query = "@class.outer", desc = "Previous class start" },
		["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
		["[i"] = { query = "@conditional.outer", desc = "Previous loop start" },
		["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope start" },
		["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold start" },
	},
	goto_previous_end = {
		["[F"] = { query = "@function.outer", desc = "Previous function definition end" },
		["[M"] = { query = "@call.outer", desc = "Previous method/function call end" },
		["[C"] = { query = "@class.outer", desc = "Previous class end" },
		["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
		["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
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
	require("nvim-treesitter.configs").setup({
		textobjexts = {
			enable = true,
			keymaps = keymaps,
			select = select,
			swap = swap,
			move = move,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = config,
	keys = keys,
}

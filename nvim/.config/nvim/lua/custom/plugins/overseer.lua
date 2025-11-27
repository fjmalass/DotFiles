return {
	"stevearc/overseer.nvim",
	lazy = false,
	enabled = true,
	dependencies = "stevearc/dressing.nvim",
	cmd = {
		"OverseerRun",
		"OverseerToggle",
		"OverseerInfo",
		"OverseerBuild",
		"OverseerTaskAction",
		"OverseerQuickAction",
	},
	keys = {
		{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "[o]verseer: [r]un task" },
		{ "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "[o]verseer: [t]oggle" },
		{
			"<leader>oq",
			function()
				local overseer = require("overseer")
				local tasks = overseer.list_tasks({ recent_first = true })
				if vim.tbl_isempty(tasks) then
					vim.notify("No tasks found", vim.log.levels.WARN)
				else
					overseer.run_action(tasks[1], "restart")
				end
			end,
			desc = "[o]verseer: [q]uick run (restart last)",
		},
		{
			"<leader>oc",
			function()
				require("overseer").clear_task_cache()
				vim.notify("Overseer task cache cleared", vim.log.levels.INFO)
			end,
			desc = "[o]verseer: [c]lear cache",
		},
		{ "<leader>oi", "<cmd>OverseerInfo<CR>", desc = "[o]verseer: [i]nfo" },

		{
			"<leader>ob",
			function()
				require("overseer").run_task({ name = "build" })

				-- local overseer = require("overseer")
				-- overseer.run_task({
				-- 	cmd = { "go", "build" },
				-- 	name = "Build manual",
				-- 	components = { { "on_output_quickfix", open = true }, "default" },
				-- })
			end,
			desc = "[o]verseer: [b]uild",
		},
		{
			"<leader>oT",
			function()
				require("overseer").run_task({ name = "test" })
			end,
			desc = "[o]verseer: [T]est",
		},
		{
			"<leader>ol",
			function()
				require("overseer").run_task({ name = "lint" })
			end,
			desc = "[o]verseer: [l]int",
		},
	},

	opts = {
		debug = true,
		-- Autodetect
		strategy = "toggleterm", -- best UI floating terminal
		task_list = {
			direction = "bottom",
			min_height = 15,
			max_height = 25,
		},
		templates = {
			"builtin",
			"taskfile",
			-- "msbuild",
			"cargo",
			"npm",
			"go",
			"make",
			"cmake",
		},
		component_aliases = {
			default = {
				"on_exit_set_status",
				{ "on_complete_notify", statuses = { "FAILURE" } },
				"on_complete_dispose",
				{ "on_output_quickfix", open = true, open_on_match = true },
			},
		},
		actions = {
			["open quickfix"] = {
				desc = "Open quickfix with errors",
				run = function(task)
					vim.cmd("copen")
				end,
			},
		},
	},
	config = function(_, opts)
		require("overseer").setup(opts)
	end,
}

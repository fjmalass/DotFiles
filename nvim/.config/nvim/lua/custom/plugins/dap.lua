return {
	-- 1. Core DAP Plugin
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- ============================================================================
			-- BREAKPOINT ICONS (Complete set with all types)
			-- ============================================================================
			vim.fn.sign_define("DapBreakpoint", {
				text = "🔴",
				texthl = "DapBreakpoint",
				linehl = "",
				numhl = "",
			})
			vim.fn.sign_define("DapBreakpointCondition", {
				text = "🟡",
				texthl = "DapBreakpoint",
				linehl = "",
				numhl = "",
			})
			vim.fn.sign_define("DapBreakpointRejected", {
				text = "🚫",
				texthl = "DapBreakpoint",
				linehl = "",
				numhl = "",
			})
			vim.fn.sign_define("DapStopped", {
				text = "▶️",
				texthl = "DapStopped",
				linehl = "DapStoppedLine",
				numhl = "",
			})
			vim.fn.sign_define("DapLogPoint", {
				text = "📝",
				texthl = "DapLogPoint",
				linehl = "",
				numhl = "",
			})

			-- ============================================================================
			-- ⭐ MOVED: Helper function now at top level to be used by configurations
			-- ============================================================================
			local function find_buffer_by_pattern(pattern)
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_loaded(buf) then
						local bufname = vim.api.nvim_buf_get_name(buf)
						if bufname:match(pattern) then
							return bufname
						end
					end
				end
				return nil
			end

			-- ============================================================================
			-- ALL KEYMAPS IN ONE PLACE
			-- ============================================================================

			-- Basic debugging controls
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug: [C]ontinue/Start" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug: Step [O]ver" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug: Step [I]nto" })
			vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "[D]ebug: Step [O]ut (capital O)" })

			-- Set up nvim-dap-virtual-text for inline variable values
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = false,
				show_stop_reason = true,
				commented = false,
				all_references = true,
				clear_on_continue = false,
				virt_text_pos = "inline", -- 'eol' otherwise
			})

			-- Configure Go debugging
			-- Using nvim-dap-go - this is where the Delve magic happens
			require("dap-go").setup({
				-- Delve configurations
				delve = {
					-- Path to the delve executable
					path = "dlv",

					-- Windows compatibility - prevents errors on Windows
					-- Set to false on Windows, otherwise the dlv server creation may fail
					detached = vim.fn.has("win32") == 0,

					-- Default port for Delve to listen on
					port = "${port}",

					-- Build flags to pass to the Go compiler
					build_flags = "",
				},

				-- Whether to use dap.configurations.go or the built-in defaults
				-- dap_configurations = true,

				-- Verbosity for test runs
				test_runner = "go", -- go or dlv
			})

			-- Set up Mason-nvim-dap for adapter installation
			require("mason-nvim-dap").setup({
				-- Automatically install these debug adapters
				ensure_installed = { "delve" },

				-- Set this to true to automatically install other adapters
				automatic_installation = true,

				-- Provide handlers to configure adapters
				handlers = {
					function(config)
						-- All adapters will go through this handler
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})

			-- Configure Python debugging (if needed)
			-- Uncomment to enable Python debugging
			-- local python_path = vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
			-- require('dap-python').setup(python_path)

			-- Define key mappings for debugging
			-- Use these to trigger debugging actions
			-- Breakpoint management
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebug: Toggle [B]reakpoint" })
			vim.keymap.set("n", "<Leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "[D]ebug: Conditional [B]reakpoint" })
			vim.keymap.set("n", "<Leader>dlp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "[D]ebug: [L]og [P]oint" })
			vim.keymap.set("n", "<Leader>dbc", dap.clear_breakpoints, { desc = "[D]ebug: [B]reakpoints [C]lear All" })

			-- Session management
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "[D]ebug: Open [R]EPL" })
			vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "[D]ebug: Run [L]ast" })
			vim.keymap.set("n", "<Leader>dx", dap.terminate, { desc = "[D]ebug: Terminate (e[X]it)" })

			-- Nativate stack frmeas up/down
			vim.keymap.set("n", "<Leader>dK", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.frames)
				sidebar.open()
			end, { desc = "[D]ebug: Show Full Stac[K] Trace" })

			vim.keymap.set("n", "<Leader>dj", dap.down, { desc = "[Debug]: Stack frame [j] (down)" })
			vim.keymap.set("n", "<Leader>dk", dap.down, { desc = "[Debug]: Stack frame [k] (up)" })
			-- show excetipon info
			vim.keymap.set("n", "<Leader>dE", function()
				local log_path = vim.fm.expand("$HOME/.cache/nvim/dap.log")
				if vim.fn.filereadable(log_path) == 1 then
					vim.cmd("edit" .. log_path)
				else
					vim.notifiy("DAP Log not found at " .. log_path, vim.log.levels.WARN)
				end
			end, { desc = "[Debug]: Show [E]xception/Error log" })

			-- UI controls (these use dapui but keymaps centralized here)
			vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "[D]ebug: Toggle [U]I" })
			vim.keymap.set("n", "<Leader>de", function()
				dapui.eval(nil, { enter = true })
			end, { desc = "[D]ebug: [E]valuate Expression" })

			-- Go-specific keymaps
			vim.keymap.set("n", "<Leader>dt", function()
				require("dap-go").debug_test()
			end, { desc = "[D]ebug: Go [T]est" })
			vim.keymap.set("n", "<Leader>dlt", function()
				require("dap-go").debug_last_test()
			end, { desc = "[D]ebug: [L]ast Go [T]est" })

			-- Inspection tools
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "[D]ebug: [H]over Variables" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "[D]ebug: [P]review Value" })
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "[D]ebug: Show [F]rames" })
			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "[D]ebug: Show [S]copes" })

			-- Set log level
			dap.set_log_level("INFO")

			vim.notify("🚀 Core DAP loaded with all keymaps", vim.log.levels.INFO)
		end,
	},

	-- 2. DAP UI Configuration
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")

			dapui.setup({
				icons = {
					expanded = "▾",
					collapsed = "▸",
					current_frame = "▸",
				},
				controls = {
					enabled = true,
					element = "repl",
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "⏪",
						run_last = "🔁",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "stacks", size = 0.35 },
							{ id = "watches", size = 0.20 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
				floating = {
					max_height = nil,
					max_width = nil,
					border = "rounded",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
			})

			-- Automatically open/close the UI
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- 3. Mason DAP Adapter Installer
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "delve", "debugpy" },
				automatic_installation = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},

	-- 4. Virtual Text (Inline Variable Values)
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = true,
				show_stop_reason = true,
				commented = false,
				only_first_definition = true,
				all_references = false,
				clear_on_continue = false,
				display_callback = function(variable, buf, stackframe, node, options)
					if options.virt_text_pos == "inline" then
						return " = " .. variable.value
					else
						return variable.name .. " = " .. variable.value
					end
				end,
				virt_text_pos = "eol",
			})
		end,
	},

	-- 5. Go Debugging Support
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			-- ============================================================================
			-- ⭐ NEW: Helper function for Taskfile-based debugging
			-- ============================================================================
			local function find_buffer_by_pattern(pattern)
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_loaded(buf) then
						local bufname = vim.api.nvim_buf_get_name(buf)
						if bufname:match(pattern) then
							return bufname
						end
					end
				end
				return nil
			end

			require("dap-go").setup({
				delve = {
					path = "dlv",
					initialize_timeout_sec = 20,
					port = "${port}",
					args = {},
					build_flags = "",
					detached = vim.fn.has("win32") == 0,
					cwd = nil,
				},
				dap_configurations = {
					-- ============================================================================
					-- ⭐ NEW: Taskfile-based debug configuration (shows up in <leader>dc picker)
					-- ============================================================================
					-- This configuration will appear when you press <leader>dc
					-- It uses open Taskfile.yml and main.go buffers to determine paths
					-- ============================================================================
					{
						type = "go",
						name = "Debug: Task Run (from buffers)",
						request = "launch",
						program = function()
							-- Find main.go buffer
							local main_go_path = find_buffer_by_pattern("main%.go$")
							if not main_go_path then
								vim.notify("❌ Please open a main.go file first!", vim.log.levels.ERROR)
								return nil
							end
							return main_go_path
						end,
						cwd = function()
							-- Find Taskfile.yml buffer for workspace root
							local taskfile_path = find_buffer_by_pattern("Taskfile%.yml$")
							if not taskfile_path then
								vim.notify("❌ Please open Taskfile.yml first!", vim.log.levels.ERROR)
								return nil
							end
							return vim.fn.fnamemodify(taskfile_path, ":h")
						end,
						args = function()
							local args_string = vim.fn.input("Arguments: ")
							if args_string == "" then
								return {}
							end
							return vim.split(args_string, " +")
						end,
					},
					{
						type = "go",
						name = "Debug Current File",
						request = "launch",
						program = "${file}",
					},
					{
						type = "go",
						name = "Debug Package",
						request = "launch",
						program = "${fileDirname}",
					},
					{
						type = "go",
						name = "Debug Project (main.go)",
						request = "launch",
						program = "${workspaceFolder}",
					},
					{
						type = "go",
						name = "Debug Test Function",
						request = "launch",
						mode = "test",
						program = "${file}",
					},
					{
						type = "go",
						name = "Attach Remote (port 38697)",
						mode = "remote",
						request = "attach",
						port = 38697,
						host = "127.0.0.1",
					},
					{
						type = "go",
						name = "Debug with Arguments (Interactive)",
						request = "launch",
						program = "${file}",
						args = function()
							local args_string = vim.fn.input("Arguments: ")
							return vim.split(args_string, " +")
						end,
					},
				},
				tests = {
					verbose = false,
				},
			})
		end,
	},

	-- 6. Python Debugging Support
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
	},
}

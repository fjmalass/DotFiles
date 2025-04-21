return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",

			-- Required dependency for nvim-dap-ui
			"nvim-neotest/nvim-nio",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Language-specific extensions
			"leoluz/nvim-dap-go", -- Go/Delve support
			"mfussenegger/nvim-dap-python", -- Python support

			-- Optional: visualization improvements
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Configure UI
			dapui.setup({
				icons = {
					expanded = "▾",
					collapsed = "▸",
					current_frame = "*",
				},
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})
			-- Automatically open/close the UI
			-- Initialize the tables first to avoid nil errors
			dap.listeners.after = dap.listeners.after or {}
			dap.listeners.before = dap.listeners.before or {}

			dap.listeners.after.event_initialized = dap.listeners.after.event_initialized or {}
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated = dap.listeners.before.event_terminated or {}
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited = dap.listeners.before.event_exited or {}
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Set up nvim-dap-virtual-text for inline variable values
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = false,
				commented = false,
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
				dap_configurations = true,

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
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "Debug: Continue/Start" })
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Conditional Breakpoint" })
			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "Debug: Open REPL" })
			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end, { desc = "Debug: Run Last" })

			-- Go-specific debug commands
			vim.keymap.set("n", "<Leader>dt", function()
				require("dap-go").debug_test()
			end, { desc = "Debug: Go Test" })
			vim.keymap.set("n", "<Leader>dlt", function()
				require("dap-go").debug_last_test()
			end, { desc = "Debug: Last Go Test" })

			-- UI toggle
			vim.keymap.set("n", "<Leader>du", function()
				dapui.toggle()
			end, { desc = "Debug: Toggle UI" })

			-- Log Level
			dap.set_log_level("INFO") -- Levels: TRACE, DEBUG, INFO, WARN, ERROR

			-- Advanced: Custom DAP configurations for Go
			-- These provide more specialized debugging scenarios
			dap.configurations.go = dap.configurations.go or {}

			-- Check if configurations already exist before extending
			if #dap.configurations.go == 0 then
				-- Adding additional debug configurations
				table.insert(dap.configurations.go, {
					type = "go",
					name = "Debug Current File",
					request = "launch",
					program = "${file}",
				})

				table.insert(dap.configurations.go, {
					type = "go",
					name = "Debug Project (main.go)",
					request = "launch",
					program = "${workspaceFolder}/main.go",
				})

				table.insert(dap.configurations.go, {
					type = "go",
					name = "Debug Test Function",
					request = "launch",
					mode = "test",
					program = "${file}",
				})

				table.insert(dap.configurations.go, {
					type = "go",
					name = "Attach Remote",
					mode = "remote",
					request = "attach",
					port = 38697,
					host = "127.0.0.1",
				})
			end

			-- Print setup completion message
			vim.notify("DAP Delve setup complete", vim.log.levels.INFO)
		end,
	},
}

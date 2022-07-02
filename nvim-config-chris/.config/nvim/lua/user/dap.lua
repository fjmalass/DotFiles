-- Regular dap
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  print "dap_status is broken"
  return
end

-- Dap install
local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  print "dap_install is broken"
  return
end

dap_install.setup { installation_path = vim.fn.stdpath "data" .. "/dapinstall/" }
-- Python is installed in /Users/francois/.local/share/nvim/dapinstall/python

--[[
------------------------------------------------------------
  the libraries are in /Users/francois/.local/share/nvim/dapinstall/python/lib/python3.10/site-packages
  to install modules use /Users/francois/.local/share/nvim/dapinstall/python/lib/python3.10 -m pip install numpy
--------------------------------------------------------------
--]]

-- Regular dapui
local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  print "dap_ui is broken"
  return
end

-- ThePrimeagen setup
-- dapui.setup {
--   layouts = {
--     {
--       elements = { "console" },
--       size = 7,
--       position = "bottom",
--     },
--     {
--       elements = {
--         {
--           id = "scopes",
--           size = 0.25,
--         },
--         "watches",
--       },
--       size = 40,
--       position = "right",
--     },
--   },
-- }

dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- expand lines larger than window for nvim >= 0.7
  expand_lines = vim.fn.has "nvim-0.7",
  layouts = {
    {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40, -- 40 columns
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = {
       "repl"
        -- { id = "repl", size = 0.6 },
        -- { id = "console", size = 0.4 },
      },
      size = 30,
      -- size = 0.2,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "rounded", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
  },
}

dap_install.config("python", {})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Regular dap-virtual-text
-- current not working as needs treesitte to be loaded
local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
  return
end
dap_virtual_text.setup {
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = true, -- prefix virtual text with comment string
  only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
  all_references = false, -- show virtual text on all all references of the variable (not only definitions)
  filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
  -- experimental features:
  virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column)
}

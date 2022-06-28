-- Regular dap
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  print('dap_status is broken')
  return
end

-- Dap install
local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  print('dap_install is broken')
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
  print('dap_ui is broken')
  return
end

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
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        { id = "scopes", size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40, -- 40 columnes
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = {
        {id = "repl", size = 0.6 },
        {id = "console", size = 0.4 },
      },
      size = 0.3,
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
  }
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
-- current not working.
--[[
local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virual-text")
if not dap_virtual_text_status_ok then
  return
end
dap_virtual_text.setup()
--]]


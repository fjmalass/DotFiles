-- ~/.config/lvim/ftplugin/cpp.lua
-- :TSInstall cpp
-- :TSInstall c
-- :LspInstall clangd
-- :DIInstall ccppr_vsc

local dap_install = require "dap-install"
dap_install.config("ccppr_vsc", {
  adapters       = { type = "executable" },
  configurations = {
    { type = "cpptools",
      request = "launch",
      name = "Launch with pretty-print",
      program = function()
        return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      setupCommands = {
        {
          description = "Enable pretty-printing",
          text = "-enable-pretty-printing",
        }
      }
    },
  }
})

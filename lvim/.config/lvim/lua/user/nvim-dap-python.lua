--[[
Nemkdir .virtualenvs

```
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
debugpy/bin/python -m pip install numpy
debugpy/bin/python -m pip install scipy

```
]]
local M = {}

M.config = function()
  local status_ok, dap_python = pcall(require, "dap-python")
  if not status_ok then
    return
  end
  local python_path = os.getenv("HOME") .. "/.virualenvs/debugpy/bin/python"
  print(python_path)

  dap_python.setup(python_path)
end

return M

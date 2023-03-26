--  Get the environment path using pipenv etc.
local get_python_path = function()
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(os.getenv('VIRTUAL_ENV') .. '/bin/python') == 1 then
        return os.getenv('VIRTUAL_ENV') .. '/bin/python'
    elseif vim.fn.executable(vim.fn.system('pipenv --venv') .. '/bin/python') == 1 then
        return vim.fn.system('pipenv --venv') .. '/bin/python'
    elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
    else
        return '/usr/bin/python'
    end
end


local pythonPath = get_python_path()

-- standard method
local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    print("dap is not installed")
    return
end

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = pythonPath,
    },
}

dap.adapters.python = {
    type = 'executable',
    command = pythonPath,
    args = { '-m', 'debugpy.adapter' },
}

-- with plugin
-- local status_ok, dap_python = pcall(require, 'dap-python')
-- if not status_ok then
--     print("dap-python is not installed")
--     return
-- end
--
-- dap_python.resolve_python = get_python_path
-- dap_python.test_runner = 'pytest'
-- dap_python.setup(pythonPath)
--
-- -- dap.configurations.python {
--     {
--         -- required by nvim-dap
--         type = 'python', -- so python adapter is accessible with dap.dapaters.python
--         request = 'launch',
--         name = 'Launch File',
--         -- Options for debugpy
--         program = "${file}", -- This configuration will launch the current file if used
--         pythonPath = get_python_path,
--     },
-- }
--
-- keympas are located in dap.lua right now

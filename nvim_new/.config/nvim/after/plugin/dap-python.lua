--  Get the environment path using pipenv etc.
local get_python_path = function()
    local cwd = vim.fn.getcwd()
    local python_dir = '/bin/python3'

    local root_dirs = {
        os.getenv('VIRTUAL_ENV'),
        vim.fn.system('pipenv --venv'),
        cwd, '/usr' }
    for _, root_dir in ipairs(root_dirs) do
        if root_dir and vim.fn.executable(root_dir .. python_dir) == 1 then
            print("python path: " .. root_dir .. python_dir)
            return root_dir .. python_dir
        end
        return nil
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

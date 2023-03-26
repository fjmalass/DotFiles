local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
    print("dapui is not installed")
    return
end
print('settingup dapui')

dapui.setup(
    {
        icons = {
            expanded = '▾',
            collapsed = '▸',
            current_frame = '▸',
            circular = "↻",
        },
        --     mappings = {
        --         open = 'o',
        --         remove = 'd',
        --         edit = 'e',
        --         repl = 'r',
        --         toggle = 't',
        --         expand = '<CR>',
        --     },
        --     controls = {
        --         enabled = true,
        --         element = 'repl',
        --         icons = {
        --             pause = "",
        --             play = "",
        --             step_into = "",
        --             step_over = "",
        --             step_out = "",
        --             step_back = "",
        --             run_last = "↻",
        --             terminate = "□",
        --         },
        --     },
        --     expand_lines = vim.fn.has('nvim-0.9'),
        --     layouts = {
        --         {
        --             elements = {
        --                 { id = 'scopes', size = 0.25 },
        --                 'breakpoints',
        --                 'stacks',
        --                 'watches',
        --             },
        --             size = 40,
        --             position = 'left',
        --         },
        --         {
        --             elements = {
        --                 'repl',
        --                 'console'
        --             },
        --             size = 0.25,
        --             position = 'bottom',
        --         },
        --     },
        --     floating = {
        --         max_height = nil,
        --         max_width = nil,
        --         border = 'single',
        --         mappings = {
        --             close = { 'q', '<Esc>' },
        --         },
        --     },
        --     windows = { indent = 1 },
        --     render = {
        --         max_type_length = nil,
        --         max_value_lines = nil,
        --     },
    }
)

-- local dap = require('dap')
-- dap.listeners.after_event_initialized['dapui_config'] = function()
--     dapui.open()
-- end
-- dap.listeners.after_event_terminated['dapui_config'] = function()
--     dapui.close()
-- end
-- dap.listeners.after_event_exited['dapui_config'] = function()
--     dapui.close()
-- end


-- mappings
vim.keymap.set('n', '<M-k>', function() dapui.eval() end) -- evaluate word under cursor

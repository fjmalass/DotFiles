local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    print("dap is not installed")
    return
end

dap.defaults.fallback.force_external_terminal = true

-- autocomplete with C-X C-O
-- au FileType dap-repl lua require('dap.ext.autocompl').attach()

-- debug continue/start
vim.keymap.set('n', '<leader>dc', function() dap.continue() end)                                               -- continue
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)                                               -- run lat
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)                                      -- toggle breakpoint
vim.keymap.set('n', '<leader>dd', function() dap.toggle_breakpoint(vim.fn.input("Breakpoint condition ")) end) -- toggle breakpoint
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)                                              -- open repl
vim.keymap.set('n', '<leader>dn', function() dap.step_over() end)                                              --step over
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)                                              --step into
vim.keymap.set('n', '<leader>do', function() dap.step_out() end)                                               --step out
-- may be moved with python
vim.keymap.set('n', '<leader>dm', function() dap.test_method() end)                                            -- test method
vim.keymap.set('n', '<leader>dk', function() dap.test_class() end)                                             -- test class
vim.keymap.set('n', '<leader>ds', function() dap.debug_selection() end)                                        -- debug selection

local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
    print("telescope-builtin is not loaded")
    return
end

local theme_status_ok, themes = pcall(require, "telescope.themes")
if not theme_status_ok then
    print("telescope-themes is not loaded")
    return
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = '[P]roject git files' })
vim.keymap.set('n', '<leader>pw', builtin.live_grep, { desc = '[P]roject search [W]ord' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = '[P]roject [S]earch word' })
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[P]roject [D]iagnostics' })
-- vim.keymap.set('n', '<leader>vh', builtin.help_tabs, {})

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

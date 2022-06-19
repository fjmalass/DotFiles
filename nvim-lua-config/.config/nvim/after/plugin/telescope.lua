vim.keymap.set("n", "<C-p>", ":Telescope")
vim.keymap.set("n", "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
vim.keymap.set("n", "<Leader>pf", "<cmd>lua require('telescope.builtin').find_files()<CR>")

vim.keymap.set("n", "<leader>pw", "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>")
vim.keymap.set("n", "<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
vim.keymap.set("n", "<leader>vh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "<leader>gm", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
vim.keymap.set("n", "<leader>td", "<cmd>lua require('theprimeagen.telescope').dev()<CR>")

vim.keymap.set("n", "<leader>u", "<cmd>lua require('theprimeagen.telescope').dev()<CR>")

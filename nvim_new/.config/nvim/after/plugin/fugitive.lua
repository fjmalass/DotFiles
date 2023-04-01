vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
--  get the left side of the diff
vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
--  get the right side of the diff
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")

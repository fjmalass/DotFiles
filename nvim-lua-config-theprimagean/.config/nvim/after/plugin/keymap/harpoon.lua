local silent = { silent = true }

vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, silent) 
vim.keymap.set("n", "<c-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent) 
vim.keymap.set("n", "<leader>tc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent) 

vim.keymap.set("n", "<c-h>", function() require("harpoon.ui").nav_file(1) end, silent) 
vim.keymap.set("n", "<c-t>", function() require("harpoon.ui").nav_file(2) end, silent) 
vim.keymap.set("n", "<c-n>", function() require("harpoon.ui").nav_file(3) end, silent) 
vim.keymap.set("n", "<c-s>", function() require("harpoon.ui").nav_file(4) end, silent) 

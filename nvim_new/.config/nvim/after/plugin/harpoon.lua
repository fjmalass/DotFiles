local mark_status_ok, mark = pcall(require, "harpoon.mark")
if not mark_status_ok then
    print("harpoon.mark is not loaded")
    return
end
local ui_status_ok, ui = pcall(require, "harpoon.ui")
if not ui_status_ok then
    print("harpoon.ui is not loaded")
    return
end


vim.keymap.set("n", "<C-a>", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>;", function() ui.nav_file(4) end)

local illuminate_ok, illuminate = pcall(require, "illuminate")
if not illuminate_ok then
  print("'illuminate' plugin not installed")
  return
end

local config = {
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  filetypes_denylist = {
    'fugitive',
    'dirvish,'
  },
  under_cursor=true,
}

illuminate.configure(config)

--[[ -- vim.g.Illuminate_delay = 0
-- vim.g.Illuminate_highlightUnderCursor = 0
vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree'}
-- vim.g.Illuminate_highlightUnderCursor = 0
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
  {noremap=true})
]]



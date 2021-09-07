vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
}
vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "jsx_element",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
}

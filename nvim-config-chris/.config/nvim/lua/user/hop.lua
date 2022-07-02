local status_ok, hop = pcall(require, "hop")
if not status_ok then
  print("We did not get hop")
  return
end

hop.setup({
  keys = "etovzqpdygfblzhckisuran",
  case_insensitive = true,
  create_hl_autocmd = true,
  uppercase_labels = true,
  current_line_only = false,
})

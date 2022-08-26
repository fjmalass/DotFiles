local status_ok, hop = pcall(require, "hop")
if not status_ok then
  print("'hop' plugin is not available")
  return
end

local config = {
  keys = "etovzqpdygfblzhckisuran",
  case_insensitive = false, -- uses smartcases
  create_hl_autocmd = true,
  quit_key = '<spc>',
  jump_on_sole_occurrence = true,
  multi_windows = false,
  current_line_only = false,
 -- hint_position = hop.HintPosition.BEGIN,
}

hop.setup(config)

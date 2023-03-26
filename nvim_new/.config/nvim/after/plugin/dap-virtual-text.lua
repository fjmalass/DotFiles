local status_ok, vt = pcall(require, 'nvim-dap-virtual-text')
if not status_ok then
    print("nvim-dap-virtual-text is not installed")
    return
end

-- signs
vim.fn.sign_define(
    "DapBreakpoint",
    { text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
)
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })


vt.setup({
    enabled = true,
    enabled_commands = true,
    hightlight_changed_variables = true,
    hightlight_new_as_changed = true,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    display_callback = function(variable, _buf, _stackframe, _node)
        return variable.name .. ' = ' .. variable.value
    end,
    -- experimental 2023-03-28
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil,
})

local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
    print("rust-tools is not loaded")
    return
end

local opts = {
    server = {
        on_attach = function(_, bufnr)
            -- hover action
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            -- code action
            vim.keymap.set('n', '<leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        -- execute commands either in terminal or quickfix
        -- executor = rt.executors.termopen,
        -- automatically reload worspace when Cargo.toml is updated
        reload_workspace_from_cargo_toml = true,
        -- inlays
        inlays_hints = {
            auto = true,
            only_on_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = '<-',
            other_hints_prefix = '=>',
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = true,
            right_align_padding = 3,
            highlight = "Comment",
        },
        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            },
        },
    },
}

rt.setup(opts)

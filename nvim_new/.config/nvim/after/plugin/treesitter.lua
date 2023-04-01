local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("nvim-treesitter.configs is not loaded")
    return
end
configs.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "cpp", "lua", "vim", "python", "query", "rust", "javascript", "typescript", "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}


local context_status_ok, context = pcall(require, "treesitter-context")
if not context_status_ok then
    print("treesitter-context is not loaded")
    return
end

context.setup {
    enable = true,
    max_lines = 0,           -- 0 means unlimited
    min_window_height = 0,   -- 0 means unlimited
    line_numbers = true,
    multiline_threshold = 5, -- 5 means that if the node has more than 5 lines, it will be multiline_threshold
    trim_scope = 'outer',
    mode = 'cursor',
}

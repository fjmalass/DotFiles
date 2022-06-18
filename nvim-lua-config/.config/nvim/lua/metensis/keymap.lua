local M = {}

function M.bind(mode, keys, func, tab)
    local t = tab and tab or {}
    vim.api.nvim_set_keymap(mode, keys, func, t)
end


function M.normal(key, func, tab)
    M.bind("n", key, func, tab)
end

function M.visual(key, func, tab)
    M.bind("v", key, func, tab)
end

function M.insert(key, func, tab)
    M.bind("i", key, func, tab)
end

function M.terminal(key, func, tab)
    M.bind("t", key, func, tab)
end

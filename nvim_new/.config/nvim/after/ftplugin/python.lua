local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
    print('lsp-zero is not installed')
    return
end

-- local sources = {
--     lsp.builtins.formatting.black,
-- }
--
-- lsp.setup({ sources = sources })

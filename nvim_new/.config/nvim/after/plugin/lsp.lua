local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    print("lsp-zero is not loaded")
    return
end

lsp.preset({
    name = "recommended",
    set_lsp_keymaps = { omit = { '<F2>' }, },
})

lsp.ensure_installed({
    'lua_ls',
    'pyright',
    'tsserver',
    'rust_analyzer',
    'eslint',
    'clangd',
})

lsp.nvim_workspace()

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("cmp is not loaded")
    return
end
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


-- create new key bindings
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vl", function() vim.diagnostic.show_line_diagnostics() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    lsp.buffer_autoformat()
end)

--- lsp config handler
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, buffer)
end
local lspconfig = require('lspconfig')
local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
    lspconfig[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
    })
end


-- Formatting  (1 server per language)
lsp.on_attach(function(client, bufnr)
    lsp.buffer_autoformat()
end)

-- Setup
lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


-- Null-ls and black  auto Formatting
local ok_status, null_ls = pcall(require, 'null-ls')
if not ok_status then
    print('null-ls is not installed')
    return
end

local sources = {
    -- python
    null_ls.builtins.formatting.black.with({
        extra_args = { "--line-length=120" }
    }),
    null_ls.builtins.formatting.isort,
}

null_ls.setup({ sources = sources })


null_ls.setup({ sources = sources })

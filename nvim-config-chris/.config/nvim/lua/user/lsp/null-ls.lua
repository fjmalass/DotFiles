local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with { -- javascript (install with npm install prettier)
      extra_filetypes = { "toml", "solidity" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } }, -- python (pip install black)
    formatting.isort, -- python sorting imports (pip install isort)
    formatting.stylua, -- lua (cargo install stylua)
    formatting.djlint, -- html for django (pi install djlint)
    formatting.gofmt, -- go (already installed with go)
    formatting.goimports, -- go add/remove imports (go install golang.org/x/tools/cmd/goimports@latest)
    -- formatting.google_java_format, -- java
    -- formatting.json_tool, -- json (already done with prettier)
    formatting.rustfmt, -- rust (brew install rustfmt)
    formatting.shfmt, -- bash (go install mvdan.cc/sh/v3/cmd/shfmt@latest)
    formatting.uncrustify, -- cpp (brew install uncrustify)
    diagnostics.flake8, -- for python (need to install with pip install flake8)
    diagnostics.cppcheck, -- for cpp (brew install cppcheck)
    diagnostics.eslint, -- for javascript (need to install with npm install eslint) needs a .eslintrc
    diagnostics.tsc, -- typescript
    diagnostics.golangci_lint, -- golang (brew install golangci_lint)
    -- diagnostics.staticcheck, -- golang
    diagnostics.luacheck, -- lua (luarocks luacheck)
    diagnostics.markdownlint, -- markdown (npm install markdownlint-cli, brew install markdownlint-cli)
    diagnostics.rstcheck, -- reStructuredText (pip install rstcheck)
  },
}

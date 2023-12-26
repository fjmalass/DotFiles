-- install golang, python-venv, luarocks, efm to enable efm
-- Recommendations from installation
-- lua: stylua, lua-language-server, luacheck
return {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    cmd = "Mason",
    config = {
        ui = {
            icons = {
                package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
            },
        },
    },
}

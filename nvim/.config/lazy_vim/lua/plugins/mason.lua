return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    config = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }

}

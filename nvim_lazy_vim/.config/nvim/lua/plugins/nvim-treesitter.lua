local config = function()
    require("nvim-treesitter.configs").setup({
        build = ":TSUpdate",
        indent = {
            enable = true,
        },
        autotag = { 
            enable = true,
        },
        ensure_installed = {
            "markdown",
            "json",
            "markdown",
            "json",
            "javascript",
            "typescript",
            "html",
            "css",
            "csv",
            "bash",
            "lua",
            "luadoc",
            "dockerfile",
            -- "gitignore",
            "python",
            "cpp",
            -- "glsl",
            -- "hlsl",
            "cmake",
            "vim",
            "vimdoc",
            "latex",
            "bibtex",
            "c_sharp",
            "gitcommit",
            "git_config",
            "git_rebase",
            "gitattributes",
            "go",
            "rust",
            "toml",
            -- "wsgl",
            -- "wsgl_bevy",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlight = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-s>",
                node_incremental = "<C-s>",
                scope_incremental = false, 
                scope_decremental = "<bs>",
            },
        },
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config,
}


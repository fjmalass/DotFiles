return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function() 
        vim.cmd([[hi StatusLine ctermbg=0 cterm=NONE]]) -- transparent lualine
        require("transparent").setup({ --optiona no need to group
            groups = {
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "Type",
                "Underline",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLineNr",
                "EndOfBuffer",
            },
            extra_groups = {
                "NormalFloat",
                "TablineFill",
            },
            exclude_groups = {},
        })
    end,
}


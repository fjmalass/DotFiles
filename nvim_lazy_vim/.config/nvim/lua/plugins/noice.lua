return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
-- lazy load with
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            config = function() -- to avoid transparency error
                require("notify").setup({
                    background_colour = "#000000"
                })
            end,
        },
    },
}


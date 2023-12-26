---@diagnostic disable: lowercase-global
---
ignore = {
    "111", -- setting non-standard global variables
    "212/_.*", -- unused variables with _ prefix
    "214", -- used variables with _ prefix
    "121", -- setting read-only global variable 'vim'
    "122", -- setting read-only field of global variable 'vim'
}

-- Globals defined by C code
read_globals = {
    "vim",
}

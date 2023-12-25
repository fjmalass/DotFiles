local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- vim.print("Lazy.nvim loaded in " .. lazypath)

require('config.globals') -- setting up mapleader
require('config.options') -- setting up relative numbers, mouse etc.
require('config.keymaps') 

local opts = {
	default = { 
		lazy = true,
	},
	install = {
		colorscheme = {"nightfox"}
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = true,
	},

}

-- call lazy and setup from lua/plugins directory
require("lazy").setup('plugins', opts)

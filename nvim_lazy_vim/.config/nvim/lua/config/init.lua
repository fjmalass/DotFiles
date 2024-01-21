local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- bootstrap installation
if not vim.loop.fs_stat(lazypath) then
	-- vim.print("Installing lazy.nvim in " .. lazypath)
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
-- vim.print("lazy.nvim installed in " .. lazypath)

require("config.globals") -- setup the mapleader etc (required to be done before lazy is installed
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- setup lazy

local opts = {
	defaults = {
		lazy = true,
	},
	-- Question do we need to add a colorscheme here?
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
}

-- Setup plugins
local plugins = "plugins" -- load from plugins directory, starting with init.lua
require("lazy").setup(plugins, opts)

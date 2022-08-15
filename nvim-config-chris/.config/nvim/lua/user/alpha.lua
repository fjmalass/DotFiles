local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

dashboard.section.header.val = {
[[ _____  _    ___     _______ _______ ]],
[[|  __ \| |  | \ \   / /  __ \__   __|]],
[[| |__) | |__| |\ \_/ /| |__) | | |   ]],
[[|  _  /|  __  | \   / |  ___/  | |   ]],
[[| | \ \| |  | |  | |  | |      | |   ]],
[[|_|  \_\_|  |_|  |_|  |_|      |_|   ]],
}

local icons = require "user.icons"
dashboard.section.buttons.val = {
	button("f", icons.documents.Files .. "  Find file", ":Telescope find_files <CR>"),
	button("e", icons.ui.NewFile .. "  New file", ":ene <BAR> startinsert <CR>"),
	button("p", icons.git.Repo .. "  Find project/repo", ":Telescope projects <CR>"),
	button("r", icons.ui.History .. "  Recently used files", ":Telescope oldfiles <CR>"),
	button("t", icons.kind.TypeParameter .. "  Find text", ":Telescope live_grep <CR>"),
  -- button("s", icons.ui.SignIn .. "  Find Session", ":SearchSession<CR>"),
	button("c", icons.ui.Gear .. "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  button("u", icons.ui.CloudDownload .. "  Update", ":PackerSync<CR>"),
	button("q", icons.ui.SignOut .. "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "rhypt.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

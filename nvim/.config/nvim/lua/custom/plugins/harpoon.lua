-- You can add your own plugins here or in other files in this directory!
--
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		init = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			-- set up ui exteions
			harpoon:extend({
				UI_CREATE = function(cx)
					vim.keymap.set("n", "<C-v>", function()
						harpoon.ui:select_menu_item({ vsplit = true })
					end, { buffer = cx.bufnr, desc = "HarpoonUI: [v]ertical split" })

					vim.keymap.set("n", "<C-x>", function()
						harpoon.ui:select_menu_item({ split = true })
					end, { buffer = cx.bufnr, desc = "HarpoonUI: [x] horizontal split" })

					vim.keymap.set("n", "<C-t>", function()
						harpoon.ui:select_menu_item({ tabedit = true })
					end, { buffer = cx.bufnr, desc = "HarpoonUI: [t]ertical split" })
				end,
			})
		end,
		keys = {
			{
				"<leader>c",
				function()
					require("harpoon"):list():clear()
				end,
				desc = "Harpoon [c]lear",
			},
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon [a]dd",
			},
			{
				"<C-e>",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
				desc = "Harpoon Quick M[e]nu",
			},
			{
				"<C-1>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon Select 1",
			},
			{
				"<C-2>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon Select 2",
			},
			{
				"<C-3>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon Select 3",
			},
			{
				"<C-4>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon Select 4",
			},
			{
				"<C-5>",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "Harpoon Select 5",
			},
			{
				"<C-6>",
				function()
					require("harpoon"):list():select(6)
				end,
				desc = "Harpoon Select 6",
			},
			{
				"<C-7>",
				function()
					require("harpoon"):list():select(7)
				end,
				desc = "Harpoon Select 7",
			},

			-- Toggle previous & next buffers stored within require("harpoon") list
			{
				"<C-S-P>",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Harpoon [P]revious",
			},
			{
				"<C-S-N>",
				function()
					require("harpoon"):list():next()
				end,
				desc = "Harpoon [N]ext",
			},
			-- {
			-- 	"<C-e>",
			-- 	function()
			-- 		toggle_telescope(reuuire("harpoon"):list())
			-- 	end,
			-- 	desc = "Open harpoon window",
			-- },

			-- Toggle harpoon
		},
		config = function()
			-- Basic telescope
			-- need to be in config as it is call after the setup
			local toggle_telescope = function(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
				local conf = require("telescoe.config").values
				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end
			_G.harpoon_telescope = toggle_telescope
		end,
	},
}

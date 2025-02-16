-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function(_, opts)
			local harpoon = require("harpoon")
			harpoon:setup()
			-- Basic telescope
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
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

			-- Basic shortcuts
			vim.keymap.set("n", "<leader>c", function()
				harpoon:list():clear()
			end, { desc = "Harpoon [c]lear" })
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon [a]dd" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon Quick M[e]nu" })
			vim.keymap.set("n", "<C-1>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon Select 1" })
			vim.keymap.set("n", "<C-2>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon Select 2" })
			vim.keymap.set("n", "<C-3>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon Select 3" })
			vim.keymap.set("n", "<C-4>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon Select 4" })
			vim.keymap.set("n", "<C-5>", function()
				harpoon:list():select(5)
			end, { desc = "Harpoon Select 5" })
			vim.keymap.set("n", "<C-6>", function()
				harpoon:list():select(6)
			end, { desc = "Harpoon Select 6" })
			vim.keymap.set("n", "<C-7>", function()
				harpoon:list():select(7)
			end, { desc = "Harpoon Select 7" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end, { desc = "Harpoon [P]revious" })
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end, { desc = "Harpoon [N]ext" })

			-- Toggle harpoon
			-- vim.keymap.set("n", "<C-e>", function()
			-- 	toggle_telescope(harpoon:list())
			-- end, { desc = "Open harpoon window" })
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
	},
}

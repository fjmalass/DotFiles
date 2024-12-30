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

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon Select 1" })
			vim.keymap.set("n", "<C-j>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon Select 2" })
			vim.keymap.set("n", "<C-k>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon Select 3" })
			vim.keymap.set("n", "<C-l>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon Select 4" })
			vim.keymap.set("n", "<C-;>", function()
				harpoon:list():select(5)
			end, { desc = "Harpoon Select 5" })

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
		end,
	},
}

local pickers = require("telescope.pickers")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local config = require("telescope.config")
local actions = require("telescope.actions")

require("telescope").setup({
    defaults= {
        file_sorter = require("telescope.sorters").get_fzy_sorter, 
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
 -   --[[
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            },
    ]]
})


require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("fzy_native")


local M = {}

function M.reload_modules()
    -- from thePrimeagen (strips the lua directory)
    local lua_dirs = vim.fn.globs("./lua/*", 0, 1)
    for _, dir in ipairs(lua_dirs) do
        dir = string.gsub(dir, "./lua/", "")
        require("plenary.reload").reload_module(dir)
    end
end


M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        promt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

local function set_background(content)
    vim.fn.system("dconf write /org/mate/desktop/background/picture-filename \"'" .. content .. "'\"")

end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require("telescope.actions").close(prompt_bufrn)
        end
    end

    map("i", "<C-p>", function() 
        set_the_background()
    end)
    map("i", "<CR>", function() 
        set_the_background()
    end)
end

local function refactor(prompt_bufnr) 
    local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
    require("telescopes.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M.refactors = function() 
    require("telescope.pickers").new({}, {
        prompt_title = "refactors", 
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors(),
        }),
        sorter = require("telescope.config"). values.generic_sorters({}),
        attach_mappings = function(_, map) 
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end,
    }):find()
end

M.git_branches = function() 
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end,
    })
end

return M

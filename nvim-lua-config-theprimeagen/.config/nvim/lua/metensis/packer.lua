-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- TJ asynch
  use("nvim-lua/plenary.nvim")
  -- instead of pope/vim-fugitive
  use("TimUntersberger/neogit", {requires="nvim-lua/plenary.nvim"})
  --
  -- fuzzy finder
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  -- All the things from Theprimeagen
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("tzachar/cmp-tabnine", {run="./install.sh", requires="hrsh7th/nvim-cmp"})
  use("onsails/lspkind-nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("glepnir/lspsaga.nvim")
  use("simrat39/symbols-outline.nvim")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  use("ThePrimeagen/git-worktree.nvim")
  use("ThePrimeagen/harpoon")

  use("mbbill/undotree")

  -- comments
  use("b3nj5m1n/kommentary")

  -- Debugging
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  -- check installation with https://github.com/mfussenegger/nvim-dap-python
  -- Requires debugpy (installed in itsown virtual env. pip)
  -- also installatin of tree-sitter
  use("mfussenegger/nvim-dap-python")


  -- colorscheme
  use("gruvbox-community/gruvbox")
  use("folke/tokyonight.nvim")


  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")

  use("nvim-treesitter/nvim-treesitter", {
      run = "<cmd>TSUpdate"
  })

  --[[
  -- Simple plugins can be specified as strings
  use "9mm/vim-closer"

  -- Lazy loading:
  -- Load on specific commands
  use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

  -- Load on an autocommand event
  use {"andymass/vim-matchup", event = "VimEnter"}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    "w0rp/ale",
    ft = {"sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex"},
    cmd = "ALEEnable",
    config = "vim.cmd[[ALEEnable]]--[["
  }

  -- Plugins can have dependencies on other plugins
  use {
    "haorenW1025/completion-nvim",
    opt = true,
    requires = {{"hrsh7th/vim-vsnip", opt = true}, {"hrsh7th/vim-vsnip-integ", opt = true}}
  }

  -- Plugins can also depend on rocks from luarocks.org:
  use {
    "my/supercoolplugin",
    rocks = {"lpeg", {"lua-cjson", version = "2.1.0"}}
  }

  -- You can specify rocks in isolation
  use_rocks "penlight"
  use_rocks {"lua-resty-http", "lpeg"}

  -- Local plugins can be included
  use "~/projects/personal/hover.nvim"

  -- Plugins can have post-install/update hooks
  use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview"}

  -- Post-install/update hook with neovim command
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Post-install/update hook with call of vimscript function with argument
  use { "glacambre/firenvim", run = function() vim.fn["firenvim#install"](0) end }

  -- Use specific branch, dependency and run lua file after load
  use {
    "glepnir/galaxyline.nvim", branch = "main", config = function() require"statusline" end,
    requires = {"kyazdani42/nvim-web-devicons"}
  }

  -- Use dependency and run lua function after load
  use {
    "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup() end
  }

  -- You can specify multiple plugins in a single call
  use {"tjdevries/colorbuddy.vim", {"nvim-treesitter/nvim-treesitter", opt = true}}

  -- You can alias plugin names
  use {"dracula/vim", as = "dracula"}
end)
--]]
end)

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_boder = "rounded", -- popup with rounded border
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Manager 
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua development 
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used  lots of plugins
  -- use "christianchiarulli/lua-dev.nvim"
  
  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"

  -- todo use "SmiteshP/nvim-navic"
  -- todo use "lvimuser/lsp-inlayhints.nvim"
  -- use "simrat39/inlay-hints.nvim"
  -- use "williamboman/mason-lspconfig.nvim"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- todo use "simrat39/symbols-outline.nvim"
  -- todo use "b0o/SchemaStore.nvim"
  -- use "github/copilot.vim"
  -- todo use {
  --[[
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }
  -]]
  -- todo use "RRethy/vim-illuminate"
  -- todo use "j-hui/fidget.nvim"
  -- todo use "lvimuser/lsp-inlayhints.nvim"
  -- use "simrat39/inlay-hints.nvim"
  -- todo use "https://git.sr.ht/~whynothug
  -- todo use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"


  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim" -- may be removed with 0.8
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use("ahmedkhalf/project.nvim")
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"


  -- Colorschemes
  -- use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- cmp plugins (Completion)
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-emoji"
  use "rcarriga/cmp-dap"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Primeagen
  use "ThePrimeagen/harpoon"


  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Markdown 
  use {"iamcco/markdown-preview.nvim", run= "cd app && npm install"}
  -- hop
  use "phaazon/hop.nvim"
  --
  -- use "ur4ltz/surround.nvim"
  use "kylechui/nvim-surround"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Dap
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  -- use "Pocco81/DAPInstall.nvim" -- has been move to dap_buddy
  use "ravenxrz/DAPInstall.nvim" -- has been move to dap_buddy

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

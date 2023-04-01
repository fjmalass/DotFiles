-- install packer if it is not already
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer() -- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- theme (rose pine)
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')

    -- harpoon
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use { 'lewis6991/gitsigns.nvim', config = function()
        require('gitsigns').setup()
    end
    }

    -- lspzero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- null-ls for python formattting
    use 'jose-elias-alvarez/null-ls.nvim'

    -- screen capture for code
    -- use { 'krivahtoo/silicon.nvim', run = './install.sh build' }

    -- comment
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- debug
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-telescope/telescope-dap.nvim'
    -- debug python ( we are not using it )
    use 'mfussenegger/nvim-dap-python'
    -- debug rust (Make sure that rust-analyzer is installed, `rustup component add rust-analyzer`)
    use 'simrat39/rust-tools.nvim'

    -- Copilot (Make sure that node.js installed)
    use 'github/copilot.vim'

    -- use {'folke/which-key.nvim'}

    -- This is the last thing (synch pakcer)
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- -- autocommand to run when paker is updated
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost packer.lua source <afile> | PackerCompile
-- augroup end
-- ]])

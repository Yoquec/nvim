-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-tree/nvim-web-devicons' }


    use({
        'ellisonleao/gruvbox.nvim',
        as = 'gruvbox',
    })


    use('nvim-treesitter/nvim-treesitter', { run = ':tsupdate' })
    use { 'nvim-treesitter/playground' }

    use { 'junegunn/goyo.vim' }
    use { 'junegunn/limelight.vim' }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    }


    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use({
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    })

    use { "karoliskoncevicius/vim-sendtowindow" }
    use { 'glepnir/dashboard-nvim' }
    use('mbbill/undotree')
    use { 'preservim/nerdtree' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'vonheikemen/lsp-zero.nvim',
        requires = {
            -- lsp support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- snippets
            { 'l3mon4d3/luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- whichkey needs a lot of configuration to be useful
    -- use {
    --     "folke/which-key.nvim",
    --     config = function() require("which-key").setup {} end
    -- }

    -- firenvim
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

    --webicons
    use { 'ryanoasis/vim-devicons' }


end)

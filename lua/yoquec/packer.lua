-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Necesary plugins, can't live without these:
    -- ------------------------------------------------
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "nvim-telescope/telescope-file-browser.nvim" }

    use { 'ThePrimeagen/harpoon' }

    use { 'nvim-tree/nvim-web-devicons' }

    use { 'mfussenegger/nvim-lint' }

    use { 'mhartington/formatter.nvim' }

    use {
        'vonheikemen/lsp-zero.nvim',
        branch = "v3.x",
        requires = {
            -- lsp support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },

        }
    }

    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        requires = {
            "rafamadriz/friendly-snippets",
        },
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }

    use { 'nvim-treesitter/nvim-treesitter-context' }

    use { "karoliskoncevicius/vim-sendtowindow",
        ft = { "python", "r", "rmd" }
    }

    use { "jalvesaq/Nvim-R",
        ft = { "r" }
    }

    use('mbbill/undotree')

    use { 'tpope/vim-commentary' }

    -- Plugins that I have for pure whim
    -- ------------------------------------
    use {
        'nvim-lualine/lualine.nvim'
    }

    use { "tpope/vim-fugitive" }

    use { "ellisonleao/gruvbox.nvim" }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use { "tpope/vim-repeat" }

    use { 'nvim-treesitter/playground' }

    use { 'junegunn/goyo.vim' }

    use { 'lewis6991/gitsigns.nvim' }

    use({
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    })

    use {
        'glepnir/dashboard-nvim',
        config = function()
            require("yoquec.dashboard")
        end,
        event = 'VimEnter',
    }

    use { 'tpope/vim-surround' }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }
end)

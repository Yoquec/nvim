-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        -- Necesary plugins, can't live without these:
        -- ------------------------------------------------
        -- packer can manage itself
        use 'wbthomason/packer.nvim'


        use 'lewis6991/impatient.nvim'


        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }


        use { "nvim-telescope/telescope-file-browser.nvim" }


        use { 'nvim-tree/nvim-web-devicons' }


        -- linter (for python) and lsp
        use 'mfussenegger/nvim-lint'

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

                -- format
                { 'mhartington/formatter.nvim' },
            }
        }


        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,}


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
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }


        use({
            'ellisonleao/gruvbox.nvim',
            as = 'gruvbox',
        })


        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }


        use { 'nvim-treesitter/playground' }


        use {
            'junegunn/goyo.vim',
            requires = { { 'junegunn/limelight.vim' } },
        }


        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                -- you can configure hop the way you like here; see :h hop-config
                require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end
        }

        use {
            "ggandor/flit.nvim",
            requires = { { "ggandor/leap.nvim" } }
        }


        use({
            'norcalli/nvim-colorizer.lua',
            config = function() require('colorizer').setup() end
        })


        use {
            'glepnir/dashboard-nvim',
            event = 'VimEnter',
        }


        use { 'tpope/vim-surround' }


        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
        }

        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            }
        }

        -- firenvim
        -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    end)

return {
    -- Plugins that don't need a configuration
    { "jalvesaq/Nvim-R",                     ft = { "r" } },
    { "tpope/vim-repeat",                    event = "InsertEnter" },
    { 'tpope/vim-surround',                  event = "InsertEnter" },
    { 'tpope/vim-commentary',                event = "InsertEnter" },
    { "karoliskoncevicius/vim-sendtowindow", ft = { "python", "r", "rmd" } },
    { 'junegunn/goyo.vim',                   event = { "BufReadPre", "BufNewFile" } },
    { 'norcalli/nvim-colorizer.lua',         event = { "BufReadPre", "BufNewFile" } },
    { 'windwp/nvim-autopairs',               event = 'InsertEnter',                 opts = {} },
}

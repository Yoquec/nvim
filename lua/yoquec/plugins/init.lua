return {
    -- Plugins that don't need a configuration
    "tpope/vim-repeat",
    'junegunn/goyo.vim',
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'norcalli/nvim-colorizer.lua',
    { "jalvesaq/Nvim-R",                     ft = { "r" } },
    { "karoliskoncevicius/vim-sendtowindow", ft = { "python", "r", "rmd" } },
    { 'windwp/nvim-autopairs',               event = 'InsertEnter',        opts = {} },
}

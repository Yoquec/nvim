return {
    -- Plugins that don't need a configuration
    { "jalvesaq/Nvim-R",             ft = { "r" } },
    { 'windwp/nvim-autopairs',       event = 'InsertEnter' },
    { "tpope/vim-repeat",            event = "InsertEnter" },
    { 'tpope/vim-surround',          event = { "BufReadPost", "BufNewFile" } },
    { 'tpope/vim-commentary',        event = { "BufReadPost", "BufNewFile" } },
    { 'norcalli/nvim-colorizer.lua', event = { "BufReadPost", "BufNewFile" } },
}

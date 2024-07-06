return {
    -- Plugins that don't need a configuration
    { "jalvesaq/Nvim-R",       ft = { "r" } },
    { "tpope/vim-repeat",      event = "InsertEnter" },
    { 'tpope/vim-surround',    event = { "BufReadPost", "BufNewFile" } },
    { 'tpope/vim-commentary',  event = { "BufReadPost", "BufNewFile" } },
    { 'windwp/nvim-autopairs', event = { 'InsertEnter' },              opts = {} },
    {
        'folke/todo-comments.nvim',
        opts = {},
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'norcalli/nvim-colorizer.lua',
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>ca", "<cmd>ColorizerAttachToBuffer<cr>", desc = "Attach colorizer to the currect buffer" }
        }
    },
}

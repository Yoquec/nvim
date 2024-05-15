return {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "vimdoc", "javascript", "python", "c", "lua", "rust", "markdown", "markdown_inline", },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true }
        })
    end,
    keys = { {'<leader>tc', [[<cmd>vim.cmd.TSContextToggle<CR>]], desc = "Toggles treesitter context" } }
}

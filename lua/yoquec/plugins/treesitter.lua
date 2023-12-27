return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/playground',
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
    end
}

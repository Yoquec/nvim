return {
    'folke/todo-comments.nvim',
    opts = {},
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<Leader>ft", vim.cmd.TodoTelescope }
    },
}

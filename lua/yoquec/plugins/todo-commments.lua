return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<Leader>ft", vim.cmd.TodoTelescope }
    }
}

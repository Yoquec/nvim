return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "VeryLazy",
    keys = {
        { "<Leader>ft", vim.cmd.TodoTelescope }
    }
}

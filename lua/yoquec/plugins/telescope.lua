return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fv', vim.cmd.Ex, {})
        vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
    end
}

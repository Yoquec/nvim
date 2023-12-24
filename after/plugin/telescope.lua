local builtin = require('telescope.builtin')

-- File browsing
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fv', vim.cmd.Ex, {})

-- Open buffers
vim.keymap.set('n', '<leader>bi', builtin.buffers, {})

-- Greps
vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep search > ") })
end)

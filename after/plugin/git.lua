require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '≃' },
        untracked = { text = '?' },
    },
    signcolumn = true,
    current_line_blame = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = false,

    on_attach = function(bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- Navigation
        vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk'", { expr = true }, opts)
        vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk'", { expr = true }, opts)

        -- Actions
        vim.keymap.set('n', '<leader>hs', [[<cmd>Gitsigns stage_hunk<CR>]], opts)
        vim.keymap.set('v', '<leader>hs', [[<cmd>Gitsigns stage_hunk<CR>]], opts)
        vim.keymap.set('n', '<leader>hr', [[<cmd>Gitsigns reset_hunk<CR>]], opts)
        vim.keymap.set('v', '<leader>hr', [[<cmd>Gitsigns reset_hunk<CR>]], opts)
        vim.keymap.set('n', '<leader>hS', [[<cmd>Gitsigns stage_buffer<CR>]], opts)
        vim.keymap.set('n', '<leader>hu', [[<cmd>Gitsigns undo_stage_hunk<CR>]], opts)
        vim.keymap.set('n', '<leader>hR', [[<cmd>Gitsigns reset_buffer<CR>]], opts)
        vim.keymap.set('n', '<leader>hp', [[<cmd>Gitsigns preview_hunk<CR>]], opts)
        vim.keymap.set('n', '<leader>hB', [[<cmd>Gitsigns blame_line<CR>]], opts)
        vim.keymap.set('n', '<leader>vb', [[<cmd>Gitsigns blame_line<CR>]], opts)
        vim.keymap.set('n', '<leader>hc', [[<cmd>Gitsigns toggle_current_line_blame<CR>]], opts)
        vim.keymap.set('n', '<leader>hCc', [[<cmd>Git commit<CR>]], opts)
        vim.keymap.set('n', '<leader>hCa', [[<cmd>Git commit --amend<CR>]], opts)
        vim.keymap.set('n', '<leader>hd', [[<cmd>Gitsigns diffthis<CR>]], opts)
        vim.keymap.set('n', '<leader>hD', [[<cmd>lua require"gitsigns".diffthis("~")<CR>]], opts)
        vim.keymap.set('n', '<leader>td', [[<cmd>Gitsigns toggle_deleted<CR>]], opts)

        -- Text object
        vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
        vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)

        -- Fugitive (commands that require git to be attached to a buffer)
        vim.keymap.set('n', '<leader>hb', [[<cmd>Git blame<CR>]], opts)
    end
}

-- Fugitive (commands that DONT require git to be attached)
vim.keymap.set('n', '<leader>hg', vim.cmd.Git)
vim.keymap.set('n', '<leader>hll', [[<cmd>Git log<CR>]])
vim.keymap.set('n', '<leader>hlo', [[<cmd>Git log --oneline<CR>]])
vim.keymap.set('n', '<leader>hlao', [[<cmd>Git log --all --oneline<CR>]])
vim.keymap.set('n', '<leader>hlg', [[<cmd>Git log --graph<CR>]])
vim.keymap.set('n', '<leader>hlag', [[<cmd>Git log --all --graph<CR>]])

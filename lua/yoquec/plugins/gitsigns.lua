return {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        signs = {
            add          = { text = '┃' },
            delete       = { text = '┃' },
            topdelete    = { text = '┃' },
            change       = { text = '┃' },
            changedelete = { text = '┃' },
            untracked    = { text = '┆' },
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
            vim.keymap.set('n', ']c', [[<cmd>Gitsigns next_hunk<CR>]], opts)
            vim.keymap.set('n', '[c', [[<cmd>Gitsigns prev_hunk<CR>]], opts)

            -- Actions
            vim.keymap.set({ 'n', 'v' }, '<leader>gs', [[<cmd>Gitsigns stage_hunk<CR>]], opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>gr', [[<cmd>Gitsigns reset_hunk<CR>]], opts)
            vim.keymap.set('n', '<leader>gS', [[<cmd>Gitsigns stage_buffer<CR>]], opts)
            vim.keymap.set('n', '<leader>gR', [[<cmd>Gitsigns reset_buffer<CR>]], opts)
            vim.keymap.set('n', '<leader>gu', [[<cmd>Gitsigns undo_stage_hunk<CR>]], opts)
            vim.keymap.set('n', '<leader>gp', [[<cmd>Gitsigns preview_hunk<CR>]], opts)
            vim.keymap.set('n', '<leader>gl', [[<cmd>Gitsigns blame_line<CR>]], opts)
            vim.keymap.set('n', '<leader>gtb', [[<cmd>Gitsigns toggle_current_line_blame<CR>]], opts)
            vim.keymap.set('n', '<leader>gd', [[<cmd>Gitsigns diffthis<CR>]], opts)
            vim.keymap.set('n', '<leader>gD', [[<cmd>lua require"gitsigns".diffthis("~")<CR>]], opts)
            vim.keymap.set('n', '<leader>gtd', [[<cmd>Gitsigns toggle_deleted<CR>]], opts)
            vim.keymap.set('n', '<leader>gcc', [[<cmd>G commit<CR>]], opts)
            vim.keymap.set('n', '<leader>gca', [[<cmd>G commit --amend<CR>]], opts)
        end

    }
}

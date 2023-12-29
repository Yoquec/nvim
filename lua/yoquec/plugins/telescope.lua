return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-telescope/telescope-file-browser.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
        local fb_actions = require("telescope").extensions.file_browser.actions
        local builtin = require('telescope.builtin')
        local telescope_actions = require("telescope.actions")

        require("telescope").setup {
            extensions = {
                file_browser = {
                    theme = "ivy",
                    path = "%:p:h",
                    mappings = {
                        ["n"] = {
                            ['%'] = fb_actions.create,
                            D = fb_actions.remove,
                            ['<C-n>'] = telescope_actions.move_selection_next,
                            ['<C-p>'] = telescope_actions.move_selection_previous,
                        },
                    },
                },
            },
        }

        require("telescope").load_extension "file_browser"

        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fv', [[<cmd>Telescope file_browser<cr>]], {})
        vim.keymap.set('n', '<leader>fb', vim.cmd.Ex, {})
        vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
    end
}

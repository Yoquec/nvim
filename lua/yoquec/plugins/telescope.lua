return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = { 'nvim-telescope/telescope-file-browser.nvim', 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
        local fb_actions = require("telescope").extensions.file_browser.actions
        local builtin = require('telescope.builtin')
        local telescope_actions = require("telescope.actions")

        require("telescope").setup {
            defaults = {
                -- set the prompt at the top
                layout_config = {
                    horizontal = {
                        prompt_position = "top"
                    }
                },
            },
            pickers = {
                keymaps = {
                    theme = "dropdown"
                },
                marks = {
                    theme = "dropdown"
                },
                help_tags = {
                    theme = "dropdown"
                },
                commands = {
                    theme = "dropdown"
                },
            },
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
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({})
                }
            },
        }

        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("ui-select")

        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fv', [[<cmd>Telescope file_browser<cr>]], {})
        vim.keymap.set('n', '<leader>fb', vim.cmd.Ex, {})
        vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fm', builtin.marks, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
    end
}

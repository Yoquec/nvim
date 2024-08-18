return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
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
                keymaps = { theme = "dropdown" },
                marks = { theme = "dropdown" },
                help_tags = { theme = "dropdown" },
                builtin = { theme = "dropdown" },
                diagnostics = { theme = "dropdown" },
                git_status = { theme = "dropdown" },
                git_branches = { theme = "dropdown" },
                lsp_type_definitions = {theme = "dropdown"},
                lsp_document_symbols = {theme = "dropdown"},
                lsp_workspace_symbols = {theme = "dropdown"},
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
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fM', builtin.marks, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
        vim.keymap.set('n', '<Leader>fi', builtin.builtin, {})
        vim.keymap.set('n', '<Leader>fd', builtin.diagnostics, {})
        vim.keymap.set('n', '<Leader>fs', builtin.spell_suggest, {})
        vim.keymap.set('n', '<Leader>fq', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>fgf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})
        vim.keymap.set('n', '<Leader>flr', builtin.lsp_references, {})
        vim.keymap.set('n', '<Leader>fld', builtin.lsp_definitions, {})
        vim.keymap.set('n', '<Leader>fli', builtin.lsp_implementations, {})
        vim.keymap.set('n', '<Leader>flt', builtin.lsp_type_definitions, {})
        vim.keymap.set('n', '<Leader>fls', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<Leader>flw', builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', '<leader>fv', [[<cmd>Telescope file_browser<cr>]], {})
        vim.keymap.set('n', "<Leader>ft", [[<cmd>TodoTelescope theme=dropdown initial_mode=normal<cr>]], {})
    end
}

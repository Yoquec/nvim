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
                lsp_type_definitions = { theme = "dropdown" },
                lsp_document_symbols = { theme = "dropdown" },
                lsp_workspace_symbols = { theme = "dropdown" },
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

        -- Extensions
        vim.keymap.set('n', '<leader>fv', [[<cmd>Telescope file_browser<cr>]],
            { desc = "Telescope file browser" })
        vim.keymap.set('n', "<Leader>ft", [[<cmd>TodoTelescope theme=dropdown<cr>]],
            { desc = "Telescope ToDo picker" })

        -- File search
        vim.keymap.set('n', '<Leader>ff', builtin.find_files,
            { desc = "Telescope find files" })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles,
            { desc = "Telescope find old files" })
        vim.keymap.set('n', '<leader>fgf', builtin.git_files,
            { desc = "Telescope git files picker" })

        -- Content searching
        vim.keymap.set('n', '<leader>fp', builtin.live_grep,
            { desc = "Telescope live grep" })
        vim.keymap.set('n', '<Leader>fq', builtin.current_buffer_fuzzy_find,
            { desc = "Telescope current buffer fuzzy find" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers,
            { desc = "Telescope open buffer picker" })
        vim.keymap.set('n', '<leader>fM', builtin.marks,
            { desc = "Telescope marks picker" })

        -- Git operations
        vim.keymap.set('n', '<leader>fgc', builtin.git_commits,
            { desc = "Telescope git commit picker" })
        vim.keymap.set('n', '<leader>fgb', builtin.git_branches,
            { desc = "Telescope git branches picker" })
        vim.keymap.set('n', '<leader>fgs', builtin.git_status,
            { desc = "Telescope git status" })
        vim.keymap.set('n', '<leader>fgS', builtin.git_stash,
            { desc = "Telescope git stash picker" })

        -- LSP operations
        vim.keymap.set('n', '<Leader>flr', builtin.lsp_references,
            { desc = "Telescope LSP references" })
        vim.keymap.set('n', '<Leader>fld', builtin.lsp_definitions,
            { desc = "Telescope LSP definitions" })
        vim.keymap.set('n', '<Leader>fli', builtin.lsp_implementations,
            { desc = "Telescope LSP implementations" })
        vim.keymap.set('n', '<Leader>flt', builtin.lsp_type_definitions,
            { desc = "Telescope LSP type definitions" })
        vim.keymap.set('n', '<Leader>fls', builtin.lsp_document_symbols,
            { desc = "Telescope LSP buffer symbols" })
        vim.keymap.set('n', '<Leader>flS', builtin.lsp_workspace_symbols,
            { desc = "Telescope LSP workspace symbols" })
        vim.keymap.set('n', '<Leader>fd', builtin.diagnostics,
            { desc = "Telescope LSP diagnostics" })

        -- Misc
        vim.keymap.set('n', '<leader>fc', builtin.commands,
            { desc = "Telescope command picker" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,
            { desc = "Telescope help picker" })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps,
            { desc = "Telescope keymap picker" })
        vim.keymap.set('n', '<Leader>fi', builtin.builtin,
            { desc = "Telescope picker picker (lol)" })
        vim.keymap.set('n', '<Leader>fs', builtin.spell_suggest,
            { desc = "Telescope spelling suggestions" })
    end
}

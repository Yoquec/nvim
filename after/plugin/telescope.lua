local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            mappings = {
                ["n"] = {
                    ['%'] = fb_actions.create
                },
            },
            path = "%:p:h",
        },
    },
}

require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')

-- FILE browsing
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})

-- OPEN buffers
vim.keymap.set('n', '<leader>bi', builtin.buffers, {})

-- GREPS
vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep search > ") })
end)

vim.api.nvim_set_keymap(
    "n",
    "<space>vf",
    ":Telescope file_browser<CR>",
    { noremap = true }
)

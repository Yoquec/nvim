vim.keymap.set('n', "<leader>tf", vim.cmd.NeoTreeShowToggle)

-- mappings consistent with netrw
require("neo-tree").setup({
    window = {
        mappings = {
            ["%"] = {
                "add",
                config = {
                    show_path = "none"
                }
            }
        }
    }
})

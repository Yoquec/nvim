local colors = require("yoquec.core.theme.colors")
local highlights = require("yoquec.core.theme.highlights")

return {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup {
            terminal_colors = false,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            transparent_mode = true,
            invert_selection = true,
            palette_overrides = colors.gen_theme(),
            overrides = highlights.groups,
        }
        vim.cmd.colorscheme("gruvbox")
    end
}

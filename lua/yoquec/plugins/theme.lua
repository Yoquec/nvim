local accent = "#fbf1c7"
local accent_dim = "#808080"
local black = "#000000"

return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "soft",
            transparent_mode = true,
            invert_selection = true,
            overrides = {
                LineNr = { fg = accent },
                LineNrAbove = { fg = accent_dim },
                LineNrBelow = { fg = accent_dim },
                StatusLine = { fg = accent, bg = "none" },
                StatusLineNC = { fg = accent_dim, bg = "none" },
                LspInfoBorder = { fg = accent },
                TelescopeTitle = { fg = black, bg = accent }
            }
        })

        vim.cmd([[colorscheme gruvbox]])
    end
}

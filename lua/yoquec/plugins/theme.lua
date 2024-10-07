local accent = "#fbf1c7"
local accent_dim = "#808080"
local black = "#000000"
local green = "#98971A"
local purple = "#B16286"
local yellow = "#EEBD35"
local red = "#CC241C"
local cyan = "#8EC07E"

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
                TelescopeTitle = { fg = black, bg = accent },
                DashboardHeader = { fg = green },
                DashboardDesc = { fg = purple },
                DashboardShortCut = { fg = yellow },
                DashboardKey = { fg = red },
                DashboardFooter = { fg = cyan }
            }
        })

        vim.cmd([[colorscheme gruvbox]])
    end
}

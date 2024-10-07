local accent = "#fbf1c7"
local accent_dim = "#808080"
local black = "#000000"
local green = "#98971A"
local purple = "#B16286"
local yellow = "#EEBD35"
local red = "#FB4934"
local cyan = "#8EC07E"
local orange = "#FB4934"
local gray = "#A89984"

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
                DashboardFooter = { fg = cyan },

                -- Markdown
                ["@markup.heading.1.marker.markdown"] = { fg = red, bold = true },
                ["@markup.heading.1.markdown"] = { fg = red, bold = true },
                ["@markup.heading.2.marker.markdown"] = { fg = orange, bold = true },
                ["@markup.heading.2.markdown"] = { fg = orange, bold = true },
                ["@markup.heading.3.marker.markdown"] = { fg = yellow, bold = true },
                ["@markup.heading.3.markdown"] = { fg = yellow, bold = true },
                ["@markup.heading.4.marker.markdown"] = { fg = green, bold = true },
                ["@markup.heading.4.markdown"] = { fg = green, bold = true },
                ["@markup.heading.5.marker.markdown"] = { fg = cyan, bold = true },
                ["@markup.heading.5.markdown"] = { fg = cyan, bold = true },
                ["@markup.heading.6.marker.markdown"] = { fg = purple, bold = true },
                ["@markup.heading.6.markdown"] = { fg = purple, bold = true },

                ["@markup.strong.markdown_inline"] = { fg = cyan, bold = true },
                ["@markup.italic.markdown_inline"] = { fg = green, italic = true },
                ["@markup.raw.markdown_inline"] = { fg = red, bg = accent_dim },
                ["@markup.quote.markdown"] = { fg = gray, italic = true },
            }
        })

        vim.cmd([[colorscheme gruvbox]])
    end
}

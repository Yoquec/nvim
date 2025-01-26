return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        local palette = require("gruvbox").palette

        local accent, accent_alt
        if vim.o.bg == "dark" then
            accent =  palette.light0
            accent_alt = palette.dark0
        else
            accent =  palette.dark0
            accent_alt = palette.light0
        end

        require("gruvbox").setup({
            contrast = "hard",
            transparent_mode = true,
            invert_selection = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = true,
              },
            overrides = {
                LineNr = { fg = accent },
                LineNrAbove = { fg = palette.dark4 },
                LineNrBelow = { fg = palette.dark4 },
                TreesitterContextLineNumber = { fg = accent_alt, bg = accent },
                TreesitterContextLineNumberBottom = { fg = accent_alt, bg = accent },

                StatusLine = { fg = accent, bg = accent_alt },
                StatusLineNC = { fg = accent_alt, bg = accent },

                LspInfoBorder = { fg = accent },

                TelescopeTitle = { fg = accent_alt, bg = accent },

                DashboardHeader = { fg = palette.bright_green },
                DashboardDesc = { fg = palette.bright_purple },
                DashboardShortCut = { fg = palette.bright_yellow },
                DashboardKey = { fg = palette.bright_red },
                DashboardFooter = { fg = palette.bright_aqua },

                -- Markdown
                ["@markup.heading.1.marker.markdown"] = { fg = palette.bright_red, bold = true },
                ["@markup.heading.1.markdown"] = { fg = palette.bright_red, bold = true },
                ["@markup.heading.2.marker.markdown"] = { fg = palette.bright_orange, bold = true },
                ["@markup.heading.2.markdown"] = { fg = palette.bright_orange, bold = true },
                ["@markup.heading.3.marker.markdown"] = { fg = palette.bright_yellow, bold = true },
                ["@markup.heading.3.markdown"] = { fg = palette.bright_yellow, bold = true },
                ["@markup.heading.4.marker.markdown"] = { fg = palette.bright_green, bold = true },
                ["@markup.heading.4.markdown"] = { fg = palette.bright_green, bold = true },
                ["@markup.heading.5.marker.markdown"] = { fg = palette.bright_aqua, bold = true },
                ["@markup.heading.5.markdown"] = { fg = palette.bright_aqua, bold = true },
                ["@markup.heading.6.marker.markdown"] = { fg = palette.bright_purple, bold = true },
                ["@markup.heading.6.markdown"] = { fg = palette.bright_purple, bold = true },

                ["@markup.strong.markdown_inline"] = { fg = palette.bright_aqua, bold = true },
                ["@markup.italic.markdown_inline"] = { fg = palette.bright_green, italic = true },
                ["@markup.raw.markdown_inline"] = { fg = palette.bright_red, bg = accent_alt },
                ["@markup.quote.markdown"] = { fg = palette.gray, italic = true },
            }
        })

        vim.cmd([[colorscheme gruvbox]])
    end
}

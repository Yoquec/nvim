return {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("yoquec.core.colors").get_base_colors()
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
            contrast = "soft",
            invert_selection = true,
            palette_overrides = palette,
            overrides = {
                -- Remove background color to match terminal
                GruvboxBg0 = { fg = "none" },

                -- Hightlight current line number
                LineNr = { fg = palette.accent, bold = true },
                LineNrAbove = { fg = palette.bg4, bold = false },
                LineNrBelow = { fg = palette.bg4, bold = false },
                TreesitterContextLineNumber = { fg = palette.bg4, bold = false },

                -- Tabline
                TabLine = { bg = palette.bg },
                TabLineSel = { bg = palette.bg },
                TabLineFill = { bg = palette.bg },

                -- Change Mason's background
                MasonNormal = { bg = palette.bg0, fg = palette.fg1 },

                -- Change Dashboard colors
                DashboardHeader = { fg = palette.neutral_green },
                DashboardDesc = { fg = palette.neutral_purple },
                DashboardShortCut = { fg = palette.neutral_yellow },
                DashboardKey = { fg = palette.red },
                DashboardFooter = { fg = palette.neutral_blue },

                -- Python
                ["@variable.python"] = { fg = palette.yellow },

                -- Typescript
                ["@lsp.type.variable.typescript"] = { fg = palette.yellow },

                -- Markdown
                -- colored headings
                ["@markup.heading.1.marker.markdown"] = { fg = palette.red, bold = true },
                ["@markup.heading.1.markdown"] = { fg = palette.red, bold = true },
                ["@markup.heading.2.marker.markdown"] = { fg = palette.orange, bold = true },
                ["@markup.heading.2.markdown"] = { fg = palette.orange, bold = true },
                ["@markup.heading.3.marker.markdown"] = { fg = palette.yellow, bold = true },
                ["@markup.heading.3.markdown"] = { fg = palette.yellow, bold = true },
                ["@markup.heading.4.marker.markdown"] = { fg = palette.green, bold = true },
                ["@markup.heading.4.markdown"] = { fg = palette.green, bold = true },
                ["@markup.heading.5.marker.markdown"] = { fg = palette.blue, bold = true },
                ["@markup.heading.5.markdown"] = { fg = palette.blue, bold = true },
                ["@markup.heading.6.marker.markdown"] = { fg = palette.purple, bold = true },
                ["@markup.heading.6.markdown"] = { fg = palette.purple, bold = true },

                -- headlines
                ["ColorColumn"] = { fg = "none", bg = "none" },
                ["@headlines.heading.1"] = { bg = palette.bg_red },
                ["@headlines.heading.2"] = { bg = palette.bg_orange },
                ["@headlines.heading.3"] = { bg = palette.bg_yellow },
                ["@headlines.heading.4"] = { bg = palette.bg_green },
                ["@headlines.heading.5"] = { bg = palette.bg_blue },
                ["@headlines.heading.6"] = { bg = palette.bg_purple },
                ["@markup.strong.markdown_inline"] = { fg = palette.blue, bold = true },
                ["@markup.italic.markdown_inline"] = { italic = true },
                ["@markup.quote.markdown"] = { fg = palette.fg3, italic = true },

                -- dap
                ["@dap.breakpoint"] = { fg = palette.red, bg = palette.bg_red },
                ["@dap.logpoint"] = { fg = palette.blue, bg = palette.bg_blue },
                ["@dap.stopped"] = { fg = palette.yellow, bg = palette.bg_yellow },

                -- diagnostics
                DiagnosticVirtualTextError = { fg = palette.red, bg = palette.bg_red},
                DiagnosticVirtualTextWarn = { fg = palette.yellow, bg = palette.bg_yellow},
                DiagnosticVirtualTextInfo = { fg = palette.blue, bg = palette.bg_blue},
                DiagnosticVirtualTextHint = { fg = palette.aqua, bg = palette.bg_aqua},



            },
            transparent_mode = true,

        }
        vim.cmd.colorscheme("gruvbox")
    end
}

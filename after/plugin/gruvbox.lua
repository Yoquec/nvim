local palette = require("yoquec.colors").get_base_colors()

require("gruvbox").setup({
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
        GruvboxBg0 = { fg = palette.bg },

        -- Hightlight current line number
        LineNr = { fg = palette.accent, bold = true },
        LineNrAbove = { fg = palette.bg4, bold = false },
        LineNrBelow = { fg = palette.bg4, bold = false },

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

        -- Modify telescope
        TelescopeTitle = { fg = palette.accent, bold = true },
        TelescopePromptNormal = { bg = palette.bg0 },
        TelescopePromptBorder = { fg = palette.bg0, bg = palette.bg0 },
        TelescopeResultsNormal = { fg = palette.fg2, bg = palette.bg0 },
        TelescopeResultsBorder = { fg = palette.bg0, bg = palette.bg0 },
        TelescopePreviewNormal = { bg = palette.bg0 },
        TelescopePreviewBorder = { bg = palette.bg0, fg = palette.bg0 },

        -- Python
        ["@variable.python"] = { fg = palette.yellow },

        -- Typescript
        ["@lsp.type.variable.typescript"] = { fg = palette.yellow },

        -- Markdown
        -- colored headings
        ["@text.title.1.marker.markdown"] = { fg = palette.red, bold = true },
        ["@text.title.1.markdown"] = { fg = palette.red, bold = true },
        ["@text.title.2.marker.markdown"] = { fg = palette.orange, bold = true },
        ["@text.title.2.markdown"] = { fg = palette.orange, bold = true },
        ["@text.title.3.marker.markdown"] = { fg = palette.yellow, bold = true },
        ["@text.title.3.markdown"] = { fg = palette.yellow, bold = true },
        ["@text.title.4.marker.markdown"] = { fg = palette.green, bold = true },
        ["@text.title.4.markdown"] = { fg = palette.green, bold = true },
        ["@text.title.5.marker.markdown"] = { fg = palette.blue, bold = true },
        ["@text.title.5.markdown"] = { fg = palette.blue, bold = true },
        ["@text.title.6.marker.markdown"] = { fg = palette.purple, bold = true },
        ["@text.title.6.markdown"] = { fg = palette.purple, bold = true },

        -- other highlight groups
        ["@text.strong.markdown_inline"] = { fg = palette.blue, bold = true },
        ["@text.quote.markdown"] = { fg = palette.fg3 },


    },
    transparent_mode = true,
})

vim.cmd.colorscheme("gruvbox")

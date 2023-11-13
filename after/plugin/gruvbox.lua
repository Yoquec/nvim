local palette = require("yoquec.colors").get_base_colors()

require("gruvbox").setup({
    terminal_colors = true,
    undercurl = true,
    -- underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    contrast = "soft",
    palette_overrides = palette,
    overrides = {
        -- Remove background color to match terminal
        GruvboxBg0 = { fg = "none" },

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

        -- Python modifications
        ["@variable.python"] = { fg = palette.yellow },
        ["@lsp.type.variable.typescript"] = { fg = palette.yellow },

    },
    transparent_mode = true,
})

vim.cmd.colorscheme("gruvbox")


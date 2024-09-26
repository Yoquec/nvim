local colors = require("yoquec.core.colors")
local components = colors.components
local palette = colors.palette

local bg = components.ui.bg.normal
local fg = components.ui.fg.normal

return {
    --- custom hightlight groups
    groups = {
        -- remove background color to match terminal
        GruvboxBg0 = { fg = "none" },

        -- highlight current line number
        LineNr = { fg = components.ui.accent, bold = true },
        LineNrAbove = { fg = components.ui.gutter.line_number, bold = false },
        LineNrBelow = { fg = components.ui.gutter.line_number, bold = false },
        TreesitterContextLineNumber = { fg = components.ui.gutter.line_number, bold = false },

        -- tabline
        TabLine = { bg = bg },
        TabLineSel = { bg = bg },
        TabLineFill = { bg = bg },

        -- Mason's background
        MasonNormal = { bg = bg, fg = fg },

        -- change Dashboard colors
        DashboardHeader = { fg = components.dashboard.header },
        DashboardDesc = { fg = components.dashboard.description },
        DashboardShortCut = { fg = components.dashboard.shortcut },
        DashboardKey = { fg = components.dashboard.key },
        DashboardFooter = { fg = components.dashboard.footer },

        -- python
        ["@variable.python"] = { fg = palette.bright_yellow },

        -- typescript
        ["@lsp.type.variable.typescript"] = { fg = palette.bright_yellow },

        -- markdown
        -- colored headings
        ["@markup.heading.1.marker.markdown"] = { fg = components.highlights.fg.red, bold = true },
        ["@markup.heading.1.markdown"] = { fg = components.highlights.fg.red, bold = true },
        ["@markup.heading.2.marker.markdown"] = { fg = components.highlights.fg.orange, bold = true },
        ["@markup.heading.2.markdown"] = { fg = components.highlights.fg.orange, bold = true },
        ["@markup.heading.3.marker.markdown"] = { fg = components.highlights.fg.yellow, bold = true },
        ["@markup.heading.3.markdown"] = { fg = components.highlights.fg.yellow, bold = true },
        ["@markup.heading.4.marker.markdown"] = { fg = components.highlights.fg.green, bold = true },
        ["@markup.heading.4.markdown"] = { fg = components.highlights.fg.green, bold = true },
        ["@markup.heading.5.marker.markdown"] = { fg = components.highlights.fg.blue, bold = true },
        ["@markup.heading.5.markdown"] = { fg = components.highlights.fg.blue, bold = true },
        ["@markup.heading.6.marker.markdown"] = { fg = components.highlights.fg.purple, bold = true },
        ["@markup.heading.6.markdown"] = { fg = components.highlights.fg.purple, bold = true },

        -- headlines
        ["ColorColumn"] = { fg = "none", bg = "none" },
        ["@headlines.heading.1"] = { bg = components.highlights.bg.red },
        ["@headlines.heading.2"] = { bg = components.highlights.bg.orange },
        ["@headlines.heading.3"] = { bg = components.highlights.bg.yellow },
        ["@headlines.heading.4"] = { bg = components.highlights.bg.green },
        ["@headlines.heading.5"] = { bg = components.highlights.bg.blue },
        ["@headlines.heading.6"] = { bg = components.highlights.bg.purple },

        -- inline text
        ["@markup.strong.markdown_inline"] = { fg = palette.bright_blue, bold = true },
        ["@markup.italic.markdown_inline"] = { fg = palette.bright_green, italic = true },
        ["@markup.raw.markdown_inline"] = { fg = palette.bright_red, bg = palette.dark3 },
        ["@markup.quote.markdown"] = { fg = palette.light3, italic = true },

        -- dap
        ["@dap.breakpoint"] = { fg = components.highlights.fg.red, bg = components.highlights.bg.red },
        ["@dap.logpoint"] = { fg = components.highlights.fg.blue, bg = components.highlights.bg.blue },
        ["@dap.stopped"] = { fg = components.highlights.fg.yellow, bg = components.highlights.bg.yellow },

        -- diagnostics
        DiagnosticVirtualTextError = { fg = components.diagnostics.error, bg = components.highlights.bg.red },
        DiagnosticVirtualTextWarn = { fg = components.diagnostics.warn, bg = components.highlights.bg.yellow },
        DiagnosticVirtualTextInfo = { fg = components.diagnostics.info, bg = components.highlights.bg.blue },
        DiagnosticVirtualTextHint = { fg = components.diagnostics.hint, bg = components.highlights.bg.aqua },

        -- LspInfo
        LspInfoBorder = { fg = components.ui.border },

        -- gitsigns colors
        GitSignsAdd = { fg = components.vcs.added },
        GitSignsChange = { fg = components.vcs.modified },
        GitSignsDelete = { fg = components.vcs.removed },
        GitSignsUntracked = { fg = components.vcs.untracked },

        -- Telescope
        TelescopeTitle = { fg = components.ui.bg.dark, bg = components.ui.accent }
    }
}

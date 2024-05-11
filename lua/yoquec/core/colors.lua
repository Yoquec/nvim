-- -------------------------------------------
-- Custom gruvbox colors. Inspired on [moonbow]
-- (https://github.com/arturgoms/moonbow.nvim)
-- Credits: arturgoms
-- -------------------------------------------

--- custom colors
local M = {}

--- modified gruvbox palette
M.palette = {
    dark0_hard     = "#0A0E14",
    dark0          = "#282828",
    dark0_soft     = "#32302f",
    dark1          = "#00010A",
    dark2          = "#504945",
    dark3          = "#665c54",
    dark4          = "#7c6f64",
    dark5          = "#3a3e42",
    dark6          = "#1b2636",
    light0_hard    = "#f9f5d7",
    light0         = "#fbf1c7",
    light0_soft    = "#f2e5bc",
    light1         = "#ebdbb2",
    light2         = "#d5c4a1",
    light3         = "#bdae93",
    light4         = "#a89984",
    bright_red     = "#fb4934",
    bright_green   = "#b8bb26",
    bright_yellow  = "#fabd2f",
    bright_blue    = "#83a598",
    bright_purple  = "#d3869b",
    bright_aqua    = "#8ec07c",
    bright_orange  = "#fe8019",
    neutral_red    = "#cc241d",
    neutral_green  = "#98971a",
    neutral_yellow = "#d79921",
    neutral_blue   = "#458588",
    neutral_purple = "#b16286",
    neutral_aqua   = "#689d6a",
    neutral_orange = "#d65d0e",
    faded_red      = "#9d0006",
    faded_green    = "#79740e",
    faded_yellow   = "#b57614",
    faded_blue     = "#076678",
    faded_purple   = "#8f3f71",
    faded_aqua     = "#427b58",
    faded_orange   = "#af3a03",
    gray           = "#928374",
}

--- colors for different editor components
M.components = {
    ui          = {
        accent    = "#fabd2f",
        border    = M.palette.dark3,
        panel     = {
            bg     = "#0D1016",
            shadow = "#00010A",
            border = "#000000",
        },
        gutter    = {
            bg = "none",
            line_number = M.palette.dark4
        },
        --- table of backgound colors
        bg        = {
            normal = "none",
            dark = M.palette.dark0_hard
        },
        --- table of foreground colors
        fg        = {
            normal = M.palette.light0,
        }
    },

    tokens      = {
        tag      = "#076678",
        func     = "#d79921",
        entity   = "#458588",
        string   = "#8ec07c",
        regexp   = "#427b58",
        markup   = "#fb4934",
        keyword  = "#FF8F40",
        special  = "#b57614",
        comment  = "#626A73",
        constant = "#f2e5bc",
        operator = "#fe8019",
    },

    diagnostics = {
        error = M.palette.bright_red,
        warn  = M.palette.neutral_yellow,
        info  = M.palette.neutral_blue,
        hint  = M.palette.neutral_aqua
    },

    vcs         = {
        added    = "#91B362",
        modified = "#6994BF",
        removed  = "#D96C75",
        bg       = {
            added   = "#1D2214",
            removed = "#2D2220",
        }
    },

    dashboard   = {
        header = M.palette.neutral_green,
        description = M.palette.neutral_purple,
        shortcut = M.palette.neutral_yellow,
        key = M.palette.bright_red,
        footer = M.palette.neutral_blue
    },

    highlights  = {
        bg = {
            red    = "#261B1B",
            orange = "#261E1B",
            yellow = "#26251B",
            green  = "#1D261B",
            blue   = "#1B2226",
            aqua   = "#1B2626",
            purple = "#261B26",
        },
        fg = {
            red    = M.palette.bright_red,
            orange = M.palette.bright_orange,
            yellow = M.palette.bright_yellow,
            green  = M.palette.bright_green,
            blue   = M.palette.bright_blue,
            aqua   = M.palette.bright_aqua,
            purple = M.palette.bright_purple,
        }
    },

}

--- returns a table that may be used in the palette overrides
M.gen_theme = function()
    return {
        bg = M.components.ui.bg.normal,
        fg = M.components.ui.fg.normal,
        bg0 = M.palette.dark0_hard,
        bg1 = M.palette.dark1,
        bg2 = M.palette.dark2,
        bg3 = M.palette.dark3,
        bg4 = M.palette.dark4,
        bg5 = M.palette.dark5,
        bg6 = M.palette.dark6,
        fg0 = M.palette.light0,
        fg1 = M.palette.light1,
        fg2 = M.palette.light2,
        fg3 = M.palette.light3,
        fg4 = M.palette.light4,
        red = M.palette.bright_red,
        green = M.palette.bright_green,
        yellow = M.palette.bright_yellow,
        blue = M.palette.bright_blue,
        purple = M.palette.bright_purple,
        aqua = M.palette.bright_aqua,
        orange = M.palette.bright_orange,
        neutral_red = M.palette.neutral_red,
        neutral_green = M.palette.neutral_green,
        neutral_yellow = M.palette.neutral_yellow,
        neutral_blue = M.palette.neutral_blue,
        neutral_purple = M.palette.neutral_purple,
        neutral_aqua = M.palette.neutral_aqua,
        gray = M.palette.gray,
        accent = M.components.ui.accent,
        func = M.components.tokens.func,
        entity = M.components.tokens.entity,
        string = M.components.tokens.string,
        regexp = M.components.tokens.regexp,
        markup = M.components.tokens.markup,
        keyword = M.components.tokens.keyword,
        special = M.components.tokens.special,
        comment = M.components.tokens.comment,
        constant = M.components.tokens.constant,
        operator = M.components.tokens.operator,
        tag = M.components.tokens.tag,
        error = M.components.diagnostics.error,
    }
end

--- returns a table with colors for lualine modes
M.gen_lualine_theme = function()
    return {
        n = M.palette.bright_red,
        i = M.palette.bright_green,
        v = M.palette.bright_blue,
        [''] = M.palette.bright_blue,
        V = M.palette.bright_orange,
        c = M.palette.neutral_purple,
        no = M.palette.bright_red,
        s = M.palette.bright_orange,
        S = M.palette.bright_orange,
        [''] = M.palette.bright_orange,
        ic = M.palette.bright_yellow,
        R = M.palette.bright_purple,
        Rv = M.palette.bright_purple,
        cv = M.palette.bright_red,
        ce = M.palette.bright_red,
        r = M.palette.neutral_aqua,
        rm = M.palette.neutral_aqua,
        ['r?'] = M.palette.neutral_aqua,
        ['!'] = M.palette.bright_red,
        t = M.palette.bright_purple,
    }
end

return M

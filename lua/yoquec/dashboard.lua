local k_colors = require("kanagawa.colors").setup()

require("dashboard").setup {
    theme = 'doom',
    config = {
        header = {
            "",
            "",
            "=================     ===============     ===============   ========  ========",
            "\\\\ . . . . . . .\\\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
            "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
            "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
            "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
            "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
            "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
            "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
            "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
            "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
            "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
            "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
            "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
            "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
            "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
            "||.=='    _-'                                                     `' |  /==.||",
            "=='    _-'                        N E O V I M                         \\/   `==",
            "\\   _-'                                                                `-_   /",
            "",
            " [ TIP: To exit Neovim, just power off your computer. ] ",
            "",
        },
        center = {
            {
                icon = "⏰  ",
                desc = "Find recent files",
                action = "Telescope oldfiles",
                key = "o",
                keymap = "SPC f r",
            },
            {
                icon = "🔎  ",
                desc = "Find files",
                action = "Telescope find_files find_command=rg,--hidden,--files",
                key = "f",
                keymap = "SPC f f",
            },
            {
                icon = "📂  ",
                desc = "File browser",
                action = "Telescope file_browser",
                key = "b",
                keymap = "SPC v f",
            },
            {
                icon = "📚  ",
                desc = "Find Git files",
                action = "Telescope git_files",
                key = "g",
                keymap = "SPC g f",
            },
            {
                icon = "💬  ",
                desc = "Find word",
                action = "Telescope live_grep",
                key = "w",
                keymap = "SPC f g",
            },
        }
    }
}

-- Change dashboard highlight groups
vim.api.nvim_set_hl(0, "DashboardHeader", {fg = k_colors.palette.dragonGreen})
vim.api.nvim_set_hl(0, "DashboardDesc", {fg = k_colors.palette.dragonViolet})
vim.api.nvim_set_hl(0, "DashboardShortCut", {fg = k_colors.palette.dragonYellow})
vim.api.nvim_set_hl(0, "DashboardKey", {fg = k_colors.palette.dragonRed})


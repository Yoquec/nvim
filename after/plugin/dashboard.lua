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
                icon = "  ",
                desc = "Find recent files",
                action = "Telescope oldfiles",
                key = "o",
                keymap = "SPC f r",
                icon_hl = 'DashboardShortcut',
                desc_hl = "GruvboxBlue",
                key_hl = 'type',
            },
            {
                icon = "  ",
                desc = "Find files",
                action = "Telescope find_files find_command=rg,--hidden,--files",
                key = "f",
                keymap = "<C-p>",
                icon_hl = 'Structure',
                desc_hl = "GruvboxBlue",
                key_hl = 'type',
            },
            {
                icon = "  ",
                desc = "File browser",
                action = "Telescope file_browser",
                key = "b";
                keymap = "SPC f f",
                icon_hl = 'type',
                desc_hl = "GruvboxBlue",
                key_hl = 'type',
            },
            {
                icon = "  ",
                desc = "Find Git files",
                action = "Telescope git_files",
                key = "g",
                keymap = "<C-p>",
                icon_hl = 'keyword',
                desc_hl = "GruvboxBlue",
                key_hl = 'type',
            },
            {
                icon = "💬 ",
                desc = "Find word",
                action = "Telescope live_grep",
                key = "w",
                keymap = "SPC f g",
                icon_hl = 'Icon',
                desc_hl = "GruvboxBlue",
                key_hl = 'type',
            },
        },
        footer = {"",
        "",
        " 👑 Veni, vidi, vici ",
    }

  }
}


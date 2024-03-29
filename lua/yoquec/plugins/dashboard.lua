return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
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
                    " [ 🚨 TIP: To exit Neovim, power off your computer. ] ",
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
                        action = "Ex",
                        key = "b",
                        keymap = "SPC f v",
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
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

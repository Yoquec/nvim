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
                    " _______                    .__         ",
                    " \\      \\   ____  _______  _|__| _____  ",
                    " /   |   \\_/ __ \\/  _ \\  \\/ /  |/     \\ ",
                    "/    |    \\  ___(  <_> )   /|  |  Y Y  \\",
                    "\\____|__  /\\___  >____/ \\_/ |__|__|_|  /",
                    "        \\/     \\/                    \\/ ",
                    "",
                    " [ TIP: To exit Neovim, power off your computer. ] ",
                    "",
                },
                center = {
                    {
                        desc = "Find recent files",
                        action = "Telescope oldfiles",
                        key = "o",
                        keymap = "SPC f r",
                    },
                    {
                        desc = "Find files",
                        action = "Telescope find_files find_command=rg,--hidden,--files",
                        key = "f",
                        keymap = "SPC f f",
                    },
                    {
                        desc = "File browser",
                        action = "Ex",
                        key = "b",
                        keymap = "SPC f v",
                    },
                    {
                        desc = "Find Git files",
                        action = "Telescope git_files",
                        key = "g",
                        keymap = "SPC g f",
                    },
                  {
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

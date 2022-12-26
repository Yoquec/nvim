local status, db = pcall(require, "dashboard")
local home = os.getenv("HOME")


db.default_banner = {
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
 }
--db.preview_command = 'ueberzug'
--db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
--
db.preview_file_height = 15
db.preview_file_width = 75
db.custom_center = {

	{
		icon = "🔄 ",
		desc = "Find recent files                        ",
		action = "Telescope oldfiles",
		shortcut = "SPC f r",
	},
	{
		icon = "🔎 ",
		desc = "Find files                                 ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "<C-p>",
	},
	{
		icon = "📁 ",
		desc = "File browser                             ",
		action = "Telescope file_browser",
		shortcut = "SPC f f",
	},
	{
		icon = "💬 ",
		desc = "Find word                                ",
		action = "Telescope live_grep",
		shortcut = "SPC f g",
	},
}

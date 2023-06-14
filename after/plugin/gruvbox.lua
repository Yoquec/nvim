local bg = "#041216"

require("gruvbox").setup({
	-- options
	underline = true,
    undercurl = true,
	bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
	strikethrough = true,
	invert_selection = true,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	overrides = {},
	dim_inactive = true,
	transparent_mode = true,

	-- colors override
	palette_overrides = {
		  dark0_hard = bg,
		  dark0 = bg,
		  dark0_soft = bg,
		  dark1 = bg,
		  dark2 = bg,
		  dark3 = "#665c54",
		  dark4 = "#7c6f64",
		  light0_hard = "#f9f5d7",
		  light0 = "#fbf1c7",
		  light0_soft = "#f2e5bc",
		  light1 = "#ebdbb2",
		  light2 = "#d5c4a1",
		  light3 = "#bdae93",
		  light4 = "#a89984",
		  bright_red = "#e16876",
		  bright_green = "#b8b622",
		  bright_yellow = "#e6c381",
		  bright_blue = "#7eb3c1",
		  bright_purple = "#908aa5",
		  bright_aqua = "#81a883",
		  bright_orange = "#f7ba2f",
		  neutral_red = "#cc241d",
		  neutral_green = "#98971a",
		  neutral_yellow = "#d79921",
		  neutral_blue = "#458588",
		  neutral_purple = "#b16286",
		  neutral_aqua = "#689d6a",
		  neutral_orange = "#d65d0e",
		  faded_red = "#9d0006",
		  faded_green = "#79740e",
		  faded_yellow = "#b57614",
		  faded_blue = "#076678",
		  faded_purple = "#8f3f71",
		  faded_aqua = "#427b58",
		  faded_orange = "#af3a03",
		  gray = "#928374",
	}
})

-- set the colorscheme
vim.cmd.colorscheme("gruvbox")

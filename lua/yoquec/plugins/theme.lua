-- Pallete based on ghostty's Tomorrow Night Bright pallete
-- See: https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/refs/heads/master/ghostty/Tomorrow%20Night%20Bright

local theme_var = os.getenv("THEME")

local themes = { dark = {} }

themes.dark.colors = {
	base00 = "none",
	base01 = "none",
	base02 = "none",
	base03 = "#757d8a",
	base04 = "#8b95a7",
	base05 = "#eaeaea",
	base06 = "#373b41",
	base07 = "#ffffff",
	base08 = "#d54e53",
	base09 = "#7aa6da",
	base0A = "#e7c547",
	base0B = "#b9ca4a",
	base0C = "#70c0b1",
	base0D = "#7aa6da",
	base0E = "#c397d8",
	base0F = "#e7c547",
}

themes.dark.group_overrides = {
	-- Enable color inversion for selection
	["Visual"] = { reverse = true },

	-- Highlight current line number
	["LineNr"] = { fg = themes.dark.colors.base05, bold = true },
	["LineNrAbove"] = { fg = themes.dark.colors.base04 },
	["LineNrBelow"] = { fg = themes.dark.colors.base04 },

	-- TS tweaks
	["TSStrong"] = { fg = themes.dark.colors.base0F, bold = true },
	["Italic"] = { fg = themes.dark.colors.base0E, italic = true },

	-- markdown tweaks
	["@markup.list.markdown"] = { fg = themes.dark.colors.base08 },

	-- Fix markdown strikethrough
	["@markup.strikethrough.markdown_inline"] = { link = "markdownStrikeDelimiter" },

	-- Fix markdown inline code
	["Raw"] = { fg = themes.dark.colors.base08, bg = themes.dark.colors.base06 },
	["@markup.raw.markdown_inline"] = { link = "Raw" },

	-- Fix spelling highlights
	["SpellBad"] = { sp = themes.dark.colors.base08, underdotted = true },
	["SpellCap"] = { sp = themes.dark.colors.base09, underdotted = true },
	["SpellRare"] = { sp = themes.dark.colors.base0E, underdotted = true },
	["SpellLocal"] = { sp = themes.dark.colors.base0C, underdotted = true },
}

return {
	"RRethy/base16-nvim",
	name = "base16-colorscheme",
	lazy = false,
	priority = 1000,
	config = function()
		if theme_var == nil or theme_var == "dark" then
			vim.o.background = "dark"
			require("base16-colorscheme").setup(themes.dark.colors)
			for name, val in pairs(themes.dark.group_overrides) do
				vim.api.nvim_set_hl(0, name, val)
			end
		else
			require("base16-colorscheme").setup()
			-- Use default base16-tomorrow for light theme
			vim.o.background = "light"
			vim.cmd([[colorscheme base16-tomorrow]])
		end
	end,
}

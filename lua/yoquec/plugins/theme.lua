-- Pallete based on ghostty's Tomorrow Night Bright pallete
-- See: https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/refs/heads/master/ghostty/Tomorrow%20Night%20Bright

return {
	"RRethy/base16-nvim",
	name = "base16-colorscheme",
	lazy = false,
	priority = 1000,
	config = function()
		require("base16-colorscheme").setup({
			base00 = "#000000",
			base01 = "#000000",
			base02 = "#000000",
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
		})

		local colors = require("base16-colorscheme").colors

		-- Enable color inversion for selection
		vim.api.nvim_set_hl(0, "Visual", { reverse = true })

		-- TS tweaks
		vim.api.nvim_set_hl(0, "TSStrong", { fg = colors.base0F, bold = true })
		vim.api.nvim_set_hl(0, "Italic", { fg = colors.base0E, italic = true })

		-- markdown tweaks
		vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = colors.base08 })

		-- Fix markdown strikethrough
		vim.api.nvim_set_hl(0, "@markup.strikethrough.markdown_inline", { link = "markdownStrikeDelimiter" })

		-- Fix markdown inline code
		vim.api.nvim_set_hl(0, "Raw", { fg = colors.base08, bg = colors.base06 })
		vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { link = "Raw" })

		-- Fix spelling highlights
		vim.api.nvim_set_hl(0, "SpellBad", { sp = colors.base08, underdotted = true })
		vim.api.nvim_set_hl(0, "SpellCap", { sp = colors.base09, underdotted = true })
		vim.api.nvim_set_hl(0, "SpellRare", { sp = colors.base0E, underdotted = true })
		vim.api.nvim_set_hl(0, "SpellLocal", { sp = colors.base0C, underdotted = true })
	end,
}

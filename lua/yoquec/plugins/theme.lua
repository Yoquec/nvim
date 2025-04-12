local color_overrides = {
	light = {
		fg = "#000000",
		bg = "#ffffff",
		red = "#c82829",
		green = "#718c00",
		yellow = "#eab700",
		blue = "#4271ae",
		purple = "#8959a8",
		cyan = "#3e999f",
	},
	dark = {
		fg = "#eaeaea",
		bg = "#000000",
		red = "#d54e53",
		green = "#b9ca4a",
		yellow = "#e7c547",
		blue = "#7aa6da",
		purple = "#c397d8",
		cyan = "#70c0b1",
	},
}

return {
	"deparr/tairiki.nvim",
	lazy = false,
	priority = 1000,
	branch = "v2",
	plugins = {
		auto = true,
	},
	config = function()
		require("tairiki").setup({
			transparent = true,
			end_of_buffer = true,

			diagnostics = {
				darker = true,
				background = true,
				undercurl = true,
			},

			colors = function(color, _)
				for k, v in pairs(color_overrides[vim.o.bg]) do
					color[k] = v
				end
			end,

			highlights = function(highlight, color, _)
				highlight["LineNr"] = { fg = color.fg, bold = true }
				highlight["LineNrAbove"] = { fg = color.fg_dark2, bold = false }
				highlight["LineNrBelow"] = { fg = color.fg_dark2, bold = false }

				highlight["NormalFloat"] = { fg = color.fg, bg = color.bg }
				highlight["FloatBorder"] = { fg = color.fg, bg = color.bg }

				highlight["TreesitterContextLineNumber"] = { bg = color.fg, fg = color.bg }
				highlight["TreesitterContextLineNumberBottom"] = { bg = color.fg, fg = color.bg }
				highlight["TelescopeTitle"] = { bg = color.fg, fg = color.bg }

				for i = 1, 6, 1 do
					highlight["@markup.heading." .. i .. ".marker.markdown"] = { fg = color.blue, bold = true }
					highlight["@markup.heading." .. i .. ".markdown"] = { fg = color.blue, bold = true }
				end

				highlight["@markup.strong.markdown_inline"] = { fg = color.cyan, bold = true }
				highlight["@markup.italic.markdown_inline"] = { fg = color.green, italic = true }
				highlight["@markup.raw.markdown_inline"] = { fg = color.red, bg = color.bg_light3 }
				highlight["@markup.quote.markdown"] = { fg = color.yellow, italic = true }

				highlight["@tag.attribute"] = { fg = color.yellow }
				highlight["@type.builtin"] = { fg = color.yellow }
				highlight["Boolean"] = { fg = color.yellow }
				highlight["Number"] = { fg = color.yellow }
				highlight["@property.yaml"] = { fg = color.red }

				highlight["ObsidianCustomTag"] = { fg = color.yellow, underdotted = true }
			end,
		})

		vim.cmd.colorscheme("tairiki")
	end,
}

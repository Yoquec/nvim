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
		blink = true,
		diffview = true,
		gitsigns = true,
		neovim = true,
		nvim_tree = true,
		semantic_tokens = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
	config = function()
		require("tairiki").setup({
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
				local groups = {
					["LineNr"] = { fg = color.fg, bold = true },
					["LineNrAbove"] = { fg = color.fg_dark2, bold = false },
					["LineNrBelow"] = { fg = color.fg_dark2, bold = false },
					["NormalFloat"] = { fg = color.fg, bg = color.bg },
					["FloatBorder"] = { fg = color.fg, bg = color.bg },
					["Pmenu"] = { fg = color.fg, bg = color.bg },
					["PmenuKind"] = { fg = color.fg, bg = color.bg },

					["TreesitterContextLineNumber"] = { bg = color.fg, fg = color.bg },
					["TreesitterContextLineNumberBottom"] = { bg = color.fg, fg = color.bg },

					["SpellBad"] = { sp = color.red, undercurl = true },
					["SpellCap"] = { sp = color.yellow, undercurl = true },
					["SpellRare"] = { sp = color.purple, undercurl = true },
					["SpellLocal"] = { sp = color.fg, undercurl = true },

					["TelescopeTitle"] = { bg = color.fg, fg = color.bg },

					-- TODO: Push fix to tairiki.nvim
					["BlinkCmpKindFolder"] = { fg = color.yellow },
					["BlinkCmpKindSnippet"] = { fg = color.red },
					["BlinkCmpKindField"] = { fg = color.blue },
					["BlinkCmpKindModule"] = { fg = color.green },
					["BlinkCmpKindVariable"] = { fg = color.red },
					["BlinkCmpKindKeyword"] = { link = "@lsp.type.keyword" },
					["BlinkCmpKindText"] = { link = "@lsp.type.string" },
					["BlinkCmpKindEvent"] = { link = "@lsp.type.event" },
					["BlinkCmpKindConstant"] = { link = "Constant" },
					["BlinkCmpKindFunction"] = { link = "@lsp.type.function" },
					["BlinkCmpKindMethod"] = { link = "@lsp.type.method" },
					["BlinkCmpKindClass"] = { link = "@lsp.type.class" },
					["BlinkCmpKindStruct"] = { link = "@lsp.type.struct" },
					["BlinkCmpKindEnum"] = { link = "@lsp.type.enum" },
					["BlinkCmpKindEnumMember"] = { link = "@lsp.type.enumMember" },

					["@obsidian.tag"] = { fg = color.yellow, underdotted = true },
					["@obsidian.link"] = { fg = color.blue, underline = true },

					["@markup.link.label"] = { fg = color.yellow },
					["@markup.link.label.markdown_inline"] = { fg = color.blue },
					["@markup.strong.markdown_inline"] = { fg = color.yellow, bold = true },
					["@markup.italic.markdown_inline"] = { fg = color.purple, italic = true },
					["@markup.raw.markdown_inline"] = { fg = color.red, bg = color.bg_light3 },
					["@markup.quote.markdown"] = { fg = color.yellow, italic = true },
					["@tag.attribute"] = { fg = color.yellow },
					["@type.builtin"] = { fg = color.yellow },
					["Boolean"] = { fg = color.yellow },
					["Number"] = { fg = color.yellow },
					["@property.yaml"] = { fg = color.red },
				}

				for group, config in pairs(groups) do
					highlight[group] = config
				end

				for i = 1, 6, 1 do
					highlight["@markup.heading." .. i .. ".marker.markdown"] = { fg = color.blue, bold = true }
					highlight["@markup.heading." .. i .. ".markdown"] = { fg = color.blue, bold = true }
				end
			end,
		})

		vim.cmd.colorscheme("tairiki")
	end,
}

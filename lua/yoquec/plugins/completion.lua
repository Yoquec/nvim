return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true },
			list = { selection = { preselect = false, auto_insert = true } },
		},

		signature = {
			enabled = true,
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}

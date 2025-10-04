return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	version = "1.*",
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},

		keymap = { preset = "enter" },

		completion = {
			documentation = { auto_show = true },
			list = { selection = { preselect = false, auto_insert = true } },
			menu = { auto_show = true },
		},

		signature = {
			enabled = true,
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
				},
			},
		},

		snippets = {
			preset = "luasnip",
		},
	},
}

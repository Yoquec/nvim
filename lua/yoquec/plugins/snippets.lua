return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local ls = require("luasnip")
		require("luasnip.loaders.from_snipmate").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Adds latex snippets to markdown files
		ls.filetype_extend("markdown", { "tex" })

		-- Snippet choices
		vim.keymap.set({ "i", "n" }, "<C-j>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)
		vim.keymap.set({ "i", "n" }, "<C-k>", function()
			if ls.choice_active() then
				ls.change_choice(-1)
			end
		end)
	end,
}

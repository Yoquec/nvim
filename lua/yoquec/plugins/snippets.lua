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

		vim.keymap.set({ "n", "i", "s" }, "<C-h>", function()
			if vim.snippet.active({ direction = -1 }) then
				vim.snippet.jump(-1)
			elseif ls.jumpable(-1) then
				ls.jump(-1)
			end
		end)

		vim.keymap.set({ "n", "i", "s" }, "<C-l>", function()
			if vim.snippet.active({ direction = 1 }) then
				vim.snippet.jump(1)
			elseif ls.jumpable(1) then
				ls.jump(1)
			end
		end)

		vim.keymap.set({ "i", "n", "s" }, "<C-j>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		vim.keymap.set({ "i", "n", "s" }, "<C-k>", function()
			if ls.choice_active() then
				ls.change_choice(-1)
			end
		end)

		vim.keymap.set({ "n", "s" }, "<leader><C-l>", vim.snippet.stop)
	end,
}

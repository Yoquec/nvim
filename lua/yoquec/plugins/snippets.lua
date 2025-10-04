return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	event = "VeryLazy",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local ls = require("luasnip")
		require("luasnip.loaders.from_snipmate").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load()

		ls.filetype_extend("markdown", { "tex" })
		ls.filetype_extend("typescript", { "javascript" })

		local function jump(direction)
			if vim.snippet.active({ direction = direction }) then
				vim.snippet.jump(direction)
			elseif ls.jumpable(direction) then
				ls.jump(direction)
			end
		end

		local function choice(direction)
			if ls.choice_active() then
				ls.change_choice(direction)
			end
		end

		vim.keymap.set({ "n", "i", "s" }, "<C-h>", function()
			jump(-1)
		end, { desc = "Jump to the previous snippet" })

		vim.keymap.set({ "n", "i", "s" }, "<C-l>", function()
			jump(1)
		end, { desc = "Jump to the next snippet" })

		vim.keymap.set({ "i", "n", "s" }, "<C-k>", function()
			choice(-1)
		end)

		vim.keymap.set({ "i", "n", "s" }, "<C-j>", function()
			choice(1)
		end)

		vim.keymap.set({ "n", "s" }, "<leader>;", vim.snippet.stop)
	end,
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"vimdoc",
				"python",
				"c",
				"cpp",
				"css",
				"html",
				"bash",
				"gitcommit",
				"lua",
				"rust",
				"go",
				"nix",
				"java",
				"make",
				"markdown",
				"markdown_inline",
				"javascript",
				"typescript",
				"haskell",
				"yaml",
				"toml",
				"zig",
			},
			modules = {},
			ignore_install = {},
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
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
				"yaml",
				"toml",
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
	keys = { { "<leader>tc", function() vim.cmd.TSContext("toggle") end, desc = "Toggles treesitter context" } },
}

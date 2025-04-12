return {
	{ "tpope/vim-surround", event = { "BufReadPost", "BufNewFile" } },
	{
		"windwp/nvim-autopairs",
		opts = {},
		event = { "InsertEnter" },
	},
	{
		"folke/which-key.nvim",
		opts = {},
		event = { "VeryLazy" },
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"mbbill/undotree",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<leader>ut", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{
				"<leader>ca",
				"<cmd>ColorizerAttachToBuffer<cr>",
				desc = "Attach colorizer to the currect buffer",
			},
		},
	},
}

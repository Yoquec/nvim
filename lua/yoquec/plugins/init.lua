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
		"mbbill/undotree",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<leader>ut", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "VeryLazy" },
		keys = {
			{
				"<leader>ca",
				vim.cmd.ColorizerAttachToBuffer,
				desc = "Attach colorizer to the currect buffer",
			},
			{
				"<leader>ct",
				vim.cmd.ColorizerToggle,
				desc = "Toggle colorizer in the current buffer",
			},
			{
				"<leader>cr",
				vim.cmd.ColorizerReloadAllBuffers,
				desc = "Reload colorizer in all buffers",
			},
		},
	},
}

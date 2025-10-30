return {
	{ "tpope/vim-surround", event = { "BufReadPost", "BufNewFile" } },
	{
		"uga-rosa/utf8.nvim",
		keys = {
			{
				"<leader>gs",
				function()
					local utf8 = require("yoquec.core.writting.utf8")
					local replace = require("yoquec.core.writting.replace")
					replace.with(utf8.superscript)()
				end,
				mode = { "v" },
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {},
		event = { "InsertEnter" },
	},
	{
		"folke/which-key.nvim",
		opts = {
			win = { border = vim.api.nvim_get_option_value("winborder", { scope = "global" }) },
		},
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

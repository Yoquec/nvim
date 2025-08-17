return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>do", vim.cmd.DiffviewOpen, desc = "Open Diffview" },
		{ "<leader>dq", vim.cmd.DiffviewClose, desc = "Quit Diffview" },
		{ "<leader>dr", vim.cmd.DiffviewRefresh, desc = "Refresh Diffview window" },
		{ "<leader>dt", vim.cmd.DiffviewToggleFiles, desc = "Toggle Diffview files" },
		{ "<leader>dh", vim.cmd.DiffviewFileHistory, desc = "Open Diffview file history" },
	},
}

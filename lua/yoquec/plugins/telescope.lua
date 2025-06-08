return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {
        -- stylua: ignore start
		{ "<Leader>fli", [[<cmd>Telescope lsp_incoming_calls theme=dropdown<cr>]], desc = "Telescope LSP incoming calls" },
		{ "<Leader>flo", [[<cmd>Telescope lsp_outgoing_calls theme=dropdown<cr>]], desc = "Telescope LSP outgoing calls" },
		-- stylua: ignore end
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
			},
		})

		-- HACK: Fix telescope borders until the fix for plenary 0.11 gets merged
		-- See: https://github.com/nvim-lua/plenary.nvim/pull/649
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopeFindPre",
			callback = function()
				vim.opt_local.winborder = "none"
				vim.api.nvim_create_autocmd("WinLeave", {
					once = true,
					callback = function()
						vim.opt_local.winborder = "rounded"
					end,
				})
			end,
		})
	end,
}

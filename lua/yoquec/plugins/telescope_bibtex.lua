return {
	"nvim-telescope/telescope-bibtex.nvim",
	requires = {
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		require("telescope").load_extension("bibtex")
	end,
	keys = {
		{ "<leader>fB", [[<cmd>Telescope bibtex theme=dropdown<cr>]], desc = "Telescope open bibtex" },
	},
}

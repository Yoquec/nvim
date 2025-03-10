return {
	"nvim-telescope/telescope.nvim",
    lazy = false,
	version = "0.1.x",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
        -- stylua: ignore start
		{ "<leader>fv", [[<cmd>Telescope file_browser theme=ivy<cr>]], desc = "Telescope file browser" },
		{ "<Leader>ft", [[<cmd>TodoTelescope theme=dropdown<cr>]], desc = "Telescope to-do picker" },
		{ "<Leader>ff", [[<cmd>Telescope find_files theme=dropdown<cr>]], desc = "Telescope find files" },
		{ "<leader>fo", [[<cmd>Telescope oldfiles theme=dropdown<cr>]], desc = "Telescope old files" },
		{ "<leader>fgf", [[<cmd>Telescope git_files theme=dropdown<cr>]], desc = "Telescope git files" },
		{ "<leader>fb", [[<cmd>Telescope buffers theme=dropdown<cr>]], desc = "Telescope buffers" },
		{ "<leader>fM", [[<cmd>Telescope marks theme=dropdown<cr>]], desc = "Telescope marks" },
		{ "<leader>fp", [[<cmd>Telescope live_grep theme=dropdown<cr>]], desc = "Telescope live grep" },
		{ "<Leader>fq", [[<cmd>Telescope current_buffer_fuzzy_find theme=dropdown<cr>]], desc = "Telescope buffer fuzzy finder" },

		{ "<leader>fgc", [[<cmd>Telescope git_commits theme=dropdown<cr>]], desc = "Telescope git commits" },
		{ "<leader>fgb", [[<cmd>Telescope git_branches theme=dropdown<cr>]], desc = "Telescope git branches" },
		{ "<leader>fgs", [[<cmd>Telescope git_status theme=dropdown<cr>]], desc = "Telescope git status" },
		{ "<leader>fgS", [[<cmd>Telescope git_stash theme=dropdown<cr>]], desc = "Telescope git stash" },

		{ "<Leader>flr", [[<cmd>Telescope lsp_references theme=dropdown<cr>]], desc = "Telescope LSP references" },
		{ "<Leader>fld", [[<cmd>Telescope lsp_definitions theme=dropdown<cr>]], desc = "Telescope LSP definitions" },
		{ "<Leader>fli", [[<cmd>Telescope lsp_incoming_calls theme=dropdown<cr>]], desc = "Telescope LSP implementations" },
		{ "<Leader>flo", [[<cmd>Telescope lsp_outgoing_calls theme=dropdown<cr>]], desc = "Telescope LSP implementations" },
		{ "<Leader>flI", [[<cmd>Telescope lsp_implementations theme=dropdown<cr>]], desc = "Telescope LSP implementations" },
		{ "<Leader>flt", [[<cmd>Telescope lsp_type_definitions theme=dropdown<cr>]], desc = "Telescope LSP type definitions" },
		{ "<Leader>fls", [[<cmd>Telescope lsp_document_symbols theme=dropdown<cr>]], desc = "Telescope LSP buffer symbols" },
		{ "<Leader>flS", [[<cmd>Telescope lsp_workspace_symbols theme=dropdown<cr>]], desc = "Telescope LSP workspace symbols" },
		{ "<Leader>fd", [[<cmd>Telescope diagnostics theme=dropdown<cr>]], desc = "Telescope LSP diagnostics" },

		{ "<leader>fc", [[<cmd>Telescope commands theme=dropdown<cr>]], desc = "Telescope command picker" },
		{ "<leader>fC", [[<cmd>Telescope command_history theme=dropdown<cr>]], desc = "Telescope command picker" },
		{ "<leader>fh", [[<cmd>Telescope help_tags theme=dropdown<cr>]], desc = "Telescope help picker" },
		{ "<leader>fk", [[<cmd>Telescope keymaps theme=dropdown<cr>]], desc = "Telescope keymap picker" },
		{ "<Leader>fi", [[<cmd>Telescope builtin theme=dropdown<cr>]], desc = "Telescope picker picker (lol)" },
		{ "<Leader>fs", [[<cmd>Telescope spell_suggest theme=dropdown<cr>]], desc = "Telescope spelling suggestions" },
		{ "<leader>fS", [[<cmd>Telescope search_history theme=dropdown<cr>]], desc = "Telescope command picker" },
		-- stylua: ignore end
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")
		local file_browser_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				grep_string = {
					theme = "dropdown",
				},
				live_grep = {
					theme = "dropdown",
				},
			},
			extensions = {
				file_browser = {
					path = "%:p:h",
					mappings = {
						["n"] = {
							["%"] = file_browser_actions.create,
							D = file_browser_actions.remove,
							["<C-n>"] = actions.move_selection_next,
							["<C-p>"] = actions.move_selection_previous,
						},
					},
				},
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("ui-select")
	end,
}

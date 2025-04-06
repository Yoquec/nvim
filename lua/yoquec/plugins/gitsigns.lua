return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		signcolumn = true,
		current_line_blame = false,
		attach_to_untracked = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		signs = {
			add = { text = "┃" },
			delete = { text = "┃" },
			topdelete = { text = "┃" },
			change = { text = "┃" },
			changedelete = { text = "┃" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local opts = { buffer = bufnr, remap = false }

			-- Navigation
			vim.keymap.set(
				"n",
				"]c",
				[[<cmd>Gitsigns next_hunk<CR>]],
				{ unpack(opts), desc = "Gitsigns jump to next code change hunk" }
			)
			vim.keymap.set(
				"n",
				"[c",
				[[<cmd>Gitsigns prev_hunk<CR>]],
				{ unpack(opts), desc = "Gitsigns jump to previous code change hunk" }
			)

			-- Actions
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gs",
				[[<cmd>Gitsigns stage_hunk<CR>]],
				{ unpack(opts), desc = "Gitsigns stage hunk under cursor" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>grr",
				[[<cmd>Gitsigns reset_hunk<CR>]],
				{ unpack(opts), desc = "Gitsigns reset hunk under cursor" }
			)
			vim.keymap.set(
				"n",
				"<leader>gS",
				[[<cmd>Gitsigns stage_buffer<CR>]],
				{ unpack(opts), desc = "Gitsigns stage current buffer" }
			)
			vim.keymap.set(
				"n",
				"<leader>grb",
				[[<cmd>Gitsigns reset_buffer<CR>]],
				{ unpack(opts), desc = "Gitsigns reset current buffer changes" }
			)
			vim.keymap.set(
				"n",
				"<leader>gu",
				[[<cmd>Gitsigns undo_stage_hunk<CR>]],
				{ unpack(opts), desc = "Gitsigns undo stage of hunk under cursor" }
			)
			vim.keymap.set(
				"n",
				"<leader>gbb",
				[[<cmd>Gitsigns blame<CR>]],
				{ unpack(opts), desc = "Gitsigns current buffer blame" }
			)
			vim.keymap.set(
				"n",
				"<leader>gbl",
				[[<cmd>Gitsigns blame_line<CR>]],
				{ unpack(opts), desc = "Gitsigns current line blame hover" }
			)
			vim.keymap.set(
				"n",
				"<leader>gtb",
				[[<cmd>Gitsigns toggle_current_line_blame<CR>]],
				{ unpack(opts), desc = "Gitsigns toggle current line virtual text" }
			)
			vim.keymap.set(
				"n",
				"<leader>gd",
				[[<cmd>Gitsigns preview_hunk<CR>]],
				{ unpack(opts), desc = "Gitsigns diff hunk under the cursor" }
			)
			vim.keymap.set(
				"n",
				"<leader>gD",
				[[<cmd>lua require"gitsigns".diffthis("~")<CR>]],
				{ unpack(opts), desc = "Gitsigns diff current file changes" }
			)
			vim.keymap.set(
				"n",
				"<leader>gtd",
				[[<cmd>Gitsigns toggle_deleted<CR>]],
				{ unpack(opts), desc = "Gitsigns toggle virtual text for lines deleted in buffer" }
			)
		end,
	},
}

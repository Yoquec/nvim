return {
	"mhartington/formatter.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- `config` key must be used (and not opts) to be able to
		-- load the multiple "formatter.filetype" modules
		require("formatter").setup({
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				nix = {
					require("formatter.filetypes.nix").alejandra,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettier,
				},
				html = {
					require("formatter.filetypes.html").prettier,
				},
				htmldjango = {
					require("formatter.filetypes.html").prettier,
				},
				css = {
					require("formatter.filetypes.css").prettier,
				},
				cs = {
					require("formatter.filetypes.cs").csharpier,
				},
				markdown = {
					require("formatter.filetypes.markdown").prettier,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				go = {
					require("formatter.filetypes.go").gofumpt,
					require("formatter.filetypes.go").goimports,
					require("formatter.filetypes.go").golines,
				},
				rmd = {
					require("formatter.filetypes.markdown").prettier,
				},
				Rmd = {
					require("formatter.filetypes.markdown").prettier,
				},
				python = {
					require("formatter.filetypes.python").black,
					require("formatter.filetypes.python").isort,
				},
				sql = {
					require("formatter.filetypes.sql").pgformat,
				},
				sh = {
					require("formatter.filetypes.sh").shfmt,
				},
				ocaml = {
					require("formatter.filetypes.ocaml").ocamlformat,
				},
			},
		})
	end,
	keys = {
		{
			"<leader>F",
			[[<cmd>Format<CR>]],
			{ "n", "v" },
			desc = "Formatter.nvim format the current file",
		},
	},
}

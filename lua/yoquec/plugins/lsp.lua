local servers = {
	"lua_ls",
	"lemminx",
	"taplo",
	"yamlls",
	"jsonls",
	"cssls",
	"html",
	"eslint",
	"texlab",
	"jdtls",
	"nil_ls",
	"sourcekit",
	"basedpyright",
	"gopls",
	"rust_analyzer",
	"ts_ls",
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(servers) do
				lspconfig[server].setup({ capabilities = capabilities })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local opts = { bufnr = args.buf, id = client.id }

					vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, {
						unpack(opts),
						desc = "[L]sp [F]ormat file",
					})

					vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {
						unpack(opts),
						desc = "[L]sp open [D]iagnostic hover",
					})

					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
						unpack(opts),
						desc = "LSP go to previous [D]iagnostic",
					})

					vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {
						unpack(opts),
						desc = "LSP go to next [D]iagnostic",
					})
				end,
			})
		end,
	},
}

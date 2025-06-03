local custom_servers = {
	"emmet",
}

local lspconfig_servers = {
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

			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "●",
						[vim.diagnostic.severity.WARN] = "●",
						[vim.diagnostic.severity.HINT] = "●",
						[vim.diagnostic.severity.INFO] = "●",
					},
				},
			})

			for _, server in ipairs(custom_servers) do
				vim.lsp.config(server, { capabilities = capabilities })
			end

			vim.lsp.enable(custom_servers)

			for _, server in ipairs(lspconfig_servers) do
				lspconfig[server].setup({ capabilities = capabilities })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					if not client then
						return
					end

					local opts = { bufnr = args.buf, id = client.id }

					vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, {
						unpack(opts),
						desc = "LSP jump to Definition",
					})

					vim.keymap.set("n", "grr", Snacks.picker.lsp_references, {
						unpack(opts),
						desc = "LSP References",
					})

					vim.keymap.set("n", "gI", Snacks.picker.lsp_references, {
						unpack(opts),
						desc = "LSP Implementations",
					})

					vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, {
						unpack(opts),
						desc = "LSP Format",
					})

					vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {
						unpack(opts),
						desc = "LSP open Diagnostic hover",
					})

					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, {
						unpack(opts),
						desc = "LSP go to previous Diagnostic",
					})

					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, {
						unpack(opts),
						desc = "LSP go to next Diagnostic",
					})
				end,
			})
		end,
	},
}

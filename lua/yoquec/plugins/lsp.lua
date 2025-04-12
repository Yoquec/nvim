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
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(servers) do
				lspconfig[server].setup({ capabilities = capabilities })
			end
		end,
	},
}

local config = require("yoquec.plugins.lsp.config")
local utils = require("yoquec.plugins.lsp.utils")

-- Servers that don't require configuration
local servers = {
	"harper_ls",
	"lemminx",
	"taplo",
	"yamlls",
	"jsonnet_ls",
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
	"vonheikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = { "BufReadPre", "BufNewFile", "BufLeave" },
	dependencies = {
		-- LSP support
		"neovim/nvim-lspconfig",

		-- Auto-completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local lsp_zero_cmp_action = require("lsp-zero").cmp_action()
		local cmp = require("cmp")
		local lspconfig = require("lspconfig")

		-- Setup servers
		lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

		for server, cfg in pairs(config.servers) do
			lspconfig[server].setup(cfg)
		end

		for _, server in ipairs(servers) do
			lspconfig[server].setup(config.empty)
		end

		lsp_zero.set_sign_icons({
			error = "●",
			warn = "●",
			hint = "●",
			info = "●",
		})

		require("lspconfig.ui.windows").default_options = {
			border = "rounded",
		}

		local cmp_select = {
			behavior = cmp.SelectBehavior.Replace,
		}

		cmp.setup({
			sources = {
				{ name = "nvim_lsp", priority = 8 },
				{ name = "luasnip", priority = 5 },
				{ name = "path", priority = 4 },
				{ name = "buffer", priority = 4 },
				{ name = "nvim_lua", priority = 3 },
			},
			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-l>"] = lsp_zero_cmp_action.luasnip_jump_forward(),
				["<C-h>"] = lsp_zero_cmp_action.luasnip_jump_backward(),
				["<C-Space>"] = cmp.mapping.complete(),
			}),

			-- Don't select the first option in the menu by default
			-- https://stackoverflow.com/questions/74688630/make-nvim-cmp-not-autoselect-the-1st-option
			preselect = "none",
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

		lsp_zero.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set(
				"n",
				"gd",
				[[<cmd>Telescope lsp_definitions theme=dropdown<cr>]],
				{ unpack(opts), desc = "LSP navigate to definition" }
			)
			vim.keymap.set(
				"n",
				"gI",
				[[<cmd>Telescope lsp_implementations theme=dropdown<cr>]],
				{ unpack(opts), desc = "LSP navigate to implementation" }
			)
			vim.keymap.set(
				"n",
				"gr",
				[[<cmd>Telescope lsp_references theme=dropdown<cr>]],
				{ unpack(opts), desc = "LSP navigate to references" }
			)

            -- stylua: ignore start
			vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, { unpack(opts), desc = "LSP format file" })
			vim.keymap.set( "n", "<leader>lr", vim.lsp.buf.rename, { unpack(opts), desc = "LSP rename symbol under cursor" })
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { unpack(opts), desc = "LSP code action" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { unpack(opts), desc = "LSP documentation hover" })
			vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, { unpack(opts), desc = "LSP get signature help" })
			-- WARNING: In reality, this is mapping to <C-/>: https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
			vim.keymap.set("i", "<C-_>", vim.lsp.buf.signature_help, { unpack(opts), desc = "LSP get signature help" })
			vim.keymap.set( "n", "<leader>ld", vim.diagnostic.open_float, { unpack(opts), desc = "LSP open diagnostic hover" })
			vim.keymap.set( "n", "[d", vim.diagnostic.goto_prev, { unpack(opts), desc = "LSP jump to previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { unpack(opts), desc = "LSP jump to next diagnostic" })
			vim.keymap.set( "n", "<leader>tv", utils.toggle_virtual_text, { unpack(opts), desc = "Toggle LSP virtual text" })
			-- stylua: ignore start
		end)
	end,
}

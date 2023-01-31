local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

-- lsp.ensure_installed({
-- 	'eslint',
-- 	'sumneko_lua',
-- 	'rust_analyzer',
--     'pyright',
-- })


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<cr>'] = cmp.mapping.confirm({ select = true }),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})


lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end


  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader><leader>p", vim.cmd.LspZeroFormat)

end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

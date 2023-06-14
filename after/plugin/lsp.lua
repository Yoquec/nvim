local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.ensure_installed({
    'rust_analyzer', 'pyright'
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
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
    suggest_lsp_servers = true,
    sign_icons = {
        error = '●',
        warn = '●',
        hint = '●',
        info = '●'
    }
})

-- auto signature config
local cfg = {
    hint_prefix = "",
}

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Cool lsp stuff
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader><leader>p", vim.cmd.LspZeroFormat)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)


    -- Vim diagnostics
    vim.keymap.set("n", "<leader>K", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>J", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, opts)

    -- vim signature
    require'lsp_signature'.on_attach(cfg, bufnr)
end)

vim.diagnostic.config({
    virtual_text = true,
})

-- setup the lsp
lsp.setup()

-- enable the supertab
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }
})


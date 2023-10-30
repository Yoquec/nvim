local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'pyright' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
        end,
        emmet_language_server = function()
            require('lspconfig').emmet_language_server.setup({
                filetypes = {
                    "markdown",
                    "css",
                    "html",
                    "javascriptreact",
                    "typescriptreact"
                }
            })
        end
    }
})

local cmp_select = { behavior = cmp.SelectBehavior.Replace }
cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_jump_forward(),
        ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

lsp_zero.set_sign_icons({
    error = '●',
    warn = '●',
    hint = '●',
    info = '●',
})

vim.diagnostic.config({
    virtual_text = true
})

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Cool LSP stuff
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader><leader>p', vim.cmd.LspZeroFormat, opts)
    vim.keymap.set('n', '<leader>vw', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>vs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>va', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

    -- Vim diagnostic
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>K', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>J', vim.diagnostic.goto_next, opts)
end)

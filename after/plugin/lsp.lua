local lsp = require('lsp-zero')
local cmp = require('cmp')
local luasnip = require('luasnip')

lsp.preset('recommended')

lsp.setup_servers({'rust_analyzer', 'pyright'})

local cmp_select = { behavior = cmp.SelectBehavior.Replace }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<cr>'] = cmp.mapping.confirm(),
    ["<C-Space>"] = cmp.mapping.complete(),

    ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' })
})

lsp.setup({
    -- Don't select the first option in the menu
    -- https://stackoverflow.com/questions/74688630/make-nvim-cmp-not-autoselect-the-1st-option
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
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


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Cool lsp stuff
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader><leader>p", vim.cmd.LspZeroFormat)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>vs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)


    -- Vim diagnostics
    vim.keymap.set("n", "<leader>K", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>J", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
end)

-- set up emmet inside markdown
require('lspconfig').emmet_language_server.setup({
    filetypes = { "astro", "markdown", "css", "eruby", "html", "javascriptreact", "less", "sass", "scss",
        "svelte", "pug", "typescriptreact", "vue" },
})

vim.diagnostic.config({
    virtual_text = true,
})

-- setup the lsp
lsp.setup()

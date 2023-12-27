return {
    'vonheikemen/lsp-zero.nvim',
    branch = "v3.x",
    dependencies = {
        -- lsp support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        require('mason').setup({})
        require('mason-lspconfig').setup({
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
                            "typescriptreact",
                            "htmldjango"
                        }
                    })
                end,
                html = function()
                    require("lspconfig").html.setup({
                        filetypes = {
                            "html",
                            "htmldjango"
                        }
                    })
                end,
                ltex = function()
                    require('lspconfig').ltex.setup({
                        filetypes = { 'rmd', 'rmarkdown', 'bib', 'gitcommit', 'markdown', 'tex', 'pandoc' },
                        settings = {
                            ltex = {
                                language = "auto"
                            }
                        },
                        get_language_id = function(_, filetype)
                            local language_id_mapping = {
                                bib = 'bibtex',
                                plaintex = 'tex',
                                tex = 'latex',
                                pandoc = 'markdown',
                                rmd = "rmarkdown"
                            }
                            local language_id = language_id_mapping[filetype]
                            if language_id then
                                return language_id
                            else
                                return filetype
                            end
                        end,
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
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<Tab>'] = cmp_action.luasnip_jump_forward(),
                ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-y>'] = vim.NIL,
            }),
            -- Don't select the first option in the menu
            -- https://stackoverflow.com/questions/74688630/make-nvim-cmp-not-autoselect-the-1st-option
            preselect = 'none',
            completion = {
                completeopt = 'menu,menuone,noinsert,noselect'
            },
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
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
            vim.keymap.set('n', '<leader><leader>p', vim.cmd.LspZeroFormat, opts)
            vim.keymap.set('n', '<leader>vw', vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set('n', '<leader>vr', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>va', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

            -- Vim diagnostic
            vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        end)
    end
}

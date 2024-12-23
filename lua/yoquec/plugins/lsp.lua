local virtual_text_active = true

local function toggle_virtual_text()
    if virtual_text_active then
        vim.diagnostic.config({ virtual_text = false })
        virtual_text_active = false
    else
        vim.diagnostic.config({ virtual_text = true })
        virtual_text_active = true
    end
end

return {
    'vonheikemen/lsp-zero.nvim',
    branch = "v3.x",
    event = { "BufReadPre", "BufNewFile", "BufLeave" },
    dependencies = {
        -- LSP support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Auto-completion
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
        local lspconfig = require('lspconfig')

        require('mason').setup({
            ui = {
                border = "rounded"
            }
        })
        require('mason-lspconfig').setup({
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
                end,
                emmet_language_server = function()
                    lspconfig.emmet_language_server.setup({
                        -- Add to markdown filetype
                        filetypes = { "markdown", 'css', 'eruby', 'html', 'htmldjango', 'javascriptreact',
                            'less', 'pug', 'sass', 'scss', 'typescriptreact', 'htmlangular' }
                    })
                end,
                html = function()
                    lspconfig.html.setup({
                        filetypes = {
                            "html",
                            "htmldjango"
                        }
                    })
                end,
                ltex = function()
                    lspconfig.ltex.setup({
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
                { name = 'nvim_lsp', priority = 8 },
                { name = 'luasnip',  priority = 5 },
                { name = 'path',     priority = 4 },
                { name = 'buffer',   priority = 4 },
                { name = 'nvim_lua', priority = 3 },
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<A-n>'] = cmp_action.luasnip_jump_forward(),
                ['<A-p>'] = cmp_action.luasnip_jump_backward(),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),

            -- Don't select the first option in the menu by default
            -- https://stackoverflow.com/questions/74688630/make-nvim-cmp-not-autoselect-the-1st-option
            preselect = 'none',
            completion = {
                completeopt = 'menu,menuone,noinsert,noselect'
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }
        })

        lsp_zero.set_sign_icons({
            error = '●',
            warn = '●',
            hint = '●',
            info = '●',
        })

        require('lspconfig.ui.windows').default_options = {
            border = "rounded"
        }

        vim.diagnostic.config({
            virtual_text = true
        })

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
                { unpack(opts), desc = "LSP navigate to definition" })
            vim.keymap.set('n', 'gI', vim.lsp.buf.implementation,
                { unpack(opts), desc = "LSP navigate to implementation" })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references,
                { unpack(opts), desc = "LSP navigate to references" })
            vim.keymap.set({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format,
                { unpack(opts), desc = "LSP format file" })
            vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,
                { unpack(opts), desc = "LSP rename symbol under cursor" })
            vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,
                { unpack(opts), desc = "LSP code action" })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover,
                { unpack(opts), desc = "LSP documentation hover" })
            vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help,
                { unpack(opts), desc = "LSP get signature help" })
            vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,
                { unpack(opts), desc = "LSP get signature help" })

            -- Diagnostics
            vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float,
                { unpack(opts), desc = "LSP open diagnostic hover" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
                { unpack(opts), desc = "LSP jump to previous diagnostic" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
                { unpack(opts), desc = "LSP jump to next diagnostic" })

            -- Toggle virtual_text
            vim.keymap.set("n", "<leader>tv", toggle_virtual_text,
                { unpack(opts), desc = "Toggle LSP virtual text" })
        end)
    end
}

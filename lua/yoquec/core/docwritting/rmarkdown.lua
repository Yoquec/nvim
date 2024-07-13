local callbacks = require("yoquec.core.docwritting.callbacks")
local viewers = require("yoquec.core.docwritting.viewers")

local function render_pdf()
    local filename = vim.fn.expand("%")

    vim.fn.jobstart(
        [[bash -c 'echo "require(rmarkdown); render(\"]] .. filename .. [[\")" | R --vanilla']],
        { on_exit = callbacks.document_render_finish })

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Rendering rmarkdown pdf ]] .. icon .. [[...]])
end

local function render_pdf_sync()
    local filename = vim.fn.expand("%")
    vim.cmd(
        [[!echo "require(rmarkdown); render(']] .. filename .. [[')" | R --vanilla]]
    )
end

vim.api.nvim_create_autocmd("FileType", {
    group = "docwritting",
    pattern = "rmd",
    callback = function(args)
        vim.keymap.set('n', '<leader>rr',
            render_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rr',
            render_pdf_sync, { buffer = args.buf })
        vim.keymap.set('n', '<leader>op',
            viewers.open_pdf, { buffer = args.buf })
        -- override formatting with prettier 
        vim.keymap.set('n', '<Leader><leader>f', function ()
            local filename = vim.fn.expand("%")
            vim.api.nvim_command([[!prettier "]] .. filename .. [[" --parser markdown --write]])
        end, { buffer = args.buf })
    end
})

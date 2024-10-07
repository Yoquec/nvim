local callbacks = require("yoquec.core.writting.callbacks")
local viewers = require("yoquec.core.writting.viewers")

local function render_pdf()
    local filename = vim.fn.expand("%")

    vim.fn.jobstart(
        [[bash -c 'echo "require(rmarkdown); render(\"]] .. filename .. [[\")" | R --vanilla']],
        { on_exit = callbacks.document_render_finish })

    print([[Rendering rmarkdown pdf]])
end

local function render_pdf_sync()
    local filename = vim.fn.expand("%")
    vim.cmd(
        [[!echo "require(rmarkdown); render(']] .. filename .. [[')" | R --vanilla]]
    )
end

vim.api.nvim_create_autocmd("FileType", {
    group = "writting",
    pattern = "rmd",
    callback = function(args)
        -- Decrease tab size
        vim.bo[args.buf].shiftwidth = 2
        vim.bo[args.buf].tabstop = 2
        vim.bo[args.buf].softtabstop = 2

        vim.keymap.set('n', '<leader>rr', render_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rr', render_pdf_sync, { buffer = args.buf })
        vim.keymap.set('n', '<leader>vp', viewers.open_pdf, { buffer = args.buf })

        -- override the formatting command to use prettier 
        vim.keymap.set('n', '<Leader><leader>f', function ()
            local filename = vim.fn.expand("%")
            vim.api.nvim_command([[!prettier "]] .. filename .. [[" --parser markdown --write]])
        end, { buffer = args.buf })
    end
})

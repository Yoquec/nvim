local callbacks = require("yoquec.core.docwritting.callbacks")

--- Creates pdf document with pandoc (in the foreground)
local function render_pdf()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex --citeproc "]] .. file_path .. [[" -o "]] .. output_path .. [["']],
        { on_exit = callbacks.document_render_finish }
    )

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document with Pandoc ]] .. icon .. [[...]])
end

--- Creates pdf document with pandoc (in the foreground)
local function render_pdf_sync()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
    vim.cmd(
        [[!pandoc --pdf-engine=xelatex --citeproc "]] .. file_path .. [[" -o "]] .. output_path .. [["]]
    )
end

--- Create slides with beamer
local function render_slides()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("ppt")

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex "]] ..
        fullfilename .. [[" -t beamer -o "]] .. output_fullfilename .. [["']],
        { on_exit = callbacks.slideshow_render_finish }
    )

    print([[Creating slides ]] .. icon .. [[...]])
end

--- Create slides with beamer (in the foreground)
local function render_slides_sync()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
    vim.cmd(
        [[!pandoc --pdf-engine=xelatex "]] .. file_path .. [[" -t beamer -o "]] .. output_path .. [["]]
    )
end

return {
    autocmd_callback = function(args)
        vim.keymap.set('n', '<leader>rpp',
            render_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rpp',
            render_pdf_sync, { buffer = args.buf })
        vim.keymap.set('n', '<leader>rps',
            render_slides, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rps',
            render_slides_sync, { buffer = args.buf })
    end
}

local callbacks = require("yoquec.core.docwritting.callbacks")

local function render_html()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.html]]

    vim.fn.jobstart(
        [[bash -c 'documenter -t html -o "]] .. output_path .. [[" "]] .. file_path .. [["']],
        { on_exit = callbacks.html_render_finish }
    )

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("html")
    print([[Creating HTML document with Documenter ]] .. icon .. [[...]])
end

local function render_html_sync()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.html]]
    vim.cmd(
        [[!documenter -t html -o "]] .. output_path .. [[" "]] .. file_path .. [["]]
    )
end

local function render_pdf()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]

    vim.fn.jobstart(
        [[bash -c 'documenter -t pdf -o "]] .. output_path .. [[" "]] .. file_path .. [["']],
        { on_exit = callbacks.document_render_finish }
    )

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document with Documenter ]] .. icon .. [[...]])
end


local function render_pdf_sync()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
    vim.cmd(
        [[!documenter -t pdf -o "]] .. output_path .. [[" "]] .. file_path .. [["]]
    )
end

return {
    autocmd_callback = function (args)
        vim.keymap.set('n', '<leader>rdp',
            render_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rdp',
            render_pdf_sync, { buffer = args.buf })
        vim.keymap.set('n', '<leader>rdh',
            render_html, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rdh',
            render_html_sync, { buffer = args.buf })
    end
}

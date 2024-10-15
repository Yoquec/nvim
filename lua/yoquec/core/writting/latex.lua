local viewers = require("yoquec.core.writting.viewers")
local callbacks = require("yoquec.core.writting.callbacks")

local function render_pdf()
    local file_path = vim.fn.expand("%:p")
    vim.fn.jobstart(
        [[bash -c 'latexmk -pdf "]] .. file_path .. [["]],
        { on_exit = callbacks.document_render_finish }
    )
    print("Creating latex pdf document with latexmk...")
end

local function render_pdf_sync()
    local file_path = vim.fn.expand("%:p")
    vim.cmd([[!latexmk -pdf "]] .. file_path .. [["]])
end

local function render_makefile()
    vim.fn.jobstart(
        [[bash -c 'make"]],
        { on_exit = callbacks.document_render_finish }
    )
    print("Creating latex document from 'make' command...")
end

local function render_makefile_sync()
    vim.cmd([[make]])
end

vim.api.nvim_create_autocmd("FileType", {
    group = "writting",
    pattern = "tex",
    callback = function(args)
        vim.keymap.set('n', '<leader>rlp', render_pdf, {
            buffer = args.buf,
            desc = "Render LaTeX pdf document with latexmk"
        })
        vim.keymap.set('n', '<leader><leader>rlp', render_pdf_sync, {
            buffer = args.buf,
            desc = "Render LaTeX pdf document with latexmk (foreground)"
        })
        vim.keymap.set('n', '<leader>rlm', render_makefile, {
            buffer = args.buf,
            desc = "Render LaTeX using the 'make' command"
        })
        vim.keymap.set('n', '<leader><leader>rlm', render_makefile_sync, {
            buffer = args.buf,
            desc = "Render LaTeX using the 'make' command (foreground)"
        })
        vim.keymap.set('n', '<leader>op', viewers.pdf.zathura, {
            buffer = args.buf,
            desc = "Open the compiled latex pdf file in zathura"
        })
        vim.keymap.set('n', '<leader>oP', viewers.pdf.default, {
            buffer = args.buf,
            desc = "Open the compiled latex pdf file in the default pdf viewer"
        })
    end
})

local viewers = require("yoquec.core.writting.viewers")
local pandoc = require("yoquec.core.writting.markdown.pandoc")

vim.api.nvim_create_autocmd("FileType", {
    group = "writting",
    pattern = "markdown",
    callback = function(args)
        -- Increase conceal only in markdown files
        vim.opt_local.conceallevel = 2

        -- Decrease tab size
        vim.bo[args.buf].shiftwidth = 2
        vim.bo[args.buf].tabstop = 2
        vim.bo[args.buf].softtabstop = 2

        vim.keymap.set('n', '<leader>op', viewers.pdf.zathura, {
            buffer = args.buf,
            desc = "Open the compiled pdf markdown file in zathura"
        })
        vim.keymap.set('n', '<leader>oP', viewers.pdf.default, {
            buffer = args.buf,
            desc = "Open the compiled pdf markdown file in the default pdf viewer"
        })
        vim.keymap.set('n', '<leader>oh', viewers.html.default, {
            buffer = args.buf,
            desc = "Open the compiled html markdown file in the default html viewer"
        })

        pandoc.autocmd_callback(args)
    end
})

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

        vim.keymap.set('n', '<leader>vp', viewers.pdf.default, { buffer = args.buf })
        vim.keymap.set('n', '<leader>vh', viewers.html.default, { buffer = args.buf })

        pandoc.autocmd_callback(args)
    end
})

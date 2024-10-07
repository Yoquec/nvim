local M = {
    pdf = {},
    html = {},
}

-- Opens PDF file with default PDF viewer
M.pdf.default = function ()
    local pdf_filename = vim.fn.expand("%:r") .. [[.pdf]]
    vim.fn.jobstart([[bash -c 'xdg-open "]] .. pdf_filename .. [["']])
    print([[Opened PDF]])
end

-- Opens HTML with the default browser
M.html.default = function()
    local html_filename = vim.fn.expand("%:r") .. [[.html]]
    vim.fn.jobstart([[bash -c 'xdg-open "]] .. html_filename .. [["']])
    print([[Opened HTML]])
end

return M

local M = {}

-- Opens PDF file with default PDF viewer
M.open_pdf = function ()
    local pdf_filename = vim.fn.expand("%:r") .. [[.pdf]]
    vim.fn.jobstart([[bash -c 'xdg-open "]] .. pdf_filename .. [["']])
    print([[ℹ PDF opened]])
end

-- Opens HTML document with surf and documenter custom stylefile
M.open_documenter = function ()
    local html_filename = vim.fn.expand("%:r") .. [[.html]]
    local style_file = "$HOME/.local/share/surf/styles/documenter.css"
    vim.fn.jobstart([[bash -c 'surf -a @ -S -C "]] ..style_file .. [[" "]] .. html_filename .. [["']])
    print([[ℹ HTML opened]])
end

-- Opens HTML with the default browser
M.open_html = function()
    local html_filename = vim.fn.expand("%:r") .. [[.html]]
    vim.fn.jobstart([[bash -c 'xdg-open "]] .. html_filename .. [["']])
    print([[ℹ HTML opened]])
end

return M

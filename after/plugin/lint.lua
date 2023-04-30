require('lint').linters_by_ft = {
  python = {'flake8',},
  markdown = {'markdownlint',},
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        require("lint").try_lint()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        require("lint").try_lint()
    end,
})

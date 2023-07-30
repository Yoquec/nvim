require('lint').linters_by_ft = {
  python = {'flake8', "mypy"},
  markdown = {'markdownlint',},
}

vim.keymap.set('n', '<leader><leader>L',  function ()
    require('lint').try_lint()
end)

require("todo-comments").setup()

vim.keymap.set("n", "<Leader>ft", vim.cmd.TodoTelescope)

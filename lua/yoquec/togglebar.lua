function ToggleBar()
    barstatus = vim.api.nvim_eval("&laststatus")

    if (barstatus < 2) then
        vim.opt.laststatus = 2
        vim.opt.showmode = false
    else
        vim.opt.laststatus = 0
        vim.opt.showmode = true
    end

end

-- set the keymap
vim.keymap.set("n", "<leader>b", ToggleBar)


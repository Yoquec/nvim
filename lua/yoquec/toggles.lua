-- ~~~~~~~~~~~~~~~~~~~~
-- lua bar
-- ~~~~~~~~~~~~~~~~~~~~
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

-- ~~~~~~~~~~~~~~~~~~~~
-- tabbar
-- ~~~~~~~~~~~~~~~~~~~~
function ToggleTabBar()
    barstatus = vim.api.nvim_eval("&showtabline")

    if (barstatus < 2) then
        vim.opt.showtabline = 2
    else
        vim.opt.showtabline = 0
    end

end

-- ~~~~~~~~~~~~~~~~~~~~
-- virtual text
-- ~~~~~~~~~~~~~~~~~~~~
local virtual_text_active = true

function ToggleVirtualText()
    if virtual_text_active then
        vim.diagnostic.config({ virtual_text = false })
        virtual_text_active = false
    else
        vim.diagnostic.config({ virtual_text = true })
        virtual_text_active = true
    end
end

-- set the keymaps
vim.keymap.set("n", "<leader>b", ToggleBar)
vim.keymap.set("n", "<leader>t", ToggleTabBar)
vim.keymap.set("n", "<leader>v", ToggleVirtualText)

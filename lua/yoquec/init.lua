require("yoquec.remap")
require("yoquec.set")
require("yoquec.toggles")
require("yoquec.packer")

-- autocommands
-- ~~~~~~~~~~~~~~~~~~~~
-- r markdown
-- ~~~~~~~~~~~~~~~~~~~~
vim.cmd([[
autocmd Filetype rmd map <Leader>rm :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
]])

-- vim.cmd([[
-- autocmd Filetype rmd :exe "Goyo"
-- ]])

-- ~~~~~~~~~~~~~~~~~~~~
-- markdown
-- ~~~~~~~~~~~~~~~~~~~~
vim.cmd([[
autocmd Filetype markdown map <Leader>ms :!slides<space>%<enter>
]])

-- vim.cmd([[
-- autocmd Filetype markdown :exe "Goyo"
-- ]])

-- ~~~~~~~~~~~~~~~~~~~~
-- goyo
-- ~~~~~~~~~~~~~~~~~~~~
-- Enable limelight automatically
vim.cmd([[
autocmd! User GoyoEnter :exe "lua require('lualine').hide()" | exe "set wrap" | exe "Limelight 0.4"
]])

vim.cmd([[
autocmd! User GoyoLeave :exe "lua require('lualine').hide({unhide=true})" | exe "set nowrap" | exe "Limelight!"
]])

-- ~~~~~~~~~~~~~~~~~~~~
-- neovide
-- ~~~~~~~~~~~~~~~~~~~~
if vim.g.neovide then
    -- set font and font size
    local font_size = 11
    vim.opt.guifont = "CaskaydiaCove NF:h" .. font_size

    function ResizeFont(delta)
        font_size = font_size + delta
        vim.opt.guifont = 'CaskaydiaCove NF:h' .. font_size
    end

    vim.keymap.set("n", "<expr><D-=>", ResizeFont(1))
    vim.keymap.set("n", "<expr><D-->", ResizeFont(-1))
end

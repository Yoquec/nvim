require("yoquec.remap")
require("yoquec.set")
require("yoquec.toggles")
require("yoquec.packer")

-- autocommands
-- ~~~~~~~~~~~~~~~~~~~~
-- r markdown
-- ~~~~~~~~~~~~~~~~~~~~
vim.cmd([[
autocmd Filetype rmd map <Leader>rm :call<space>jobstart(['bash', '-c', 'echo<space>"require(rmarkdown);<space>render(\"'..expand("%")..'\")"<space>\|<space>R<space>--vanilla'])<enter>
]])

-- Open the document in zathura document (after rendering to pdf)
vim.cmd([[
autocmd Filetype rmd map <Leader>ot :call<space>jobstart(['zathura', expand("%:r")..".pdf"])<enter>
]])


-- ~~~~~~~~~~~~~~~~~~~~
-- markdown
-- ~~~~~~~~~~~~~~~~~~~~

-- Async create slides with beamer
vim.cmd([[
autocmd Filetype markdown map <Leader>ms :call<space>jobstart(['bash',<space>'-c',<space>'slides<space>'..expand("%")])<enter>
]])

-- Async render md documents
vim.cmd([[
autocmd Filetype markdown map <Leader>md :call<space>jobstart(['bash',<space>'-c',<space>'pandoc<space>--pdf-engine=xelatex<space>'..expand("%:p")..'<space>-o<space>'..expand("%:p:r")..'.pdf'])<enter>
]])

-- Open the document in zathura document (after rendering to pdf)
vim.cmd([[
autocmd Filetype markdown map <Leader>ot :call<space>jobstart(['zathura', expand("%:r")..".pdf"])<enter>
]])


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

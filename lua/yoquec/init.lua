require("yoquec.remap")
require("yoquec.set")
require("yoquec.togglebar")
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

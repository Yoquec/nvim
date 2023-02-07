require("yoquec.remap")
require("yoquec.set")
require("yoquec.toggles")
require("yoquec.packer")

-- autocommand callbacks
vim.cmd([[
function! OnDocumentCreation(job_id, data, event) dict
  echo "📄 Document rendered!"
endfunction

function! OnSlidesCreation(job_id, data, event) dict
  echo "🎞 Slides rendered!"
endfunction
]])

-- autocommands
-- ~~~~~~~~~~~~~~~~~~~~
-- r markdown
-- ~~~~~~~~~~~~~~~~~~~~
vim.cmd([[
autocmd Filetype rmd map <Leader>rm :call<space>jobstart(['bash', '-c', 'echo<space>"require(rmarkdown);<space>render(\"'..expand("%")..'\")"<space>\|<space>R<space>--vanilla'], {'on_exit': function("OnDocumentCreation") })<enter>
]])

-- Open the document in zathura document (after rendering to pdf)
vim.cmd([[
autocmd Filetype rmd map <Leader>op :call<space>jobstart(['zathura', expand("%:r")..".pdf"])<enter>:echo "🔎 Zathura opened"<enter>
]])


-- ~~~~~~~~~~~~~~~~~~~~
-- markdown
-- ~~~~~~~~~~~~~~~~~~~~

-- Async create slides with beamer
vim.cmd([[
autocmd Filetype markdown map <Leader>ms :call<space>jobstart(['bash',<space>'-c',<space>'pandoc<space>--pdf-engine=xelatex<space>'..expand("%:p")..'<space>-t<space>beamer<space>-o<space>'..expand("%:r")..'.pdf'], {'on_exit': function("OnSlidesCreation") })<enter>:echo"Creating slides" luaeval("require('nvim-web-devicons').get_icon_by_filetype(\"ppt\")") "..."<enter>
]])

-- Async render md documents
vim.cmd([[
autocmd Filetype markdown map <silent> <Leader>rm :call<space>jobstart(['bash',<space>'-c',<space>'pandoc<space>--pdf-engine=xelatex<space>'..expand("%:p")..'<space>-o<space>'..expand("%:p:r")..'.pdf'], {'on_exit': function("OnDocumentCreation") })<enter>:echo"Creating pdf document" luaeval("require('nvim-web-devicons').get_icon_by_filetype(\"pdf\")") "..."<enter>
]])

-- Open the zathura document viewer for a file
vim.cmd([[
autocmd Filetype markdown map <silent> <Leader>op :call<space>jobstart(['zathura', expand("%:r")..".pdf"])<enter>:echo "🔎 Zathura opened"<enter>
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
-- if vim.g.neovide then
--     -- set font and font size
--     local font_size = 11
--     vim.opt.guifont = "CaskaydiaCove NF:h" .. font_size

--     function ResizeFont(delta)
--         font_size = font_size + delta
--         vim.opt.guifont = 'CaskaydiaCove NF:h' .. font_size
--     end

--     vim.keymap.set("n", "<expr><D-=>", ResizeFont(1))
--     vim.keymap.set("n", "<expr><D-->", ResizeFont(-1))
-- end

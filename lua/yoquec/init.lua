require("yoquec.remap")
require("yoquec.set")
require("yoquec.toggles")
require("yoquec.packer")

-- -------------------------------
-- autocommand function callbacks
-- -------------------------------
local function RenderRmd_onExit(chain_id, data, name)
    print("📄 Document rendered!")
end


local function RenderSlides_onExit()
    print("🎞 Slides rendered!")
end


-- ----------------------
-- autocommand functions
-- ----------------------
local function RenderRmd()
    local filename = vim.fn.expand("%")
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Rendering rmarkdown pdf ]] .. icon .. [[...]])

    vim.fn.jobstart(
        [[bash -c 'echo "require(rmarkdown); render(\"]] .. filename .. [[\")" | R --vanilla']],
        { on_exit = RenderRmd_onExit })
end


local function RenderRmdDebug()
    local filename = vim.fn.expand("%")
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Rendering rmarkdown pdf (debug mode) ]] .. icon .. [[...]])


    vim.cmd(
        [[!echo "require(rmarkdown); render(']] .. filename .. [[')" | R --vanilla]]
    )
end


local function RenderMd()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document ]] .. icon .. [[...]])

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex ]] .. fullfilename .. [[ -o ]] .. output_fullfilename .. [[']],
        { on_exit = RenderRmd_onExit }
    )
end


local function RenderMdDebug()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document (debug mode) ]] .. icon .. [[...]])

    vim.cmd(
        [[!pandoc --pdf-engine=xelatex ]] .. fullfilename .. [[ -o ]] .. output_fullfilename
    )
end


local function RenderSlides()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("ppt")
    print([[Creating slides ]] .. icon .. [[...]])

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex ]] .. fullfilename .. [[ -t beamer -o ]] .. output_fullfilename .. [[']],
        { on_exit = RenderSlides_onExit }
    )
end


local function RenderSlidesDebug()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("ppt")
    print([[Creating slides (debug mode) ]] .. icon .. [[...]])

    vim.cmd(
        [[!pandoc --pdf-engine=xelatex ]] .. fullfilename .. [[ -t beamer -o ]] .. output_fullfilename
    )
end


local function OpenPDF()
    local pdf_filename = vim.fn.expand("%:r") .. [[.pdf]]
    print([[🔎 Zathura opened]])

    vim.fn.jobstart([[bash -c "zathura ]] .. pdf_filename .. [["]])
end


local function EnterGoyo()
    require('lualine').hide()
    vim.opt.wrap = true
    vim.cmd([[Limelight 0.4]])
end


local function ExitGoyo()
    require('lualine').hide({ unhide = true })
    vim.opt.wrap = false
    vim.cmd([[Limelight!]])
end

-- //////////////////
-- autocommands
-- //////////////////
--
-- r markdown
-- ~~~~~~~~~~~~~~~~~~~~
-- async r document creation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rmd",
    callback = function(args)
        vim.keymap.set('n', '<Leader>rm',
            RenderRmd, { buffer = args.buf })
    end
})

-- r document creation (debug mode)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rmd",
    callback = function(args)
        vim.keymap.set('n', '<Leader>rd',
            RenderRmdDebug, { buffer = args.buf })
    end
})

-- open the rendered document with zathura
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rmd",
    callback = function(args)
        vim.keymap.set('n', '<Leader>op',
            OpenPDF, { buffer = args.buf })
    end
})


-- markdown
-- ~~~~~~~~~~~~~~~~~~~~
-- Async render md documents
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set('n', '<Leader>rm',
            RenderMd, { buffer = args.buf })
    end
})

-- Render md documents (debug mode)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set('n', '<Leader>rd',
            RenderMdDebug, { buffer = args.buf })
    end
})

-- Async create slides with beamer
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set('n', '<Leader>rs',
            RenderSlides, { buffer = args.buf })
    end
})

-- create slides with beamer (debug mode)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set('n', '<Leader><Leader>rd',
            RenderSlidesDebug, { buffer = args.buf })
    end
})

-- Open the zathura document viewer for the rendered file
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set('n', '<Leader>op',
            OpenPDF, { buffer = args.buf })
    end
})
-- ~~~~~~~~~~~~~~~~~~~~
-- goyo
-- ~~~~~~~~~~~~~~~~~~~~
-- Enable limelight automatically
vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoEnter",
    callback = EnterGoyo,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoLeave",
    callback = ExitGoyo,
})


-- ~~~~~~~~~~~~~~~~~~~~
-- neovide
-- ~~~~~~~~~~~~~~~~~~~~
-- if vim.g.neovide then
--     -- set font and font size
--     local font_size = 11
--     vim.opt.guifont = "CaskaydiaCove NF:h" .. font_size

--     function ResizeFont(delta)
--         font_size = font_size + delta
--         vim.opt.guifont = 'CaskaydiaCove NF:h' .. font_sRenderSlidesDebug
--     vim.keymap.set("n", "<expr><D-=>", ResizeFont(1))
--     vim.keymap.set("n", "<expr><D-->", ResizeFont(-1))
-- end

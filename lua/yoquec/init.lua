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

    vim.fn.jobstart(
        [[bash -c 'echo "require(rmarkdown); render(\"]] .. filename .. [[\")" | R --vanilla']],
        { on_exit = RenderRmd_onExit })

    print([[Rendering rmarkdown pdf ]] .. icon .. [[...]])
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

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex "]] .. fullfilename .. [[" -o "]] .. output_fullfilename .. [["']],
        { on_exit = RenderRmd_onExit }
    )

    print([[Creating pdf document ]] .. icon .. [[...]])
end


local function RenderMdDebug()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document (debug mode) ]] .. icon .. [[...]])

    vim.cmd(
        [[!pandoc --pdf-engine=xelatex "]] .. fullfilename .. [[" -o "]] .. output_fullfilename .. [["]]
    )

end


local function RenderSlides()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("ppt")

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex "]] .. fullfilename .. [[" -t beamer -o "]] .. output_fullfilename .. [["']],
        { on_exit = RenderSlides_onExit }
    )

    print([[Creating slides ]] .. icon .. [[...]])
end


local function RenderSlidesDebug()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, icon_name = require('nvim-web-devicons').get_icon_by_filetype("ppt")
    print([[Creating slides (debug mode) ]] .. icon .. [[...]])

    vim.cmd(
        [[!pandoc --pdf-engine=xelatex "]] .. fullfilename .. [[" -t beamer -o "]] .. output_fullfilename .. [["]]
    )

end


local function OpenPDF()
    local pdf_filename = vim.fn.expand("%:r") .. [[.pdf]]
    vim.fn.jobstart([[bash -c 'zathura "]] .. pdf_filename .. [["']])
    print([[🔎 Zathura opened]])
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
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rmd",
    callback = function(args)
        -- async r document creation
        vim.keymap.set('n', '<Leader>rm',
            RenderRmd, { buffer = args.buf })

        -- r document creation (debug mode)
        vim.keymap.set('n', '<Leader>rd',
            RenderRmdDebug, { buffer = args.buf })

        -- open the rendered document with zathura
        vim.keymap.set('n', '<Leader>op',
            OpenPDF, { buffer = args.buf })
    end
})


-- markdown
-- ~~~~~~~~~~~~~~~~~~~~
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        -- Async render md documents
        vim.keymap.set('n', '<Leader>rm',
            RenderMd, { buffer = args.buf })

        -- Render md documents (debug mode)
        vim.keymap.set('n', '<Leader>rd',
            RenderMdDebug, { buffer = args.buf })

        -- Async create slides with beamer
        vim.keymap.set('n', '<Leader>rs',
            RenderSlides, { buffer = args.buf })

        -- create slides with beamer (debug mode)
        vim.keymap.set('n', '<Leader><Leader>rd',
            RenderSlidesDebug, { buffer = args.buf })

        -- Open the zathura document viewer for the rendered file
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

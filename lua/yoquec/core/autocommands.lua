-- ----------
-- callbacks
-- ----------
local function doc_exit_cb(_, _, _)
    print("📄 Document rendered!")
end

local function slides_exit_cb(_, _, _)
    print("📊 Slides rendered!")
end

local function html_doc_exit_cb(_, _, _)
    print("🌐 Document (html) rendered!")
end

-- ----------
-- openers
-- ----------
local function open_pdf()
    local pdf_filename = vim.fn.expand("%:r") .. [[.pdf]]
    vim.fn.jobstart([[bash -c 'zathura "]] .. pdf_filename .. [["']])
    print([[🔎 PDF opened]])
end

local function open_html()
    local html_filename = vim.fn.expand("%:r") .. [[.html]]
    vim.fn.jobstart([[bash -c 'surf -a @ -S "]] .. html_filename .. [["']])
    print([[🌐 HTML opened]])
end


-- ----------
-- renderers
-- ----------
-- rmarkdown
local function render_rmd_pdf()
    local filename = vim.fn.expand("%")

    vim.fn.jobstart(
        [[bash -c 'echo "require(rmarkdown); render(\"]] .. filename .. [[\")" | R --vanilla']],
        { on_exit = doc_exit_cb })

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Rendering rmarkdown pdf ]] .. icon .. [[...]])
end

local function render_rmd_pdf_debug()
    local filename = vim.fn.expand("%")
    vim.cmd(
        [[!echo "require(rmarkdown); render(']] .. filename .. [[')" | R --vanilla]]
    )
end

-- documenter markdown
local function render_md_documenter_pdf()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]

    vim.fn.jobstart(
        [[bash -c 'go-documenter -t pdf -o "]] .. output_path .. [[" "]] .. file_path .. [["']],
        { on_exit = doc_exit_cb }
    )

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document with Documenter ]] .. icon .. [[...]])
end

local function render_md_documenter_pdf_debug()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
    vim.cmd(
        [[!go-documenter -t pdf -o "]] .. output_path .. [[" "]] .. file_path .. [["]]
    )
end

local function render_md_documenter_html()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.html]]

    vim.fn.jobstart(
        [[bash -c 'go-documenter -t html -o "]] .. output_path .. [[" "]] .. file_path .. [["']],
        { on_exit = html_doc_exit_cb }
    )

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating HTML document with Documenter ]] .. icon .. [[...]])
end

local function render_md_documenter_html_debug()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.html]]
    vim.cmd(
        [[!go-documenter -t html -o "]] .. output_path .. [[" "]] .. file_path .. [["]]
    )
end

-- pandoc + xelatex markdown
local function render_md_pandoc_doc()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex "]] .. file_path .. [[" -o "]] .. output_path .. [["']],
        { on_exit = doc_exit_cb }
    )

    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("pdf")
    print([[Creating pdf document with Pandoc ]] .. icon .. [[...]])
end

local function render_md_pandoc_doc_debug()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
    vim.cmd(
        [[!pandoc --pdf-engine=xelatex "]] .. file_path .. [[" -o "]] .. output_path .. [["]]
    )
end

local function render_md_pandoc_slides()
    local fullfilename = vim.fn.expand("%:p")
    local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype("ppt")

    vim.fn.jobstart(
        [[bash -c 'pandoc --pdf-engine=xelatex "]] ..
        fullfilename .. [[" -t beamer -o "]] .. output_fullfilename .. [["']],
        { on_exit = slides_exit_cb }
    )

    print([[Creating slides ]] .. icon .. [[...]])
end

local function render_md_pandoc_slides_debug()
    local file_path = vim.fn.expand("%:p")
    local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
    vim.cmd(
        [[!pandoc --pdf-engine=xelatex "]] .. file_path .. [[" -t beamer -o "]] .. output_path .. [["]]
    )
end


-- ----------
-- keymaps
-- ----------
-- rmarkdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rmd",
    callback = function(args)
        -- renderers
        vim.keymap.set('n', '<leader>rr',
            render_rmd_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rr',
            render_rmd_pdf_debug, { buffer = args.buf })
        -- readers
        vim.keymap.set('n', '<leader>op',
            open_pdf, { buffer = args.buf })
        -- formatting with prettier 
        vim.keymap.set('n', '<Leader><leader>P', function ()
            local filename = vim.fn.expand("%")
            vim.api.nvim_command([[!prettier "]] .. filename .. [[" --parser markdown --write]])
        end, { buffer = args.buf })
    end
})

-- markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        -- renderers
        vim.keymap.set('n', '<leader>rdp',
            render_md_documenter_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rdp',
            render_md_documenter_pdf_debug, { buffer = args.buf })
        vim.keymap.set('n', '<leader>rdh',
            render_md_documenter_html, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rdh',
            render_md_documenter_html_debug, { buffer = args.buf })
        vim.keymap.set('n', '<leader>rp',
            render_md_pandoc_doc, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rp',
            render_md_pandoc_doc_debug, { buffer = args.buf })
        vim.keymap.set('n', '<leader>rs',
            render_md_pandoc_slides, { buffer = args.buf })
        vim.keymap.set('n', '<leader><leader>rs',
            render_md_pandoc_slides_debug, { buffer = args.buf })
        -- readers
        vim.keymap.set('n', '<leader>op',
            open_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader>oh',
            open_html, { buffer = args.buf })

        -- Move through links such as in vimwiki
        vim.keymap.set('n', '<Tab>', function()
            local enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
            vim.api.nvim_feedkeys("/\\[.*\\](.*)" .. enter, 'm', false)
            vim.api.nvim_feedkeys(":noh" .. enter, 'm', false)
        end, { buffer = args.buf })

        vim.keymap.set('n', '<S-Tab>', function()
            local enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
            vim.api.nvim_feedkeys("?\\[.*\\](.*)" .. enter, 'm', false)
            vim.api.nvim_feedkeys(":noh" .. enter, 'm', false)
        end, { buffer = args.buf })

        -- Enter links vimwiki style
        vim.keymap.set('n', '<Enter>',
            'vibgf', { buffer = args.buf })
    end
})

-- ----------
-- Goyo
-- ----------
vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoEnter",
    callback = function()
        require('lualine').hide()
        vim.opt.wrap = true
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoLeave",
    callback = function()
        require('lualine').hide({ unhide = true })
        vim.opt.wrap = false
    end,
})

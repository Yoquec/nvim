local viewers = require("yoquec.core.docwritting.viewers")
local documenter = require("yoquec.core.docwritting.markdown.documenter")
local pandoc = require("yoquec.core.docwritting.markdown.pandoc")

--- Opens a file or heading
--- @param contents string
local function open(contents)
    local first_char = string.sub(contents, 1, 1)

    if first_char == "#" then
        vim.cmd.normal([[*]])
    elseif first_char == '.' then
        if string.sub(contents, 1, 2) == "./" then
            local current_folder = vim.fn.expand("%:p:h")
            local filename = string.sub(contents, 3, string.len(contents))
            vim.cmd.e(current_folder .. '/' .. filename)
        elseif string.sub(contents, 1, 3) == "../" then
            local parent_folder = vim.fn.expand("%:p:h:h")
            local filename = string.sub(contents, 4, string.len(contents))
            vim.cmd.e(parent_folder .. '/' .. filename)
        else
            print([[🚨 Could not open link "]] .. contents .. [["]])
        end
    else
        vim.cmd.e(contents)
    end
end

--- Opens the link under the cursor
local function navigate_link_under_cursor()
    -- clear the register
    vim.fn.setreg('z', '')

    -- search parenthesis
    vim.cmd.normal([["zyib]])
    local contents = vim.fn.getreg('z')
    if contents ~= nil and contents ~= "" then
        open(contents)
        return
    end

    -- clear the register
    vim.fn.setreg('z', '')

    -- search brackets
    vim.cmd.normal([["zyiB]])
    contents = vim.fn.getreg('z')
    if contents ~= nil and contents ~= "" then
        -- remove extra []
        if contents[0] == "[" and contents[string.len(contents)] == "]" then
            contents = string.sub(contents, 2, string.len(contents))
            contents = string.sub(contents, 1, string.len(contents) - 1)
        end
        open(contents)
        return
    end

    print([[⚠ Could not find any link"]])
end

vim.api.nvim_create_autocmd("FileType", {
    group = "docwritting",
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set('n', '<leader>op',
            viewers.open_pdf, { buffer = args.buf })
        vim.keymap.set('n', '<leader>oh',
            viewers.open_html, { buffer = args.buf })
        vim.keymap.set('n', '<leader>od',
            viewers.open_documenter, { buffer = args.buf })
        vim.keymap.set('n', '<enter>',
            navigate_link_under_cursor, { buffer = args.buf })

        documenter.autocmd_callback(args)
        pandoc.autocmd_callback(args)
    end
})

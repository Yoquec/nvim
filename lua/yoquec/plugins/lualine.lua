local colors = require('yoquec.core.colors')
local modes = colors.gen_lualine_theme()
local components = colors.components

local bg = components.ui.bg.normal
local fg = components.ui.fg.normal

-- Eviline config for lualine
-- Author: shadmansaleh
-- modified by Yoquec
-- Credit: glepnir

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local lualine = require('lualine')
        local backup_icons = {
            vimrc = "",
            viminfo = "",
            conf = "",
            sh = "",
            bash = "",
            zsh = "",
            snippets = "",
            help = "ﬤ",
            i3config = "",
            packer = "",
        }
        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }


        local function getStateColor()
            -- auto change color according to neovims mode
            return { fg = modes[vim.fn.mode()], bg = bg, gui = 'bold' }
        end

        local function getIcon()
            local ft = vim.api.nvim_eval("&filetype")
            if ft == '' then
                return ""
            else
                local icon, _ = require("nvim-web-devicons").get_icon_by_filetype(ft)
                if icon then
                    return icon
                else
                    local icon_bkp = backup_icons[ft]
                    if icon_bkp then
                        return icon_bkp
                    else
                        return ""
                    end
                end
            end
        end

        lualine.setup({
            options = {
                component_separators = '',
                section_separators = '',
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = fg, bg = bg } },
                    inactive = { c = { fg = fg, bg = bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- Left of the line
                lualine_c = {
                    {
                        'mode',
                        color = getStateColor,
                        padding = { right = 1, left = 1 },
                    },
                    {
                        getIcon,
                        color = function()
                            local _, color = require("nvim-web-devicons").get_icon_color_by_filetype(vim.api.nvim_eval(
                                "&filetype"))
                            if color == nil then
                                color = fg
                            end
                            return { fg = color }
                        end,
                        padding = { right = 0, left = 2 },
                        cond = conditions.buffer_not_empty,
                    },
                    {
                        'filename',
                        cond = conditions.buffer_not_empty,
                        color = { fg = fg, gui = 'bold' },
                    }
                },
                -- Right of the line
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = { error = '● ', warn = '● ', info = '● ', hint = '● ' },
                        diagnostics_color = {
                            error = { fg = components.diagnostics.error },
                            warn = { fg = components.diagnostics.warn },
                            info = { fg = components.diagnostics.info },
                            hint = { fg = components.diagnostics.hint },
                        },
                    },
                    {
                        'branch',
                        icon = '',
                        color = { fg = fg, gui = 'bold' },
                    },
                    {
                        'diff',
                        symbols = { added = '+ ', modified = '~ ', removed = '- ' },
                        diff_color = {
                            added = { fg = components.vcs.added },
                            modified = { fg = components.vcs.modified },
                            removed = { fg = components.vcs.removed },
                        },
                        cond = conditions.hide_in_width,
                    },
                    {
                        'location',
                        padding = { right = 1, left = 1 },
                    },
                    {
                        'progress',
                        color = { fg = fg, gui = 'bold' },
                        padding = { right = 2, left = 1 },
                    },
                    {
                        'o:encoding', -- option component same as &encoding in viml
                        cond = conditions.hide_in_width,
                        color = getStateColor,
                    },
                    {
                        'fileformat',
                        icons_enabled = true,
                        color = getStateColor,
                    },
                },
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_x = {},
                -- Insert left
                lualine_c = {
                    {
                        getIcon,
                        color = { fg = components.ui.bg.dark, bg = components.ui.accent },
                        padding = { right = 1, left = 1 },
                        cond = conditions.buffer_not_empty,
                    },
                    {
                        'filename',
                        cond = conditions.buffer_not_empty,
                        color = { fg = components.ui.bg.dark, bg = components.ui.accent, gui = 'bold' },
                        padding = { right = 1, left = 0 },
                    },
                },
            },
        })
    end
}

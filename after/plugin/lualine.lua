-- Eviline config for lualine
-- Author: shadmansaleh
-- modified by Yoquec
-- Credit: glepnir
local lualine = require('lualine')
local palette = require('yoquec.colors').get_base_colors()

-- Color table for highlights
local colors = {
    bg       = palette.bg,
    fg       = palette.fg1,
    black    = palette.bg1,
    yellow   = palette.yellow,
    cyan     = palette.neutral_aqua,
    darkblue = palette.neutral_blue,
    green    = palette.green,
    orange   = palette.orange,
    violet   = palette.purple,
    magenta  = palette.neutral_purple,
    blue     = palette.blue,
    red      = palette.red,
    accent   = palette.accent
}


local function getStateColor()
    -- auto change color according to neovims mode
    local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.violet,
    }
    return { fg = mode_color[vim.fn.mode()], bg = colors.bg, gui = 'bold' }
end

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

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

local function ins_left_inact(component)
    table.insert(config.inactive_sections.lualine_c, component)
end

-- inactive components
ins_left_inact {
    getIcon,
    color = { fg = colors.black, bg = colors.accent },
    padding = { right = 1, left = 1 },
    cond = conditions.buffer_not_empty,
}

ins_left_inact {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.black, bg = colors.accent, gui = 'bold' },
    padding = { right = 1, left = 0 },
}


-- active left components
ins_left {
    -- mode component
    'mode',
    color = getStateColor,
    padding = { right = 1, left = 1 },
}


ins_left {
    getIcon,
    color = function()
        local _, color = require("nvim-web-devicons").get_icon_color_by_filetype(vim.api.nvim_eval("&filetype"))
        if color == nil then
            color = colors.fg
        end
        return { fg = color }
    end,
    padding = { right = 0, left = 2 },
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.fg, gui = 'bold' },
}


-- Add components to right sections
ins_right {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = '● ', warn = '● ', info = '● ' },
    diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
    },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
    'diff',
    symbols = { added = '+ ', modified = '~ ', removed = '- ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    'location',
    padding = { right = 1, left = 1 },
}

ins_right {
    'progress',
    color = { fg = colors.fg, gui = 'bold' },
    padding = { right = 2, left = 1 },
}



ins_right {
    'o:encoding', -- option component same as &encoding in viml
    cond = conditions.hide_in_width,
    color = getStateColor,
}

ins_right {
    'fileformat',
    icons_enabled = true,
    color = getStateColor,
}


-- Now don't forget to initialize lualine
lualine.setup(config)

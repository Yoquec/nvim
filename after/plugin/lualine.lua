-- Eviline config for lualine
-- Author: shadmansaleh
-- modified by Yoquec
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#1d2021',
    fg       = '#d5c4a1',
    yellow   = '#fabd2f',
    cyan     = '#8ec07c',
    darkblue = '#008080',
    green    = '#b8bb26',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
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
    return { bg = mode_color[vim.fn.mode()], fg = colors.bg, gui = 'bold' }
end

local icons = {
    fi = "",
    ex = "",
    vimrc = "",
    viminfo = "",
    gitignore = "",
    conf = "",
    c = "",
    cc = "",
    rust = "",
    clj = "",
    coffee = "",
    cpp = "",
    css = "",
    dart = "",
    erl = "",
    exs = "",
    fs = "",
    go = "",
    h = "",
    hh = "",
    hpp = "",
    hs = "",
    html = "",
    java = "",
    jl = "",
    js = "",
    json = "",
    lua = "",
    md = "",
    rmd = "(r)",
    markdown = "",
    php = "",
    pl = "",
    pro = "",
    py = "",
    python = "",
    rb = "",
    rs = "",
    scala = "",
    ts = "",
    vim = "",
    sh = "",
    bash = "",
    zsh = "",
    tex = "",
    snippets = "",
    r = "ﱨ",
    yaml = "",
    toml = "",
    text = "",
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
    function()
        icon = icons[vim.api.nvim_eval("&filetype")]
        if icon
        then
            return icon
        else
            return ' '
        end
    end,
    color = { fg = colors.bg, bg = colors.fg },
    padding = { right = 1, left = 1 },
    cond = conditions.buffer_not_empty,
}

ins_left_inact {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { bg = colors.fg, fg = colors.bg, gui = 'bold' },
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
    function()
        icon = icons[vim.api.nvim_eval("&filetype")]
        if icon
        then
            return icon
        else
            return ''
        end
    end,
    color = { fg = colors.fg},
    padding = { right = 0, left = 2 },
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.fg, gui = 'bold' },
}


ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
-- ins_left {
--   function()
--     return '%='
--   end,
-- }


-- Add components to right sections

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.white, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
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

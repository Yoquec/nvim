local path = require("plenary.path")
local wiki_directory = os.getenv("WIKI_HOME")

local function getTemplateConfig(wiki_home)
    local template_dir = "templates"

    local config = {
        folder = template_dir,
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
    }

    if not vim.loop.fs_stat(path.new(wiki_home, template_dir).filename) then
        config = nil
    end

    return config
end

local function getTemplatesNames(config)
    local daily_notes = "daily_notes"

    if config == nil then
        daily_notes = nil
    end

    return {
        daily_notes = daily_notes
    }
end


if wiki_directory == nil then
    vim.api.nvim_err_writeln("Could not read the WIKI_HOME environment variable")
else
    local templates = getTemplateConfig(wiki_directory)
    local template_names = getTemplatesNames(templates)

    return {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        event = {
            "BufReadPre " .. wiki_directory .. "**.md",
            "BufNewFile " .. wiki_directory .. "**.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            notes_subdir = "zk",
            templates = templates,
            workspaces = {
                {
                    -- TODO: Refine in the future to more workspaces
                    name = "main",
                    path = wiki_directory,
                },
            },
            daily_notes = {
                folder = "dailies",
                date_format = "%Y-%m-%d",
                alias_format = "%B %-d, %Y",
                default_tags = { "daily-notes" },
                template = template_names.daily_notes
            },
        }
    }
end

local path = require("plenary.path")
local wiki_directory = os.getenv("WIKI_HOME")

local function get_template_config(wiki_home)
	local templates_dir = "templates"
	local templates_path = path.new(wiki_home, templates_dir)

	if not vim.loop.fs_stat(templates_path.filename) then
		return nil
	end

	return {
		folder = templates_dir,
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		substitutions = {},
	}
end

local function get_workspace_config(wiki_home)
	return {
		{ name = "main", path = wiki_home },
	}
end

local function time_based_note_id(_)
	return os.date("%Y%m%d%H%M%S")
end

local function get_daily_notes_config(templates_config)
	if templates_config == nil then
		return nil
	end

	return {
		folder = "dailies",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
		default_tags = { "daily-notes" },
		template = "daily_note",
	}
end

if wiki_directory == nil then
	vim.api.nvim_err_writeln("Could not read the WIKI_HOME environment variable")
else
	local template_config = get_template_config(wiki_directory)
	return {
		"Yoquec/obsidian.nvim",
		lazy = true,
		event = {
			"BufReadPre " .. wiki_directory .. "**.md",
			"BufNewFile " .. wiki_directory .. "**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			new_notes_location = "notes_subdir",
			templates = template_config,
			follow_url_func = vim.ui.open,
			note_id_func = time_based_note_id,
			workspaces = get_workspace_config(wiki_directory),
			daily_notes = get_daily_notes_config(template_config),
			ui = {
				tags = { hl_group = "@obsidian.tag" },
			},
		},
		keys = {
            -- stylua: ignore start
			{ "<leader>wd", [[<cmd>ObsidianToday<CR>]], desc = "Open today's daily note" },
			{ "<leader>wy", [[<cmd>ObsidianYesterday<CR>]], desc = "Open yesterdays's daily note" },
			{ "<leader>wt", [[<cmd>ObsidianTomorrow<CR>]], desc = "Open tomorrow's daily note" },
			{ "<leader>wn", [[<cmd>ObsidianNew<CR>]], desc = "Creates a new wiki note" },
			{ "<leader>wN", [[<cmd>ObsidianNewFromTemplate<CR>]], desc = "Creates a new wiki note from templates" },
			{ "<leader>ww", [[<cmd>ObsidianWorkspace<CR>]], desc = "List obidian workspaces" },
			{ "<leader>fww", [[<cmd>ObsidianSearch<CR>]], desc = "Searches wiki note contents" },
			{ "<leader>fwn", [[<cmd>ObsidianQuickSwitch<CR>]], desc = "Open quick note switcher" },
			{ "<leader>fwt", [[<cmd>ObsidianTags<CR>]], desc = "Open picker with vault tags" },
			{ "<leader>fwl", [[<cmd>ObsidianLinks<CR>]], desc = "Open picker with outgoing links" },
			{ "<leader>fwb", [[<cmd>ObsidianBacklinks<CR>]], desc = "Opens picker with note's backlinks" },
			-- stylua: ignore end
		},
	}
end

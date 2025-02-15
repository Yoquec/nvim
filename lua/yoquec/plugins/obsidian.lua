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
		daily_notes = daily_notes,
	}
end

if wiki_directory == nil then
	vim.api.nvim_err_writeln("Could not read the WIKI_HOME environment variable")
else
	local templates = getTemplateConfig(wiki_directory)
	local template_names = getTemplatesNames(templates)

	return {
		"Yoquec/obsidian.nvim",
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
			new_notes_location = "notes_subdir",
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
				template = template_names.daily_notes,
			},
			ui = {
				hl_groups = {
					ObsidianImportant = { fg = "#fabd2f" },
					ObsidianTodo = { bold = true, fg = "#f78c6c" },
					ObsidianDone = { bold = true, fg = "#89ddff" },
					ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
					ObsidianTilde = { bold = true, fg = "#ff5370" },
					ObsidianBullet = { bold = true, fg = "#89ddff" },
					ObsidianRefText = { underline = true, fg = "#c792ea" },
					ObsidianExtLinkIcon = { fg = "#c792ea" },
					ObsidianTag = { italic = true, fg = "#89ddff" },
					ObsidianBlockID = { italic = true, fg = "#89ddff" },
					ObsidianHighlightText = { bg = "#75662e" },
				},
			},
			follow_url_func = function(url)
				vim.ui.open(url)
			end,
		},
		keys = {
			{ "<leader>wd", [[<cmd>ObsidianToday<CR>]], desc = "Opens today's daily note" },
			{ "<leader>wy", [[<cmd>ObsidianYesterday<CR>]], desc = "Opens yesterday's daily note" },
			{ "<leader>wt", [[<cmd>ObsidianTomorrow<CR>]], desc = "Opens tomorrow's daily note" },
			{ "<leader>wn", [[<cmd>ObsidianNew<CR>]], desc = "Creates a new wiki note" },
			{ "<leader>fww", [[<cmd>ObsidianSearch<CR>]], desc = "Searches wiki note contents" },
			{ "<leader>fwn", [[<cmd>ObsidianQuickSwitch<CR>]], desc = "Searches wiki note entries" },
			{ "<leader>fwt", [[<cmd>ObsidianTags<CR>]], desc = "Opens a picker for note tags" },
			{ "<leader>fwd", [[<cmd>ObsidianDailies<CR>]], desc = "Opens a picker for daily notes" },
			{
				"<leader>fwl",
				[[<cmd>ObsidianLinks<CR>]],
				desc = "Opens a picker for the current note's backlinks",
			},
			{
				"<leader>fwb",
				[[<cmd>ObsidianBacklinks<CR>]],
				desc = "Opens a picker for the current note's backlinks",
			},
		},
	}
end

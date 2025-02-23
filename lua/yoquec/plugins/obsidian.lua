local path = require("plenary.path")
local wiki_directory = os.getenv("WIKI_HOME")

local function get_template_config(wiki_home)
	local template_dirname = "templates"

	local config = {
		folder = template_dirname,
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		-- A map for custom variables, the key should be the variable and the value a function
		substitutions = {},
	}

	if not vim.loop.fs_stat(path.new(wiki_home, template_dirname).filename) then
		config = nil
	end

	return config
end

if wiki_directory == nil then
	vim.api.nvim_err_writeln("Could not read the WIKI_HOME environment variable")
else
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
			templates = get_template_config(wiki_directory),
			workspaces = {
				{
					name = "main",
					path = wiki_directory,
				},
			},
			follow_url_func = function(url)
				vim.ui.open(url)
			end,
		},
		keys = {
            -- stylua: ignore start
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

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

local function get_workspace_config(wiki_home)
	return {
		{ name = "main", path = wiki_directory },
	}
end

local function no_tags_frontmatter(note)
	if note.title then
		note:add_alias(note.title)
	end

	local out = { id = note.id, aliases = note.aliases }

	if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
		for k, v in pairs(note.metadata) do
			out[k] = v
		end
	end

	return out
end

if wiki_directory == nil then
	vim.api.nvim_err_writeln("Could not read the WIKI_HOME environment variable")
else
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
			templates = get_template_config(wiki_directory),
			workspaces = get_workspace_config(wiki_directory),
			note_frontmatter_func = no_tags_frontmatter,
			follow_url_func = vim.ui.open,
			ui = {
				tags = { hl_group = "@obsidian.tag" },
			},
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

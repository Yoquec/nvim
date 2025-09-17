local wiki_directory = os.getenv("WIKI_HOME")

local template = {
	daily = "daily_note.md",
	note = "note.md",
}

-- Returns a function to create a daily note for the specified day
local function get_daily_note(date)
	return function()
		local new = require("zk.commands").get("ZkNew")
		new({ date = date, dir = "dailies", template = template.daily, group = "daily" })
	end
end

if wiki_directory ~= nil then
	return {
		"zk-org/zk-nvim",
		name = "zk",
		lazy = true,
		event = {
			"BufReadPre " .. wiki_directory .. "**.md",
			"BufNewFile " .. wiki_directory .. "**.md",
		},
		opts = {
			picker = "snacks_picker",
		},
		keys = {
			{ "<leader>zf", vim.cmd.ZkNotes, desc = "Open notes" },
			{ "<leader>zo", [[<Cmd>ZkNotes { sort = { 'modified' } }<cr>]], desc = "Open recent notes" },
			{ "<leader>zd", get_daily_note("today"), desc = "Create a daily note (today)" },
			{ "<leader>zy", get_daily_note("yesterday"), desc = "Create a daily note (yesterday)" },
			{ "<leader>zT", get_daily_note("tomorrow"), desc = "Create a daily note (tomorrow)" },
			-- TODO: Insert tags directly from the picker?
			{ "<leader>zt", vim.cmd.ZkTags, desc = "Open tags" },
			{ "<leader>zb", vim.cmd.ZkBuffers, desc = "Open picker with open note buffers" },
			{ "<leader>zB", vim.cmd.ZkBacklinks, desc = "Backlinks for current note" },
			{ "<leader>zl", vim.cmd.ZkLinks, desc = "Links for current note" },
			{ "<leader>zNc", vim.cmd.ZkNewFromContentSelection, desc = "Create new note with the selected content" },
			{
				"<leader>zNt",
				vim.cmd.ZkNewFromTitleSelection,
				desc = "Create new note using the selected content as title",
			},
			{
				"<leader>zn",
				function()
					local title = vim.fn.input("Title: ")
					local new = require("zk.commands").get("ZkNew")
					new({ title = title, template = template.note })
				end,
				desc = "Create a new zettlekasten note",
			},
		},
	}
end

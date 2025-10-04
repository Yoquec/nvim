local wiki_directory = os.getenv("WIKI_HOME")

-- Returns a function to create a daily note for the specified day
local function get_daily_note(date)
	return function()
		local new = require("zk.commands").get("ZkNew")
		new({ date = date, dir = "dailies", group = "daily" })
	end
end

-- If wiki isn't set up, don't set up the extension
if wiki_directory == nil then
	return {}
end

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
		{ "<leader>zz", vim.cmd.ZkNotes, desc = "Open notes" },
		{ "<leader>zo", [[<Cmd>ZkNotes { sort = { 'modified' } }<cr>]], desc = "Open recent notes" },
		{ "<leader>zd", get_daily_note("today"), desc = "Create a daily note (today)" },
		{ "<leader>zy", get_daily_note("yesterday"), desc = "Create a daily note (yesterday)" },
		{ "<leader>zT", get_daily_note("tomorrow"), desc = "Create a daily note (tomorrow)" },
		{ "<leader>zt", vim.cmd.ZkTags, desc = "Open tags" },
		{ "<leader>zB", vim.cmd.ZkBacklinks, desc = "Backlinks for current note" },
		{ "<leader>zl", vim.cmd.ZkLinks, desc = "Links for current note" },
		{ "<leader>zL", vim.cmd.ZkInsertLink, desc = "Insert a link under the cursor" },
		{
			"<leader>zb",
			vim.cmd.ZkBuffers,
			desc = "Open picker with open note buffers",
		},
		{
			"<leader>zL",
			[[<cmd>'<,'>ZkInsertLinkAtSelection { sort = {'modified' } }<cr>]],
			mode = { "v" },
			desc = "Insert a link over the current selection",
		},
		{
			"<leader>zft",
			[[<cmd>'<,'>ZkNewFromTitleSelection<cr>]],
			mode = { "v" },
			desc = "Create new note using the selected content as title",
		},
		{
			"<leader>zfc",
			function()
				local title = vim.fn.input("Title: ")

				if title == "" then
					print("Operation cancelled")
					return
				end

				vim.cmd([['<,'>ZkNewFromContentSelection { title = ']] .. title .. [[' }]])
			end,
			mode = { "v" },
			desc = "Create new note with the selected content",
		},
		{
			"<leader>zn",
			function()
				local title = vim.fn.input("Title: ")

				if title == "" then
					print("Operation cancelled")
					return
				end

				local new = require("zk.commands").get("ZkNew")
				new({ title = title })
			end,
			desc = "Create a new zettlekasten note",
		},
	},
}

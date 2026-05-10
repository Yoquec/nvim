local wiki_directory = os.getenv("WIKI_HOME")

local function with_title(cb)
	vim.ui.input({ prompt = "Title" }, function(title)
		if title == nil or title == "" then
			print("Operation canceled")
		else
			cb(title)
		end
	end)
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
				with_title(function(title)
					vim.cmd([['<,'>ZkNewFromContentSelection { title = ']] .. title .. [[' }]])
				end)
			end,
			mode = { "v" },
			desc = "Create new note with the selected content",
		},
		{
			"<leader>zn",
			function()
				with_title(function(title)
					local new = require("zk.commands").get("ZkNew")
					new({ title = title })
				end)
			end,
			desc = "Create a new zettlekasten note",
		},
	},
}

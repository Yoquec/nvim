local conceal = vim.opt.conceallevel

local function zen_on_open(_)
	vim.opt.wrap = true
	vim.opt.nu = false
    vim.opt.rnu = false
	vim.opt.conceallevel = 0
end

local function zen_on_close(_)
	vim.opt.wrap = false
	vim.opt.nu = true
	vim.opt.relativenumber = true
	vim.opt.conceallevel = conceal
end

return {
	"folke/snacks.nvim",
    lazy = false,
	opts = {
		notifier = {},
		input = {},
		picker = {},
		zen = {
			toggles = {
				dim = false,
			},
			win = {
				width = 90,
			},
			on_open = zen_on_open,
			on_close = zen_on_close,
		},
	},
	keys = {
		{
			"<leader>zz",
			function()
				require("snacks").zen.zen()
			end,
			desc = "Toggle [Z]en mode",
		},
	},
}

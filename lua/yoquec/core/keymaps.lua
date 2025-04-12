local function toggle_tab_bar()
	local barstatus = vim.api.nvim_eval("&showtabline")
	if barstatus < 2 then
		vim.opt.showtabline = 2
	else
		vim.opt.showtabline = 0
	end
end

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves the selection one line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves the selection one line down" })

vim.keymap.set("v", "H", "<gv", { desc = "Dedents selection" })
vim.keymap.set("v", "L", ">gv", { desc = "Indents selection" })

-- Copying and pasting
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into the system register" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from the system register" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Prepend paste from the system register" })
vim.keymap.set("v", "P", '"_dP', { desc = "Paste without populating the register with the selection" })

-- Windows
vim.keymap.set("n", "<A-C-j>", ":resize -2<CR>", { desc = "Resize window down" })
vim.keymap.set("n", "<A-C-k>", ":resize +2<CR>", { desc = "Resize window up" })
vim.keymap.set("n", "<A-C-h>", ":vertical resize -2<CR>", { desc = "Resize window left" })
vim.keymap.set("n", "<A-C-l>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- Tabs
vim.keymap.set("n", "<leader>mt", vim.cmd.tabnew, { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>mn", vim.cmd.tabn, { desc = "Move to the next tab" })
vim.keymap.set("n", "<leader>mp", vim.cmd.tabp, { desc = "Move to the previous tab" })
vim.keymap.set("n", "<leader>tt", toggle_tab_bar, { desc = "Toggle tab bar visibility" })

-- Misc
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Rename word under cursor (without lsp)" }
)
vim.keymap.set(
	"n",
	"<leader>ot",
	[[<cmd>execute "tabnew" | execute "terminal" <CR>]],
	{ desc = "Open a terminal in a separate tab" }
)
vim.keymap.set("n", "<BS>", vim.cmd.noh, { desc = "Clear highlight search" })
vim.keymap.set("n", "<C-BS>", vim.diagnostic.reset, { desc = "Clear LSP diagnostics" })
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "Exit from terminal mode to normal mode" })

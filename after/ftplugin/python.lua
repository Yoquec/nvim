--- Override global symbol finding
local function find_symbol(query)
	vim.cmd([[Telescope lsp_workspace_symbols theme=dropdown query=]] .. query)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.keymap.set("n", "<leader>flS", function()
			vim.ui.input({ prompt = "Workspace symbol search" }, find_symbol)
		end)
	end,
})

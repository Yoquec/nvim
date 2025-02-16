local M = {}

local virtual_text = true
vim.diagnostic.config({ virtual_text = virtual_text })

M.toggle_virtual_text = function()
	virtual_text = not virtual_text
	vim.diagnostic.config({ virtual_text = virtual_text })
end

return M

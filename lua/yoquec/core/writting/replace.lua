local M = {}

---Replaces the text under the cursor with the output of the function provided in the closure
---@param replacer function function to transform text under the cursor
---@return function
M.with = function(replacer)
	return function()
		local s_row, s_col = unpack(vim.fn.getpos("'<"), 2, 3)
		local e_row, e_col = unpack(vim.fn.getpos("'>"), 2, 3)
		s_row = s_row - 1
		e_row = e_row - 1
		s_col = s_col - 1

		-- Avoid error when executing at the end of the line (cursor-relative)
		local curr_line_lenght = string.len(vim.api.nvim_get_current_line())
		if e_col == curr_line_lenght + 1 then
			e_col = e_col - 1
		end

		local lines = vim.api.nvim_buf_get_text(0, s_row, s_col, e_row, e_col, {})
		local text = lines[1]

		vim.api.nvim_buf_set_text(0, s_row, s_col, e_row, e_col, { replacer(text) })
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", false)
	end
end

return M

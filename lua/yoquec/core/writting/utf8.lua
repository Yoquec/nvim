local utf8 = require("utf8")

local M = {}

---Superscripts a single utf8 symbol
---@param codepoint integer utf8 codepoint
local function superscript_single(codepoint)
	-- number 0
	if codepoint == 48 then
		return 8304
	-- number 1
	elseif codepoint == 49 then
		return 185
	-- numbers from 2 to 3
	elseif 50 <= codepoint and codepoint <= 51 then
		local offset = 128
		return codepoint + offset
	-- numbers from 4 to 9
	elseif 52 <= codepoint and codepoint <= 57 then
		local offset = 8256
		return codepoint + offset
	else
		return codepoint
	end
end

---Returns a superscript version of the string
---@param text string Utf8 encoded input string
M.superscript = function(text)
	local res = {}
	for _, rune in utf8.codes(text) do
		local cp = vim.fn.char2nr(rune)
		local superscript_cp = superscript_single(cp)
		table.insert(res, vim.fn.nr2char(superscript_cp))
	end
	return table.concat(res)
end

return M

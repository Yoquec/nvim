local callbacks = require("yoquec.core.writting.callbacks")
local viewers = require("yoquec.core.writting.viewers")

vim.opt_local.conceallevel = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

local function render_pdf()
	local filename = vim.fn.expand("%")

	vim.fn.jobstart(
		[[bash -c 'echo "require(rmarkdown); render(\"]] .. filename .. [[\")" | R --vanilla']],
		{ on_exit = callbacks.document_render_finish }
	)

	print([[Rendering rmarkdown pdf]])
end

local function render_pdf_sync()
	local filename = vim.fn.expand("%")
	vim.cmd([[!echo "require(rmarkdown); render(']] .. filename .. [[')" | R --vanilla]])
end

vim.keymap.set("n", "<leader>rr", render_pdf, {
	buffer = 0,
	desc = "Render the rmarkdown document into pdf",
})
vim.keymap.set("n", "<leader><leader>rr", render_pdf_sync, {
	buffer = 0,
	desc = "Render the Rmarkdown document into pdf (foreground)",
})
vim.keymap.set("n", "<leader>op", viewers.pdf.zathura, {
	buffer = 0,
	desc = "Open the compiled rmarkdown pdf file in zathura",
})
vim.keymap.set("n", "<leader>oP", viewers.pdf.default, {
	buffer = 0,
	desc = "Open the compiled rmarkdown pdf file in the default pdf viewer",
})

-- Override the formatting command to use prettier
vim.keymap.set("n", "<Leader>F", function()
	local filename = vim.fn.expand("%")
	vim.cmd([[!prettier "]] .. filename .. [[" --parser markdown --write]])
end, { buffer = 0, desc = "Format the current file" })

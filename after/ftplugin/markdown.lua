local callbacks = require("yoquec.core.writting.callbacks")
local viewers = require("yoquec.core.writting.viewers")

vim.opt_local.conceallevel = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.wrap = true

--- Creates pdf document with pandoc (in the foreground)
local function render_pdf()
	local file_path = vim.fn.expand("%:p")
	local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]

	vim.fn.jobstart(
		[[bash -c 'pandoc --pdf-engine=xelatex --citeproc "]] .. file_path .. [[" -o "]] .. output_path .. [["']],
		{ on_exit = callbacks.document_render_finish }
	)

	local icon, _ = require("nvim-web-devicons").get_icon_by_filetype("pdf")
	print([[Creating pdf document with Pandoc ]] .. icon .. [[...]])
end

--- Creates pdf document with pandoc (in the foreground)
local function render_pdf_sync()
	local file_path = vim.fn.expand("%:p")
	local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
	vim.cmd([[!pandoc --pdf-engine=xelatex --citeproc "]] .. file_path .. [[" -o "]] .. output_path .. [["]])
end

--- Create slides with beamer
local function render_slides()
	local fullfilename = vim.fn.expand("%:p")
	local output_fullfilename = vim.fn.expand("%:p:r") .. [[.pdf]]
	local icon, _ = require("nvim-web-devicons").get_icon_by_filetype("ppt")

	vim.fn.jobstart(
		[[bash -c 'pandoc --pdf-engine=xelatex "]]
			.. fullfilename
			.. [[" -t beamer -o "]]
			.. output_fullfilename
			.. [["']],
		{ on_exit = callbacks.slideshow_render_finish }
	)

	print([[Creating slides ]] .. icon .. [[...]])
end

--- Create slides with beamer (in the foreground)
local function render_slides_sync()
	local file_path = vim.fn.expand("%:p")
	local output_path = vim.fn.expand("%:p:r") .. [[.pdf]]
	vim.cmd([[!pandoc --pdf-engine=xelatex "]] .. file_path .. [[" -t beamer -o "]] .. output_path .. [["]])
end

local opts = { buffer = 0 }

vim.keymap.set("n", "<leader>op", viewers.pdf.zathura, {
	unpack(opts),
	desc = "Open the compiled pdf markdown file in zathura",
})
vim.keymap.set("n", "<leader>oP", viewers.pdf.default, {
	unpack(opts),
	desc = "Open the compiled pdf markdown file in the default pdf viewer",
})
vim.keymap.set("n", "<leader>oh", viewers.html.default, {
	unpack(opts),
	desc = "Open the compiled html markdown file in the default html viewer",
})
vim.keymap.set("n", "<leader>rpp", render_pdf, {
	unpack(opts),
	desc = "Render markdown document into pdf",
})
vim.keymap.set("n", "<leader><leader>rpp", render_pdf_sync, {
	unpack(opts),
	desc = "Render markdown document into pdf (foreground)",
})
vim.keymap.set("n", "<leader>rps", render_slides, {
	unpack(opts),
	desc = "Render markdown document into pdf slides",
})
vim.keymap.set("n", "<leader><leader>rps", render_slides_sync, {
	unpack(opts),
	desc = "Render markdown document into pdf slides (foreground)",
})
vim.keymap.set("v", "<C-b>", "s****<Esc>hPw", {
	unpack(opts),
	noremap = true,
	desc = "Make the text under the cursor bold",
})
vim.keymap.set("v", "<C-i>", "s__<Esc>Pw", {
	unpack(opts),
	noremap = true,
	desc = "Make the text under the cursor italic",
})
vim.keymap.set("v", "<C-c>", "s``<Esc>Pw", {
	unpack(opts),
	noremap = true,
	desc = "Make the text under the cursor italic",
})

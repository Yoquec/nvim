-- termguicolors
vim.opt.termguicolors = true

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.laststatus = 0
vim.opt.showmode = false

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- undotree save change buffer
-- TODO: move to the hard-drive when ZFS works again
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir/"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

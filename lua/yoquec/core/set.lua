-- termguicolors
vim.opt.termguicolors = true

-- case insensitive search
vim.opt.ignorecase = true

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- set conceal level
vim.opt.conceallevel = 2

-- fold method
vim.opt.foldmethod = "indent"

-- hacky way of undolding buffer at open time
vim.opt.foldlevel = 99

-- Remove showmode
vim.opt.laststatus = 2
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
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- line moving
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "H", "<gv")
vim.keymap.set("v", "L", ">gv")

-- vertical movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copy without refilling the buffer
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>P", "\"+P")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "P", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- global keyboard mapping
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- word replace (no lsp)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move when windows split
vim.keymap.set('n', '<C-w>s', '<C-w>s<C-w>j')
vim.keymap.set('n', '<C-w>v', '<C-w>v<C-w>l')

-- tab navigation
vim.keymap.set('n', '<leader>mt', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>mw', vim.cmd.tabc)
vim.keymap.set('n', '<leader>mo', vim.cmd.tabl)
vim.keymap.set('n', '<leader>ml', vim.cmd.tabn)
vim.keymap.set('n', '<leader>mh', vim.cmd.tabp)

-- default nvim lsp formatting (if lspZero gets attached, LspZeroFormat will be used instead)
vim.keymap.set({ 'n', 'v' }, '<leader><leader>p', vim.lsp.buf.format)

-- Format nvim format
vim.keymap.set({ 'n', 'v' }, '<leader><leader>P', vim.cmd.Format)

-- Use alt + hjkl to resize windows
vim.keymap.set('n', '<A-C-j>', ':resize -2<CR>')
vim.keymap.set('n', '<A-C-k>', ':resize +2<CR>')
vim.keymap.set('n', '<A-C-h>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<A-C-l>', ':vertical resize +2<CR>')

-- neovim terminal can exit to normal mode with <esc> now
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- Open a terminal in a separate buffer
vim.keymap.set('n', '<leader>ot', ':execute "tabnew" | execute "terminal" <CR>')

-- change working directory to the current file's directory
vim.keymap.set('n', '<leader>cw', function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:h"))
    print("Changed working directory 🗺️!")
end)

-- clear diagnostics
vim.keymap.set('n', '<leader>cd', function()
    vim.diagnostics.reset()
end)

-- clear hightlight search
vim.keymap.set('n', '<BS>', vim.cmd.noh)

-- enter wiki
vim.keymap.set('n', '<leader>ww', function ()
    vim.cmd.e("$WIKI_HOME/index.md")
    vim.api.nvim_set_current_dir(vim.fn.expand("%:h"))
end)

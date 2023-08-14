vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<C-s>", vim.cmd.w)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "H", "<gv")
vim.keymap.set("v", "L", ">gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- better tabbing
vim.keymap.set("v", "<Tab>", ">")
vim.keymap.set("v", "<S-Tab>", "<")

-- copy without refilling the buffer
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>P", "\"+P")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "P", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- word replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move when windows split
vim.keymap.set('n', '<C-w>s', '<C-w>s<C-w>j')
vim.keymap.set('n', '<C-w>v', '<C-w>v<C-w>l')

-- Set the emacs alternative for moving through windows
vim.keymap.set('n', '<Leader>wl', '<cmd>wincmd l<CR>')
vim.keymap.set('n', '<Leader>wh', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<Leader>wj', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<Leader>wk', '<cmd>wincmd k<CR>')

-- tab navigation
vim.keymap.set('n', '<leader>mt', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>mw', vim.cmd.tabc)
vim.keymap.set('n', '<leader>mo', vim.cmd.tabl)
vim.keymap.set('n', '<leader>ml', vim.cmd.tabn)
vim.keymap.set('n', '<leader>mh', vim.cmd.tabp)
-- alternative tab navigation
vim.keymap.set('n', '<M-C-h>', vim.cmd.tabp)
vim.keymap.set('n', '<M-C-l>', vim.cmd.tabn)

-- default nvim lsp formatting (if lspZero gets attached,
-- LspZeroFormat will be used instead)
vim.keymap.set({ 'n', 'v' }, '<leader><leader>p', vim.lsp.buf.format)
-- "prettier" (additional formatting remaps)
vim.keymap.set({ 'n', 'v' }, '<leader><leader>P', vim.cmd.Format)

--  Add mapping for Goyo
vim.keymap.set('n', '<Leader>gy', vim.cmd.Goyo)

-- Use alt + hjkl to resize windows
vim.keymap.set('n', '<M-j>', ':resize -2<CR>')
vim.keymap.set('n', '<M-k>', ':resize +2<CR>')
vim.keymap.set('n', '<M-h>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<M-l>', ':vertical resize +2<CR>')

-- TAB in general mode will move to text buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>')
-- SHIFT-TAB will go back
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')

-- neovim terminal can exit to normal mode with <esc> now
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- Open a terminal in a separate buffer
vim.keymap.set('n', '<leader>ot', ':execute "tabnew" | execute "terminal" <CR>')

-- "integrate" vifm within vim
vim.keymap.set('n', '<leader><leader>vf',
    ':split | execute "wincmd j" | execute \'terminal vifm .\' | execute "normal i"<CR>',
    { silent = true })

-- "integrate" lf within vim
vim.keymap.set('n', '<leader><leader>lf',
    ':split | execute "wincmd j" | execute \'terminal lf .\' | execute "normal i"<CR>',
    { silent = true })

-- change working directory to the current file's directory
vim.keymap.set('n', '<leader>cw', function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:h"))
    print("Changed working directory 🗺️!")
end)

-- clean diagnostics
vim.keymap.set('n', '<leader>cd', function()
    vim.diagnostics.reset()
end)

-- clear hightlight search
vim.keymap.set('n', '<CR>', vim.cmd.noh)

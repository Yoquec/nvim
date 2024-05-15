-- leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

--- set working directory notifying the user
local function notify_setwd()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:h"))
    print("Changed working directory 🗺️!")
end

--- open wiki dashboard
local function enter_wiki()
    vim.cmd.e("$WIKI_HOME/index.md")
    vim.api.nvim_set_current_dir(vim.fn.expand("%:h"))
end

--- toggle the tab bar
local function toggle_tab_bar()
    local barstatus = vim.api.nvim_eval("&showtabline")

    if (barstatus < 2) then
        vim.opt.showtabline = 2
    else
        vim.opt.showtabline = 0
    end
end

--- sets keymaps in the same way Lazy.nvim does
--- @param keymaps table
--- @return nil
local function set_keymaps(keymaps)
    for _, map in ipairs(keymaps) do
        if map[4] == nil then
            vim.keymap.set(map[1], map[2], map[3])
        else
            vim.keymap.set(map[1], map[2], map[3], { desc = map[4] })
        end
    end
end

local keys = {
    -- move selected lines
    { "v",          "J",           ":m '>+1<CR>gv=gv" },
    { "v",          "K",           ":m '<-2<CR>gv=gv" },
    { "v",          "H",           "<gv" },
    { "v",          "L",           ">gv" },

    { "n",          "<C-d>",       "<C-d>zz" },
    { "n",          "<C-u>",       "<C-u>zz" },

    -- copy to additional registers
    { "v",          "<leader>p",   "\"+p" },
    { "n",          "<leader>p",   "\"+p" },
    { "v",          "<leader>P",   "\"+P" },
    { "n",          "<leader>P",   "\"+P" },
    { "v",          "P",           "\"_dP" },
    { { "n", "v" }, "<leader>d",   [["_d]] },

    -- global keyboard mapping
    { { "n", "v" }, "<leader>y",   [["+y]] },
    { "n",          "<leader>Y",   [["+Y]] },

    -- word replace (no lsp)
    { "n",          "<leader>s",   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },

    -- Move when windows split
    { 'n',          '<C-w>s',      '<C-w>s<C-w>j' },
    { 'n',          '<C-w>v',      '<C-w>v<C-w>l' },

    -- tab navigation
    { 'n',          '<leader>vot', vim.cmd.tabnew,                                        "Open a tab" },
    { 'n',          '<leader>mn',  vim.cmd.tabn },
    { 'n',          '<leader>mp',  vim.cmd.tabp },

    -- window resizing
    { 'n',          '<A-C-j>',     ':resize -2<CR>' },
    { 'n',          '<A-C-k>',     ':resize +2<CR>' },
    { 'n',          '<A-C-h>',     ':vertical resize -2<CR>' },
    { 'n',          '<A-C-l>',     ':vertical resize +2<CR>' },

    { 'n',          '<leader>ot',  ':execute "tabnew" | execute "terminal" <CR>',         "Open a terminal in a separate tab" },
    { 'n',          '<leader>vcd', notify_setwd,                                          "Change working directory" },
    { 'n',          '<leader>vrd', vim.diagnostic.reset,                                  "Clear diagnostics" },
    { 'n',          '<BS>',        vim.cmd.noh,                                           "Clear highlight search" },
    { 'n',          '<leader>ww',  enter_wiki,                                            "Enter vim wiki" },
    { "n",          "<leader>vtt", toggle_tab_bar,                                        "Toggles the tab bar" },

    { 't',          '<esc>',       '<c-\\><c-n>',                                         "Exit normal mode form the terminal" },
}

set_keymaps(keys)

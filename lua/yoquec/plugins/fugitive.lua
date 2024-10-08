return {
    "tpope/vim-fugitive",
    keys = {
        { '<leader>gg',   vim.cmd.Git,                          desc = "Open fugitive menu" },
        { '<leader>gll',  [[<cmd>Git log<CR>]],                 desc = "Open git log" },
        { '<leader>glo',  [[<cmd>Git log --oneline<CR>]],       desc = "Open git log oneline" },
        { '<leader>glao', [[<cmd>Git log --all --oneline<CR>]], desc = "Open git log oneline (all branches)" },
        { '<leader>glg',  [[<cmd>Git log --graph<CR>]],         desc = "Open git log graph" },
        { '<leader>glg',  [[<cmd>Git log --all --graph<CR>]],   desc = "Open git log graph (all brances)" },
        { '<leader>gbb',  [[<cmd>Git blame<CR>]],               desc = "Open git blame of the file to the side" },
    }
}

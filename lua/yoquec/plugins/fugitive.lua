return {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
        { '<leader>hg',   vim.cmd.Git,                          desc = "Open fugitive menu" },
        { '<leader>hll',  [[<cmd>Git log<CR>]],                 desc = "Open git log" },
        { '<leader>hlo',  [[<cmd>Git log --oneline<CR>]],       desc = "Open git log oneline" },
        { '<leader>hlao', [[<cmd>Git log --all --oneline<CR>]], desc = "Open git log oneline (all branches)" },
        { '<leader>hlg',  [[<cmd>Git log --graph<CR>]],         desc = "Open git log graph" },
        { '<leader>hlg',  [[<cmd>Git log --all --graph<CR>]],   desc = "Open git log graph (all brances)" },
    }
}

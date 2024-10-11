return {
    "tpope/vim-fugitive",
    keys = {
        { '<leader>gg',   vim.cmd.Git,                          desc = "Fugitive menu" },
        { '<leader>gll',  [[<cmd>Git log<CR>]],                 desc = "Fugitive git log" },
        { '<leader>glo',  [[<cmd>Git log --oneline<CR>]],       desc = "Fugitive git log oneline" },
        { '<leader>glao', [[<cmd>Git log --all --oneline<CR>]], desc = "Fugitive git log oneline (all branches)" },
        { '<leader>gcc',  [[<cmd>G commit<CR>]],                desc = "Fugitive git commit" },
        { '<leader>gca',  [[<cmd>G commit --amend<CR>]],        desc = "Fugitive git commit ammend last commit" },
        { '<leader>glg',  [[<cmd>Git log --graph<CR>]],         desc = "Fugitive git log graph" },
        { '<leader>glg',  [[<cmd>Git log --all --graph<CR>]],   desc = "Fugitive git log graph (all brances)" },
        { '<leader>gbb',  [[<cmd>Git blame<CR>]],               desc = "Fugitive git blame of the file to the side" },
        { '<leader>grh',  [[<cmd>Git reset --hard HEAD<CR>]],   desc = "Fugitive git hard reset" },
        { '<leader>grs',  [[<cmd>Git reset --soft HEAD<CR>]],   desc = "Fugitive git soft reset" },
        { '<leader>grm',  [[<cmd>Git reset --mixed HEAD<CR>]],  desc = "Fugitive git mixed reset" },
        { '<leader>grus', [[<cmd>Git checkout -- .<CR>]],       desc = "Fugitive git reset unstaged files" },
        { '<leader>grut', [[<cmd>Git clean -fd<CR>]],           desc = "Fugitive git reset untracked files" },
        {
            '<leader>grn',
            function()
                vim.cmd([[Git reset --hard HEAD]])
                vim.cmd([[Git clean -fd]])
            end,
            desc = "Fugitive git nuke working tree"
        },
        {
            '<leader>grS',
            function()
                -- Stash staged files and drop the stash to just retain
                -- unstaged changes
                vim.cmd([[Git stash push --staged "tmp"]])
                vim.cmd([[Git stash drop]])
            end,
            desc = "Fugitive git reset staged files"
        }
    }
}

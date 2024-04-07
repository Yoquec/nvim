return {
    "folke/zen-mode.nvim",
    ft = { "markdown", "rmd", "tex" },
    keys = {
        { "<leader>gy", function()
            require("zen-mode").toggle({
                window = {
                    width = 90,
                    height = 0.95,
                    options = {
                        signcolumn = "no",      -- disable signcolumn
                        number = false,         -- disable number column
                        relativenumber = false, -- disable relative numbers
                    },
                },
                on_open = function(_)
                    vim.opt.wrap = true
                end,
                on_close = function()
                    vim.opt.wrap = false
                end,
            })
        end }
    },
}

return {
    "folke/zen-mode.nvim",
    ft = { "markdown", "rmd", "tex" },
    keys = {
        { "<leader>z", function()
            require("zen-mode").toggle({
                window = {
                    width = function()
                        local width = vim.fn.winwidth("%")

                        if width < 140 then
                            return 80
                        elseif width < 120 then
                            return 0.85
                        else
                            return 100
                        end
                    end,
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
        end,
            "Toggles zen mode"
        }
    },
}

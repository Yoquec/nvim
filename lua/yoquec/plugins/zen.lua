return {
    "folke/zen-mode.nvim",
    keys = {
        { "<leader>zz", function()
            local default_conceallevel = vim.opt.conceallevel
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
                    vim.opt.nu = false
                    vim.opt.conceallevel = 0
                end,
                on_close = function()
                    vim.opt.wrap = false
                    vim.opt.nu = true
                    vim.opt.relativenumber = true
                    vim.opt.conceallevel = default_conceallevel
                end,
            })
        end,
            "Toggles zen mode"
        }
    },
}

return {
    'ThePrimeagen/harpoon',
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon.mark").add_file()
                print("👉 File added to harpoon")
            end,
            desc = "Add file to harpoon"
        },
        {
            "<leader>fm",
            [[<cmd>require("harpoon.ui").toggle_quick_menu()<cr>]],
            desc = "Open harpoon menu"
        },
        {
            "<c-h>",
            [[<cmd>lua require("harpoon.ui").nav_file(1)<cr>]],
            desc = "Navigate to harpoon file 1",
        },
        {
            "<c-j>",
            [[<cmd>lua require("harpoon.ui").nav_file(2)<cr>]],
            desc = "Navigate to harpoon file 2",
        },
        {
            "<c-k>",
            [[<cmd>lua require("harpoon.ui").nav_file(3)<cr>]],
            desc = "Navigate to harpoon file 3"
        },
        {
            "<c-l>",
            [[<cmd>lua require("harpoon.ui").nav_file(4)<cr>]],
            desc = "Navigate to harpoon file 4",
        }
    },
}

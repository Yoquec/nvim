return {
    'ThePrimeagen/harpoon',
    lazy = false,
    branch = "harpoon2",
    config = function ()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():append()
            print("👉 File added to harpoon")
        end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>fm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end
}

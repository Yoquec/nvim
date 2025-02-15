return {
	"ThePrimeagen/harpoon",
	lazy = false,
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
			print("File added to harpoon")
		end, { desc = "Add current file to Harpoon menu" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, {
			desc = "Harpoon navigate to file 1",
		})
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, {
			desc = "Harpoon navigate to file 2",
		})
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, {
			desc = "Harpoon navigate to file 3",
		})
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, {
			desc = "Harpoon navigate to file 4",
		})
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, {
			desc = "Harpoon navigate to file 5",
		})
		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, {
			desc = "Harpoon navigate to file 6",
		})
		vim.keymap.set("n", "<leader>7", function()
			harpoon:list():select(7)
		end, {
			desc = "Harpoon navigate to file 7",
		})
		vim.keymap.set("n", "<leader>8", function()
			harpoon:list():select(8)
		end, {
			desc = "Harpoon navigate to file 8",
		})
		vim.keymap.set("n", "<leader>9", function()
			harpoon:list():select(9)
		end, {
			desc = "Harpoon navigate to file 9",
		})
		vim.keymap.set("n", "<leader>0", function()
			harpoon:list():select(10)
		end, {
			desc = "Harpoon navigate to file 10",
		})

		vim.keymap.set("n", "<leader>fm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon menu" })
	end,
}

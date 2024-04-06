return {
    'mfussenegger/nvim-dap',
    ft = {"go"},
    dependencies = {
        "leoluz/nvim-dap-go"
    },
    config = function()
        local dap = require("dap")
        local dap_ui = require("dap.ui.widgets")

        vim.keymap.set("n", "<leader>dc", dap.continue)
        vim.keymap.set("n", "<leader>dq", dap.close)
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>do", dap.step_over)
        vim.keymap.set("n", "<leader>di", dap.step_into)
        vim.keymap.set("n", "<leader>dr", dap.repl.open)
        vim.keymap.set("n", "<leader>dh", dap_ui.hover)
        vim.keymap.set("n", "<leader>dp", dap_ui.preview)

        -- Golang debug adapter
        require("dap-go").setup()
    end
}

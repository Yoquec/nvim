return {
    'mfussenegger/nvim-dap',
    ft = { "go", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    dependencies = { "leoluz/nvim-dap-go" },
    config = function()
        local dap = require("dap")
        local dap_ui = require("dap.ui.widgets")

        -- Keymaps
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

        -- Javascript node debug adapter
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                -- Download from https://github.com/microsoft/vscode-js-debug/releases
                args = { os.getenv("HOME") .. "/.local/share/js-debug/src/dapDebugServer.js", "${port}" },
            }
        }

        for _, language in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
            require("dap").configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require 'dap.utils'.pick_process,
                    cwd = "${workspaceFolder}",
                }
            }
        end
    end
}

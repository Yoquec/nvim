return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<C-y>",
                next = "<C-M-n>",
                prev = "<C-M-p>",
                dismiss = "<C-i>",
            },
        },
        filetypes = {
            python = true,
            cs = true,
            rust = true,
            go = true,
            typescript = true,
            javascript = true,
            ["*"] = false,
        },
    }
}

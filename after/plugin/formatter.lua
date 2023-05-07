require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },
        html = {
            require("formatter.filetypes.html").prettier
        },
        css = {
            require("formatter.filetypes.css").prettier
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier
        },
        rmd = {
            require("formatter.filetypes.markdown").prettier
        },
        python = {
            require("formatter.filetypes.python").black
        },
        sh = {
            require("formatter.filetypes.sh").shfmt
        },
        kotlin = {
            function()
                return {
                    exe = "ktlint",
                    args = {
                        "-l none",
                        "-F",
                        "--stdin"
                    },
                    stdin = true
                }
            end
        },
    }
}

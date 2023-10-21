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
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier
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
        rust = {
            require("formatter.filetypes.rust").rustfmt
        },
        rmd = {
            require("formatter.filetypes.markdown").prettier
        },
        Rmd = {
            require("formatter.filetypes.markdown").prettier
        },
        python = {
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.python").isort
        },
        sql = {
            require("formatter.filetypes.sql").pgformat
        },
        sh = {
            require("formatter.filetypes.sh").shfmt
        },
    }
}

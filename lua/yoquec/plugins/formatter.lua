return {
    'mhartington/formatter.nvim',
    event = "VeryLazy",
    config = function()
        require("formatter").setup {
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
                htmldjango = {
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
                go = {
                    require("formatter.filetypes.go").gofumpt,
                    require("formatter.filetypes.go").goimports,
                    require("formatter.filetypes.go").golines
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
    end
}

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
      markdown = {
          require("formatter.filetypes.markdown").prettier
      },
      rmd = {
          require("formatter.filetypes.markdown").prettier
      },
      python = {
          require("formatter.filetypes.python").yapf
      },
    }
  }

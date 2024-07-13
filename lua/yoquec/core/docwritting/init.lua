vim.api.nvim_create_augroup("docwritting", {})

require("yoquec.core.docwritting.markdown")
require("yoquec.core.docwritting.rmarkdown")

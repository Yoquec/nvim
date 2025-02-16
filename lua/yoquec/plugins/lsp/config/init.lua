local empty_config = {}

local servers = {
	html = { filetypes = { "html", "htmldjango" } },
	emmet_language_server = require("yoquec.plugins.lsp.config.emmet_language_server"),
}

return {
	empty = empty_config,
	servers = servers,
}

return {
	cmd = { "smithy-language-server" },
	filetypes = { "smithy" },
    root_markers = { '.smithy-project.json', 'smithy-build.json', 'build.gradle', 'build.gradle.kts', '.git' },
	message_level = vim.lsp.protocol.MessageType.Log,
	init_options = {
		statusBarProvider = "show-message",
		isHttpEnabled = true,
		compilerOptions = {
			snippetAutoIndent = false,
		},
	},
}

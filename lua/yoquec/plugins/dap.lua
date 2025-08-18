return {
	"mfussenegger/nvim-dap",
	dependencies = { "leoluz/nvim-dap-go" },
	config = function()
		require("dap-go").setup()
	end,
	keys = {
		{ "<leader>Dn", vim.cmd.DapNew, desc = "Debug adapter: new" },
		{ "<leader>Dc", vim.cmd.DapContinue, desc = "Debug adapter: continue" },
		{ "<leader>Db", vim.cmd.DapToggleBreakpoint, desc = "Debug adapter: toggle breakpoint" },
		{ "<leader>Di", vim.cmd.DapStepInto, desc = "Debug adapter: step into" },
		{ "<leader>Do", vim.cmd.DapStepOver, desc = "Debug adapter: step over" },
		{ "<leader>DO", vim.cmd.DapStepOut, desc = "Debug adapter: step out" },
		{ "<leader>DC", vim.cmd.DapClearBreakpoints, desc = "Debug adapter: clear breakpoints" },
		{ "<leader>Dr", vim.cmd.DapToggleRepl, desc = "Debug adapter: REPL" },
		{ "<leader>Dq", vim.cmd.DapTerminate, desc = "Debug adapter: terminate" },
	},
}

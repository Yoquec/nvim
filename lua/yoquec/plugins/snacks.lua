return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        notifier = {},
        input = {},
        explorer = {},
        picker = {
            sources = {
                spelling = { layout = { preset = "select", preview = false } },
                explorer = {
                    auto_close = true,
                    layout = { preset = "ivy", preview = "file" },
                    win = { list = { keys = { ["%"] = "explorer_add" } } },
                },
            },
        },
    },
    keys = {
        -- stylua: ignore start
        { "<leader>.",    function() Snacks.scratch() end,                      desc = "Toggle Scratch Buffer" },
        { "<leader>S",    function() Snacks.scratch.select() end,               desc = "Select Scratch Buffer" },

        { "<leader>ff",   function() Snacks.picker.files() end,                 desc = "Find Files" },
        { "<leader>fo",   function() Snacks.picker.recent() end,                desc = "Find Old files" },
        { "<leader>fb",   function() Snacks.picker.buffers() end,               desc = "Find open Buffers" },
        { "<leader>fp",   function() Snacks.picker.grep() end,                  desc = "Find grep Pattern" },
        { "<leader>fP",   function() Snacks.picker.grep_buffers() end,          desc = "Find grep Pattern in currently open buffers" },
        { "<leader>fq",   function() Snacks.picker.qflist() end,                desc = "Find elements in the Quickfix list" },
        { "<leader>ft",   function() Snacks.picker.todo_comments() end,         desc = "Find Todo comments" },
        { "<leader>fS",   function() Snacks.picker.search_history() end,        desc = "Find Search history" },
        { "<leader>fk",   function() Snacks.picker.keymaps() end,               desc = "Find Keymaps" },
        { "<leader>fh",   function() Snacks.picker.help() end,                  desc = "Find Help tags" },
        { "<leader>f.",   function() Snacks.picker.pickers() end,               desc = "Find pickers" },
        { "<leader>fc",   function() Snacks.picker.commands() end,              desc = "Find Commands" },
        { "<leader>fC",   function() Snacks.picker.command_history() end,       desc = "Find Command history" },
        { "<leader>fM",   function() Snacks.picker.marks() end,                 desc = "Find Marks" },
        { "<leader>fs",   function() Snacks.picker.spelling() end,              desc = "Find Spelling suggestions" },
        { "<leader>fv",   function() Snacks.picker.explorer() end,              desc = "Find files in explorer" },

        { "<leader>fgf",  function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
        { "<leader>fgc",  function() Snacks.picker.git_commits() end,           desc = "Find Git Commits" },
        { "<leader>fgb",  function() Snacks.picker.git_branches() end,          desc = "Find Git Commits" },
        { "<leader>fglf", function() Snacks.picker.git_log_file() end,          desc = "Find Git Log for current File" },
        { "<leader>fgll", function() Snacks.picker.git_log_line() end,          desc = "Find Git Log for current Line" },
        { "<leader>fgL",  function() Snacks.picker.git_log() end,               desc = "Find Git Log" },

        { "<leader>fd",   function() Snacks.picker.diagnostics_buffer() end,    desc = "Find buffer Diagnostics" },
        { "<leader>fD",   function() Snacks.picker.diagnostics() end,           desc = "Find Diagnostics" },
        { "<leader>flI",  function() Snacks.picker.lsp_implementations() end,   desc = "Find LSP Implementations" },
        { "<leader>fld",  function() Snacks.picker.lsp_definitions() end,       desc = "Find LSP Definitions" },
        { "<leader>flr",  function() Snacks.picker.lsp_references() end,        desc = "Find LSP References" },
        { "<leader>flt",  function() Snacks.picker.lsp_type_definitions() end,  desc = "Find LSP Type definitions" },
        { "<leader>fls",  function() Snacks.picker.lsp_symbols() end,           desc = "Find LSP document Symbols" },
        { "<leader>flS",  function() Snacks.picker.lsp_workspace_symbols() end, desc = "Find LSP workspace Symbols" },

        { "<leader>fgf",  function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
        -- stylua: ignore end
    },
}

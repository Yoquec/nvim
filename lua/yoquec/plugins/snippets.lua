return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}

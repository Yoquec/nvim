return {
    'MeanderingProgrammer/markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { "markdown", "rmarkdown" },
    config = function()
        require('render-markdown').setup({
            heading = {
                icons = {
                    "󰪥 ",
                    " 󰄰 ",
                    "   ",
                    "   󰴈 ",
                    "    󰪥 ",
                    "     󰄰 ",
                },
                backgrounds = {
                    "@headlines.heading.1",
                    "@headlines.heading.2",
                    "@headlines.heading.3",
                    "@headlines.heading.4",
                    "@headlines.heading.5",
                    "@headlines.heading.6"
                },
            },
            bullet = {
                icons = { "", "" },
                highlight = "GruvboxOrangeBold"
            }
        })
    end
}

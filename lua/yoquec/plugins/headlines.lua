return {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown", "rmd" },
    opts = {
        markdown = {
            headline_highlights = {
                "@headlines.heading.1",
                "@headlines.heading.2",
                "@headlines.heading.3",
                "@headlines.heading.4",
                "@headlines.heading.5",
                "@headlines.heading.6",
            },
            bullet_highlights = {
                "@markup.heading.1.marker.markdown",
                "@markup.heading.2.marker.markdown",
                "@markup.heading.3.marker.markdown",
                "@markup.heading.4.marker.markdown",
                "@markup.heading.5.marker.markdown",
                "@markup.heading.6.marker.markdown",
            }
        },

        rmd = {
            headline_highlights = {
                "@headlines.heading.1",
                "@headlines.heading.2",
                "@headlines.heading.3",
                "@headlines.heading.4",
                "@headlines.heading.5",
                "@headlines.heading.6",
            },
            bullet_highlights = {
                "@markup.heading.1.marker.markdown",
                "@markup.heading.2.marker.markdown",
                "@markup.heading.3.marker.markdown",
                "@markup.heading.4.marker.markdown",
                "@markup.heading.5.marker.markdown",
                "@markup.heading.6.marker.markdown",
            }
        }
    },
}

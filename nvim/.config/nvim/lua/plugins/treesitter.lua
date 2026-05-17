return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        main = "nvim-treesitter",
        opts = {
            ensureInstalled = {
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "diff",
                "markdown",
                "markdown_inline",
                "html",
                "yaml",
                "json",
                "gdscript",
                "java",
                "javascript",
                "typescript",
                "godot_resource",
                "gdshader",
            },
            autoInstall = true,
            indent = { 
                enable = true, 
            },
        },
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
        end,
    },
}

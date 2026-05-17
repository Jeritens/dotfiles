return {
    {
        "dpowling/godot-lsp.nvim",
        ft = "gdscript",
        opts = {
            -- your configuration here (optional)
        },
    },
    {
        -- todo mini picker
        "CultOfTheBlob/godot-scenetree.nvim",
        contig = function()
            require("godot-scenetree").setup({
                -- this is where your config will go, see Configuration
            })
        end,
    }
}

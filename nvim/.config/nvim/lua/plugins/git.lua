return {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
        require("diffview").setup({
            enhanced_diff_hl = true,
            use_icons = true,
            view = {
                default = {
                    layout = "diff2_horizontal",
                },
            },
        })
    end
}

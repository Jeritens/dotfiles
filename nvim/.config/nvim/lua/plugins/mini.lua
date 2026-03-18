return {
    -- text editing
    { "nvim-mini/mini.surround", version = false, opts = {} },
    { 'nvim-mini/mini.ai',       version = false, opts = {} },
    { 'nvim-mini/mini.align',    version = false, opts = {} },
    -- { "nvim-mini/mini.pairs", version = false, opts = {} },
    -- workflow
    {
        "nvim-mini/mini.jump",
        version = false,
        opts = {
            silent = true,
        },
    },
    {
        "nvim-mini/mini.files",
        version = false,
        opts = {
            options = { permanent_delete = true, use_as_default_explorer = true },
        },
        keys = {
            {
                "<leader>E",
                function()
                    require("mini.files").open()
                end,
                desc = "File Explorer",
            },
            {
                "<leader>e",
                function()
                    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                    MiniFiles.reveal_cwd()
                end,
                desc = "File Explorer CWD",
            },
        },
    },
    -- appearance
    { "nvim-mini/mini.icons", version = false, opts = {} },
    {
        "nvim-mini/mini.hipatterns",
        version = false,
        opts = function()
            local hi = require("mini.hipatterns")
            return {
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hi.gen_highlighter.hex_color(),
                },
            }
        end,
    },
}

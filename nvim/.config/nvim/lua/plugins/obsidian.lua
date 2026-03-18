return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    --  ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        -- refer to `:h file-pattern` for more examples
        "BufReadPre "
        .. vim.fn.expand("~")
        .. "/obsidian-vault/*.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/obsidian-vault/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>oc",
            "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
            desc = "Obsidian Check Checkbox",
        },
        { "<leader>oi", "<cmd>Obsidian template<CR>",     desc = "Insert Obsidian Template" },
        { "<leader>ot", "<cmd>Obsidian today<CR>",        desc = "Obsidian Today" },
        { "<leader>oy", "<cmd>Obsidian yesterday<CR>",    desc = "Obsidian Yesterday" },
        { "<leader>om", "<cmd>Obsidian tomorrow<CR>",     desc = "Obsidian Tomorrow" },
        { "<leader>ob", "<cmd>Obsidian backlinks<CR>",    desc = "Show ObsidianBacklinks" },
        { "<leader>on", "<cmd>Obsidian new<CR>",          desc = "Create New Note" },
        { "<leader>os", "<cmd>Obsidian search<CR>",       desc = "Search Obsidian" },
        { "<leader>oo", "<cmd>Obsidian quick_switch<CR>", desc = "Quick Switch" },
        { "<leader>od", "<cmd>Obsidian dailies<CR>",      desc = "Quick Dailies" },
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        workspaces = {
            {
                name = "obsidian-vault",
                path = "~/obsidian-vault/",
            },
        },
        fontmatter = {
            enable = false,
        },
        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
            -- Enables completion using nvim_cmp
            nvim_cmp = false,
            -- Enables completion using blink.cmp
            blink = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
            -- Set to false to disable new note creation in the picker
            create_new = true,
        },
        notes_subdir = "notes",
        new_notes_location = "notes_subdir",
        daily_notes = {
            folder = "daily-notes",
            date_format = "%Y-%m-%d",
            template = "daily-notes-nvim.md",
        },
        templates = {
            folder = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
        },
        picker = {
            -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
            name = "snacks.pick",
            -- Optional, configure key mappings for the picker. These are the defaults.
            -- Not all pickers support all mappings.
            note_mappings = {
                -- Create a new note from your query.
                new = "<C-x>",
                -- Insert a link to the selected note.
                insert_link = "<C-l>",
            },
            tag_mappings = {
                -- Add tag(s) to current note.
                tag_note = "<C-x>",
                -- Insert a tag at the current location.
                insert_tag = "<C-l>",
            },
        },
        legacy_commands = false,
        ui = {
            enable = false,
            ignore_conceal_warn = true,
        },
        note_id_func = function(title)
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            end
            return "new-note" .. "-" .. tostring(os.time())
        end,
        checkbox = {
            order = { " ", "x", "-", "!", "?" },
        },
        footer = {
            enabled = false,
        },
    },
}

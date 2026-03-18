return {
    {
	"OXY2DEV/markview.nvim",
    enabled = false,
	lazy = false,

	-- For `nvim-treesitter` users.
	priority = 49,

	-- For blink.cmp's completion
	-- source
	dependencies = {
		"saghen/blink.cmp",
	},
	opts = {
		checkboxes = {
			enable = true,

			checked = { text = "󰄵", hl = "MarkviewCheckboxChecked", scope_hl = "MarkviewCheckboxChecked" },
			unchecked = { text = "󰄱", hl = "MarkviewCheckboxUnchecked", scope_hl = "MarkviewCheckboxUnchecked" },

			["/"] = { text = "󰿠", hl = "MarkviewCheckboxPending" },
			[">"] = { text = "", hl = "MarkviewCheckboxCancelled" },
			["<"] = { text = "󰃖", hl = "MarkviewCheckboxCancelled" },
			["-"] = { text = "󰛲", hl = "MarkviewCheckboxCancelled", scope_hl = "MarkviewCheckboxStriked" },

			["?"] = { text = "󰮦", hl = "MarkviewCheckboxPending" },
			["!"] = { text = "󰳤", hl = "MarkviewCheckboxUnchecked" },
			["*"] = { text = "󰓎", hl = "MarkviewCheckboxPending" },
			['"'] = { text = "󰸤", hl = "MarkviewCheckboxCancelled" },
			["l"] = { text = "󰆋", hl = "MarkviewCheckboxProgress" },
			["b"] = { text = "󰃀", hl = "MarkviewCheckboxProgress" },
			["i"] = { text = "", hl = "MarkviewCheckboxChecked" },
			["S"] = { text = "", hl = "MarkviewCheckboxChecked" },
			["I"] = { text = "󰛨", hl = "MarkviewCheckboxPending" },
			["p"] = { text = "", hl = "MarkviewCheckboxChecked" },
			["c"] = { text = "", hl = "MarkviewCheckboxUnchecked" },
			["f"] = { text = "󱠇", hl = "MarkviewCheckboxUnchecked" },
			["k"] = { text = "", hl = "MarkviewCheckboxPending" },
			["w"] = { text = "", hl = "MarkviewCheckboxProgress" },
			["u"] = { text = "󰔵", hl = "MarkviewCheckboxChecked" },
			["d"] = { text = "󰔳", hl = "MarkviewCheckboxUnchecked" },
		},
	},
	keys = {
		{ "<leader>tm", "<Cmd>Markview toggle<CR>", desc = "Toggle Markdown Viewer" },
	},
   },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        enabled = true,
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
}

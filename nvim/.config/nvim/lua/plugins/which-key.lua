return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		-- preset = "modern",
		keys = {
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
		spec = {
			{ "<leader>f", group = "File" },
			{ "<leader>o", group = "Obsidian" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Toggle" },
			{ "<leader>u", group = "UI" },
			{ "s", group = "Surround" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

return {
	"akinsho/bufferline.nvim",
	version = "*",
	-- event = "VeryLazy",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		-- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		-- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		-- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		-- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		-- { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		-- { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		-- { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
		-- { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
	},
	opts = {
		options = { separator_style = "slope" },
	},
}

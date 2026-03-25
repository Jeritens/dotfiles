return {
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		opts = {
			background = "hard",
			transparent_background_level = 0,
			italics = true,
			disable_italic_comment = false,
            ui_contrast = "high",
		},
		config = function(_, opts)
			require("everforest").setup(opts)
		end,
	},
    {
      "serhez/teide.nvim",
      lazy = false,
      priority = 1000,
      opts = {
          style= "darker",
      },

    },
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
	},
    {
        dir = vim.fn.stdpath("config"),
        lazy = false,
		priority = 1000,
        config = function()
            vim.cmd.colorscheme("everforest")
            -- vim.cmd.colorscheme("teide")
            -- vim.cmd.colorscheme("default")
        end
    },
}

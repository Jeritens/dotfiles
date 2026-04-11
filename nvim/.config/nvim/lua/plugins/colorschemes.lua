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
            -- custom markdown colors & highlights
            on_highlights = function(hl, palette)
                -- hl.RenderMarkdownH1Bg = { bg = palette.bg_visual }
                -- hl.RenderMarkdownH2Bg = { bg = palette.bg_red }
                -- hl.RenderMarkdownH3Bg = { bg = palette.bg_yellow }
                -- hl.RenderMarkdownH4Bg = { bg = palette.bg_green }
                -- hl.RenderMarkdownH5Bg = { bg = palette.bg_blue }
                -- hl.RenderMarkdownH6Bg = { bg = palette.bg_purple }

                hl.RenderMarkdownH1Bg = { bg = palette.bg_green }
                hl.RenderMarkdownH2Bg = { bg = palette.bg_yellow }
                hl.RenderMarkdownH3Bg = { bg = palette.bg_red }
                hl.RenderMarkdownH4Bg = { bg = palette.bg_visual }
                hl.RenderMarkdownH5Bg = { bg = palette.bg_purple }
                hl.RenderMarkdownH6Bg = { bg = palette.bg_blue }

                hl.RenderMarkdownH1 = { fg = palette.green }
                hl.RenderMarkdownH2 = { fg = palette.yellow }
                hl.RenderMarkdownH3 = { fg = palette.orange }
                hl.RenderMarkdownH4 = { fg = palette.red }
                hl.RenderMarkdownH5 = { fg = palette.purple }
                hl.RenderMarkdownH6 = { fg = palette.blue }

                hl.markdownH1 = { fg = palette.green }
                hl.markdownH2 = { fg = palette.yellow }
                hl.markdownH3 = { fg = palette.orange }
                hl.markdownH4 = { fg = palette.red }
                hl.markdownH5 = { fg = palette.purple }
                hl.markdownH6 = { fg = palette.blue }
             end,
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

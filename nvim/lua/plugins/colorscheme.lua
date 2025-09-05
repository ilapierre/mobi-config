return {
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function(_, opts)
	-- 		vim.g.moonflyTransparent = true
	-- 		vim.cmd([[colorscheme moonfly]])
	-- 		-- vim.cmd([[colorscheme habamax]])
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	opts = {
	-- 		options = {
	-- 			-- transparent = true,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("nightfox").setup(opts)
	-- 		vim.cmd([[colorscheme carbonfox]])
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			-- transparent_background = true,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	--  {
	--    "catppuccin/nvim",
	--    name = "catppuccin",
	--    priority = 1000,
	--    opts = {
	--       flavour = "mocha",
	--       custom_highlights = function(colors)
	--          return {
	--             WinSeparator = { fg = colors.surface0 },
	--          }
	--       end,
	--       color_overrides = {
	--          mocha = {
	--             base = "#11111b",
	--             mantle = "#11111b",
	--          },
	--       },
	--       integrations = {
	--          notify = true,
	--          cmp = true,
	--          gitsigns = true,
	--          nvimtree = true,
	--          treesitter = true,
	--          mini = {
	--            enabled = true,
	--            indentscope_color = "",
	--          },
	--       },
	--    },
	--    init = function()
	--       vim.cmd.colorscheme("catppuccin")
	--    end,
	--  },
	{
		-- transparency for every colorscheme
		"tribela/transparent.nvim",
		event = "VimEnter",
		config = true,
	},
}

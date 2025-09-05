-- mini standalone plugins

return {
	{
		"echasnovski/mini.pairs",
		version = "*",
		opts = {},
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		"echasnovski/mini.animate",
		version = "*",
		opts = {},
		config = function(_, opts)
			require("mini.animate").setup(opts)
		end,
	},
	{
		"echasnovski/mini.completion",
		version = "*",
		opts = {},
		config = function(_, opts)
			require("mini.completion").setup(opts)
		end,
	},
	-- {
	-- 	"echasnovski/mini.notify",
	-- 	version = "*",
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require("mini.notify").setup(opts)
	-- 	end,
	-- },
}

return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		opts = {
			columns = {
				"icon",
				-- "size",
				"mtime",
			},
			delete_to_trash = true,
		},
		config = true,
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open Oil" },
			{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Open Oil (floating)" },
		},
	},
	{ "malewicz1337/oil-git.nvim", dependencies = { "stevearc/oil.nvim" } },
}

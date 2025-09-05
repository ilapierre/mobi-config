return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
			preview = {
				float = true,
			},
			win_options = {
				signcolumn = "yes:2",
			},
		},
		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)

			vim.keymap.set("n", "<leader>e", oil.toggle_float)
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "moonfly",
		},
		sections = {
			lualine_y = {
				{
					"lsp_status",
					icon = "", -- f013
					symbols = {
						-- Standard unicode symbols to cycle through for LSP progress:
						spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
						-- Standard unicode symbol for when LSP is done:
						done = "✓",
						-- Delimiter inserted between LSP names:
						separator = " ",
					},
					-- List of LSP names to ignore (e.g., `null-ls`):
					ignore_lsp = {},
				},
			},
			lualine_z = {
				{ "progress" },
				{ "location" },
			},
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}

-- If I ever get the time...
-- return {
-- 	"rebelot/heirline.nvim",
-- 	config = function()
-- 		require("heirline").setup({})
-- 	end
-- }

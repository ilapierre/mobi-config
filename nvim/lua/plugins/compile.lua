return {
	"ej-shafran/compile-mode.nvim",
	version = "^5.0.0",
	branch = "latest",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			input_word_completion = true,
			default_command = "",
      focus_compilation_buffer = true,
		}
	end,
	keys = {
		{ "<leader>c", "<cmd>below Compile<cr>", desc = "Compile" },
		{ "<leader>C", "<cmd>below Recompile<cr>", desc = "Recompile" },
	},
}

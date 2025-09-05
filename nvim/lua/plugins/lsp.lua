return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")

			-- Java setup
			lspconfig.jdtls.setup({
				-- cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
				-- settings = {
				-- 	java = {
				-- 		configuration = {
				-- 			runtimes = {
				-- 				{
				-- 					name = "JavaSE-17",
				-- 					path = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home",
				-- 				},
				-- 			},
				-- 		},
				-- 	},
				-- },
			})

			-- Automatic setup
			-- require("mason-lspconfig").setup_handlers({
			-- 	function(server_name)
			-- 		lspconfig[server_name].setup({})
			-- 	end,
			-- })
		end,
	},
}

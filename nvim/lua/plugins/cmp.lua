return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
			   ["<C-Space>"] = cmp.mapping.complete(),
			   ["<CR>"] = cmp.mapping.confirm({ select = true }),
			   ["<Tab>"] = cmp.mapping.select_next_item(),
			   ["<S-Tab>"] = cmp.mapping.select_prev_item(),
			},
			sources = {
			   	{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		   	experimental = {
		   		ghost_text = true,
		   },
		})
	end
}

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    automatic_enable = true,
    automatic_installation = true,
    ensure_installed = { "lua_ls", }
  },
  config = function(opts)
    require("mason-lspconfig").setup(opts)
  end
}

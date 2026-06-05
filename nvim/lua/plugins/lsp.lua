return {
  -- LSP
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", config = true },
      { "neovim/nvim-lspconfig" },
    },
    opts = {
      automatic_enable = true,
      automatic_installation = true,
      ensure_installed = { "lua_ls", }
    },
    config = function(opts)
      require("mason-lspconfig").setup(opts)
    end
  },
  -- Completion
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.lib" },
      { "rafamadriz/friendly-snippets" }
    },
    build = function()
      require("blink.cmp").build():pwait()
    end,
    opts = {
      keymap = { preset = "default" }
    }
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {},
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true, lsp_fallback = true }) end,
        desc = "Format using Conform",
        mode = { "n", "v" }
      },
    },
  },
  -- Syntax highlighting
  -- Requires tree-sitter CLI
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
      require("tree-sitter-manager").setup({
        ensure_installed = { "lua", "python", "c", "rust" },
        auto_install = true,
        border = "single" -- 'nil' for default borders
      })
    end
  }
}

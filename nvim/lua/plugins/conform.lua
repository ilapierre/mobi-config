return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- load plugin on file open
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "black", "isort" },
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" },
        },
        -- no format_on_save here = manual only
      })

      -- Keymap: <leader>f to format buffer or selection
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end, { desc = "Format file or selection" })
    end,
  },
}

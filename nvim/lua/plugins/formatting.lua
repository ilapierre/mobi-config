return {
  "stevearc/conform.nvim",
  config = function(_, opts)
    -- Keymap: <leader>f to format buffer or selection
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({
        async = true,
        lsp_fallback = true,
      })
    end, { desc = "Format file or selection" })
  end,
}

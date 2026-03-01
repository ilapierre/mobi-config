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
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open Oil" },
      { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open Oil (floating)" },
    },
    config = function(_, opts)
      require("oil").setup(opts)
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

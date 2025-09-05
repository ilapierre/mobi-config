-- snacks = collection of plugins QOL

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    indent = { enabled = true },
    dashboard = { enabled = true },
    quickfile = { enabled = true },
   }
}

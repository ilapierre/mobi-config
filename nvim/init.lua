require("config.lazy")
require("config.options")
require("config.mappings")

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●", -- or ">>", or "", whatever you prefer
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


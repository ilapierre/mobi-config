-- TODO: Have fun with this

return {
  'stevearc/overseer.nvim',
  opts = {},
  config = function(_, templates)
    local ov = require("overseer")

    ov.register_template({
      name = "python",
      builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        return {
          cmd = { "python", file },
          -- attach a component to the task that will pipe the output to the quickfix.
          -- components customize the behavior of a task.
          -- see :help overseer-components for a list of all components.
          components = {
            {
              "on_output_quickfix",
              set_diagnostics = true,
              open = true
            }, "default" },
        }
      end,
    })

    ov.setup()
  end
}

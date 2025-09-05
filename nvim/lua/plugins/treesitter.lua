return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ts_configs = require("nvim-treesitter.configs")

    ts_configs.setup({
      ensure_installed = {},
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- installs missing parser only if it’s not installed
    local parsers = require("nvim-treesitter.parsers")
    local parser_config = parsers.get_parser_configs()

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = parsers.ft_to_lang(args.match)
        if lang and not parsers.has_parser(lang) and parser_config[lang] then
          vim.schedule(function()
            vim.cmd("TSInstallSync " .. lang)
          end)
        end
      end,
    })
  end,
}

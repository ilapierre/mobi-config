return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets', "L3MON4D3/LuaSnip" },
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' }, -- default, super-tab, enter, none

    appearance = {
      nerd_font_variant = 'mono' -- switch to normal for `Nerd Font`
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    signature = { enabled = true },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "lua" }
  },
  opts_extend = { "sources.default" }
}

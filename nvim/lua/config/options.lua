vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

vim.cmd.colorscheme "catppuccin-mocha"

vim.diagnostic.config({ virtual_text = true })

-- indentation
vim.cmd("filetype plugin indent on")
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

require('plugins')

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.softtabstop = 4
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

vim.opt.clipboard:append({ 'unnamedplus' })  -- Sync with system clipboardet clipboard+=unnamedplus

-- Load additional config files
require('config.keymaps')
require('config.options')
require('config.mason')
require('config.lsp')
require('config.vimtex')
require('config.telescope')
require('config.harpoon')
require('config.diagnostic')
require('config.cmp')

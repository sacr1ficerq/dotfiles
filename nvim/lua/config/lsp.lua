local lsp = require('lspconfig')
local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  }
})

lsp.pyright.setup({})

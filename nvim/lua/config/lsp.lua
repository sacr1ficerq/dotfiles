local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    }
})

vim.lsp.enable('pyright')

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {'E501'},
                    maxLineLength = 100
                }
            }
        }
    }
})

-- Then, enable the 'pylsp' language server.
vim.lsp.enable({'pylsp'})


vim.lsp.enable('clangd')
-- lsp.texlab.setup({
--     settings = {
--         texlab = {
--             build = {
--                 executable = "latexmk",
--                 args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
--                 onSave = true
--             },
--             chktex = {
--                 onOpenAndSave = true
--             },
--             forwardSearch = {
--                 executable = "zathura",
--                 args = { "--synctex-forward", "%l:1:%f", "%p" }
--             }
--         }
--     }
-- })

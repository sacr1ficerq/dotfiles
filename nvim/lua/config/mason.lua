require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',       -- Lua
    }
})

-- Other LSP configs (keep these)
local lspconfig = require('lspconfig')
lspconfig.pyright.setup({})
lspconfig.texlab.setup({
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true
            },
            chktex = {
                onOpenAndSave = true
            },
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" }
            }
        }
    }
})

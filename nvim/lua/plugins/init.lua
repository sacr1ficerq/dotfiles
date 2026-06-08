return require('packer').startup(function(use)
    require('plugins.lualine')
    -- require('plugins.gitsigns')

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Essential plugins
    use 'nvim-lua/plenary.nvim'  -- Lua utilities
    use 'nvim-tree/nvim-web-devicons'  -- Icons

    -- Appearance
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = false
            })
            vim.cmd.colorscheme('rose-pine')
        end
    }

    use({
        "toppair/peek.nvim",
        run = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({ app = "browser" })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    })

    -- Lualine (separate plugin)
    use {
        'nvim-lualine/lualine.nvim',
        after = 'rose-pine', -- Optional: load after rose-pine
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'rose-pine' -- Make lualine match rose-pine
                }
            })
        end
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('config.gitsigns')
        end
    }

    -- Navigation
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use 'ThePrimeagen/harpoon'

    -- Editing
    use 'tpope/vim-surround'  -- Surround text objects
    use 'tpope/vim-commentary'  -- Commenting
    use 'windwp/nvim-autopairs'  -- Auto-pairs

    -- Mason
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        config = function()
            require('config.mason')
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',       -- Buffer completions
            'hrsh7th/cmp-path',         -- Path completions
            'hrsh7th/cmp-nvim-lsp',     -- LSP completions
            'L3MON4D3/LuaSnip',         -- Snippet engine
            'saadparwaiz1/cmp_luasnip', -- Snippet completions
        },
        config = function()
            require('config.cmp')
        end
    }

    -- Treesitter (Syntax Highlighting)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    }

    -- AI
    use {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    }
    -- use {
    --     'jpmcb/nvim-llama',
    --     config = function()
    --         require('nvim-llama').setup ({})
    --     end
    -- }


    use {
        'jannis-baum/vivify.vim',
    }
    use "rcarriga/nvim-notify"   -- optional
    use "stevearc/dressing.nvim" -- optional, UI for :JupyniumKernelSelect
    use {
        "jannis-baum/jupyviv.nvim",
        config = function()
            require("jupyviv").setup({})
        end
    }
    -- use 'karb94/neoscroll.nvim'
    use {
        'brianhuster/live-preview.nvim',
        requires = { 'nvim-telescope/telescope.nvim' }, -- Uses Telescope by default
        config = function()
        require('live-preview').setup({
            port = 5500, -- Set a custom port (default is random)
            browser = 'default', -- Options: 'default', 'chrome', 'firefox'
        })
    end
}

use {
    'malbertzard/inline-fold.nvim',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function()
        require('inline-fold').setup({
            defaultPlaceholder = "…",
            queries = {
                html = {
                    { pattern = 'class="([^"]*)"', placeholder = "@" }, -- Hides classes
                    { pattern = 'style="([^"]*)"', placeholder = "@" }, -- Hides classes
                    { pattern = 'href="(.-)"' }, -- Hides hrefs
                },
                -- Add configurations for tsx, vue, etc. as needed
                tsx = {
                    { pattern = 'className="([^"]*)"', placeholder = "@" },
                }
            }
        })
    end
}

end)

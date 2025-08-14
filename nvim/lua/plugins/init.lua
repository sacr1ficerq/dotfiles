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

    -- AI
    -- use {
    --     'jpmcb/nvim-llama',
    --     config = function()
    --         require('nvim-llama').setup ({})
    --     end
    -- }

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

    -- Markdown with LaTeX
    use {
        'toppair/peek.nvim',
        run = function()
            local peek_path = vim.fn.stdpath('data')..'/site/pack/packer/start/peek.nvim'
            if vim.fn.isdirectory(peek_path) == 1 then
                vim.fn.system({'deno', 'task', '--cwd', peek_path, 'build:fast'})
            end
        end,
        config = function()
            require('peek').setup({
                app = 'webview',
                webview = {
                    kitty_method = 'standalone',
                    timeout = 10,
                    backend = 'gl'
                },
                filetype = {'markdown'},
            })
        end
    }

    use {
        'jbyuki/nabla.nvim',
        config = function()
            -- Newer versions use this instead of setup()
            require('nabla').enable_virt()  -- Enable virtual text
            -- Optional keybindings:
            vim.keymap.set('n', '<leader>eq', require('nabla').popup)
        end
    }

    use 'lervag/vimtex'
end)

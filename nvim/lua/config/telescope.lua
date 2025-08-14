
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})

return {
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup()
        end

    }
}



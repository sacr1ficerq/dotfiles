return {
    {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',  -- New recommended install method
        ft = 'markdown',
        init = function()
            vim.g.mkdp_filetypes = {'markdown'}
            vim.g.mkdp_theme = 'dark'
        end
    }
}

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.tex_flavor = 'latex'

vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1  -- Closes quickfix after 1 keystroke
vim.g.vimtex_quickfix_open_on_warning = 0    -- Don't open on warnings
vim.g.vimtex_quickfix_ignore_filters = {     -- Ignore common warnings
    'Overfull',
    'Underfull',
    'Package hyperref Warning',
}

-- Keymaps
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function()
        -- Build LaTeX
        vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<cr>', { buffer = true, desc = 'Build LaTeX' })
        -- View PDF (forward search)
        vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<cr>', { buffer = true, desc = 'View PDF' })
        -- Stop compilation (if running)
        vim.keymap.set('n', '<leader>lq', '<cmd>VimtexStop<cr>', { buffer = true, desc = 'Stop LaTeX build' })
    end,
})

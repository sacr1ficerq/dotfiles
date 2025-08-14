vim.diagnostic.config({
    virtual_text = true, -- Show inline errors
    signs = true, -- Show gutter signs
    underline = true, -- Underline errors
    update_in_insert = false, -- Don't update diagnostics while typing
    severity_sort = true, -- Sort errors by severity
    float = {
        border = 'rounded', -- Border style
        source = 'always', -- Show source of error
        header = '',
        prefix = '',
    },
})

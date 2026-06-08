-- ~/.config/nvim/lua/config/keymaps.lua
-- Leader key
vim.g.mapleader = " "

-- Normal mode mappings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- File explorer

vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- Center after scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<CapsLock>', '<Esc>', { noremap = true, silent = true })

-- editing
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- copy to clipboard
vim.keymap.set("n", "<leader>c", "<cmd>!g++ --std=c++20 -fsanitize=address -o main % && ./main<CR>")
vim.keymap.set("n", "<leader>I", "<cmd>silent :w<CR>")

-- Markdown
vim.keymap.set("n", "<C-w>", function()
    require('peek').open()
end)

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

local function save_normal()
    vim.cmd('JupyvivRunHere')
    vim.fn.timer_start(150, function()
        vim.schedule(function()
            vim.cmd('w')
        end)
    end)
end

local function save_visual()
    vim.cmd('JupyvivRunSelection')
    vim.fn.timer_start(150, function()
        vim.schedule(function()
            vim.cmd('w')
        end)
    end)
end

vim.keymap.set("n", "<leader>x", save_normal)
vim.keymap.set("v", "<leader>x", save_visual)

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set({"n"}, "<leader>py", "<cmd>!python %<CR>")

vim.keymap.set("n", "<leader>pi", ":!xclip -selection clipboard -t image/png -o > ./image", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("i", "<C-c>", "<Esc>")

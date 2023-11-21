vim.keymap.set('n', '<Tab>', ":bnext<CR>", { desc = 'Jump to next buffer'})
vim.keymap.set('n', '<S-Tab>', ":bnext<CR>", { desc = 'Jump to previous buffer'})
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { desc = 'Exit insert in terminal'})


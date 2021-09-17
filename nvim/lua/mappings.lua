-- Make Y behave like D
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Use ESCAPE to exit in terminal mode
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>', { noremap = true })

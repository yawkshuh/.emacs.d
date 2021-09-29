--+--- LSP servers ---+--
local lspconfig = require('lspconfig')
local completion = require('completion')

lspconfig.clangd.setup { on_attach = completion.on_attach } }
lspconfig.rls.setup { on_attach = completion.on_attach }

--+--- LSP related keymaps ---+--
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? \"\\<C-n>\" : \"\\<S-Tab>\"', { noremap = true, expr = true })

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

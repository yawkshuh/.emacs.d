local g  = vim.g  -- global vars
local o  = vim.o  -- global opts
local wo = vim.wo -- window opts
local bo = vim.bo -- buffer opts

-- Use <SPC> as leader key
g.mapleader = ' '

-- Don't use line as cursor in insert mode
o.guicursor = ''

-- Font for GUI clients
o.guifont = "Fira Mono:h10"

-- Relative numbers
wo.relativenumber = true

-- Current line number
wo.number = true

-- Hide highlights after performing a search
o.hlsearch = false

-- Make buffer hidden when abandoned
o.hidden = true

-- Who wants sounds?
o.errorbells = false

-- 4 spaces tabs
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.smartindent = true

vim.cmd[[autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent ]]

-- Don't wrap if text exceeds screen width
wo.wrap = false

-- Don't create a swap file
bo.swapfile = false

-- Don't create a backup file
o.backup = false

-- Show results while typing a search pattern
o.incsearch = true

-- Enable 24-bit RGB
o.termguicolors = true

-- Start scrolling when 8 lines above/below end/beginning of file
o.scrolloff = 8

-- Hide mode status text since it's already in the status bar
o.showmode = false

-- Show column for LSP warnings and errors
wo.signcolumn = "yes"

-- Highlight column 80 as reference for max code lenght
wo.colorcolumn = "80"

require('plugins')

-- Set default colorscheme and lightline color scheme
vim.cmd[[colorscheme gruvbox]]
g.lightline = { colorscheme = "gruvbox" }

require('mappings')
require('telescope')
require('lsp')

vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function()
    --+-- PACKER ---+--
    use 'wbthomason/packer.nvim'

    --+--- THEMES ---+--
	use 'gruvbox-community/gruvbox'
    use 'jhlgns/naysayer88.vim'

    --+--- STATUS LINE ---+--
    use 'itchyny/lightline.vim'

    --+--- START SCREEN ---+--
    use 'mhinz/vim-startify'

    --+--- LPS ---+--
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'

    --+--- FILES ---+--
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }

end)

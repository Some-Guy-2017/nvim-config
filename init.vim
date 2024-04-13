"Plug 'rebelot/kanagawa.nvim' " colorscheme
"Plug 'folke/tokyonight.nvim' " colorscheme
"Plug 'preservim/nerdtree'    " directory tree
"Plug 'tmsvg/pear-tree'       " auto pair (brackets, quotes, etc)
call plug#begin()

    " color schemes
    Plug 'Shatur/neovim-ayu'
    Plug 'ellisonleao/gruvbox.nvim'

    Plug 'mhinz/vim-startify'    " cool start screen
    Plug 'lambdalisue/suda.vim'  " edit file as root
    Plug 'windwp/nvim-autopairs' " auto pair (brackets, quotes, etc.)

    Plug 'stevearc/dressing.nvim' " implementation of vim.ui.input and vim.ui.select (floating windows & whatnot)
    Plug 'nvim-lua/plenary.nvim'  " used by telescope
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' } " fuzzy finder
    Plug 'nvim-telescope/telescope-fzy-native.nvim'   " compiled sorter for faster performance
    "Plug 'xiyaowong/telescope-emoji.nvim'             " telescope emoji finder
    "Plug 'nvim-telescope/telescope-file-browser.nvim' " telescope file browser
    Plug 'ziontee113/icon-picker.nvim' " icon picker

    Plug 'mfussenegger/nvim-lint'  " linter with LSP support
    Plug 'mfussenegger/nvim-jdtls' " java LSP helper

    Plug 'lervag/vimtex'      " vimtex is a 'modern filetype and syntax plugin for LaTeX files'
    Plug 'aclements/latexrun' " required by vimtex

    Plug 'ludovicchabant/vim-gutentags' " tag manager

    " fuzzy finder
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Plug 'junegunn/fzf.vim'

    " LSP stuff / compatible code completion
    Plug 'neovim/nvim-lspconfig' " plugin to configure language servers for me
    Plug 'hrsh7th/cmp-nvim-lsp'  " 'nvim-cmp source for neovim's built-in language server client.'
    Plug 'hrsh7th/cmp-buffer'    " 'nvim-cmp source for buffer words.'
    Plug 'hrsh7th/cmp-path'      " 'nvim-cmp source for filesystem paths.'
    Plug 'hrsh7th/cmp-cmdline'   " 'nvim-cmp source for vim's cmdline.'
    Plug 'hrsh7th/nvim-cmp'      " LSP compliant code completion engine

    " snippet engine
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

"colorscheme ayu-mirage " dark mode
set background=light
colorscheme gruvbox

source /home/joe/.config/nvim/config.lua
source /home/joe/.config/nvim/config.vim
source /home/joe/.config/nvim/nvim-cmp.lua
source /home/joe/.config/nvim/keybinds.vim
source /home/joe/.config/nvim/vimtex.vim

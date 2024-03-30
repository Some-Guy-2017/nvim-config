call plug#begin()

    " color schemes
    Plug 'Shatur/neovim-ayu'
    Plug 'ellisonleao/gruvbox.nvim'
    "Plug 'rebelot/kanagawa.nvim'
    "Plug 'folke/tokyonight.nvim'

    Plug 'mhinz/vim-startify'    " cool start screen
    Plug 'neovim/nvim-lspconfig' " plugin to configure language servers for me
    Plug 'preservim/nerdtree'    " directory tree
    Plug 'tmsvg/pear-tree'       " auto pair (brackets, quotes, etc)

    Plug 'stevearc/dressing.nvim' " implementation of vim.ui.input and vim.ui.select (floating windows & whatnot)
    Plug 'nvim-lua/plenary.nvim'  " used by telescope
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' } " fuzzy finder
    Plug 'ziontee113/icon-picker.nvim' " icon picker

    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}            " code completion engine
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} " 9000+ snippets

    Plug 'mfussenegger/nvim-lint'  " linter with LSP support
    Plug 'mfussenegger/nvim-jdtls' " java LSP helper

    Plug 'lervag/vimtex'      " vimtex is a 'modern filetype and syntax plugin for LaTeX files'
    Plug 'aclements/latexrun' " required by vimtex

call plug#end()

" settings for code completion engine
let g:coq_settings = {'auto_start': 'shut-up', 'keymap.jump_to_mark': '<c-l>'}

"colorscheme ayu-mirage " dark mode
" light mode
set background=light
colorscheme gruvbox

source /home/joe/.config/nvim/lsp.lua
source /home/joe/.config/nvim/config.vim

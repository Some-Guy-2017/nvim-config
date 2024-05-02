"Plug 'rebelot/kanagawa.nvim' " colorscheme
"Plug 'folke/tokyonight.nvim' " colorscheme
"Plug 'preservim/nerdtree'    " directory tree
"Plug 'tmsvg/pear-tree'       " auto pair (brackets, quotes, etc)
"Plug 'xiyaowong/telescope-emoji.nvim'             " telescope emoji finder
"Plug 'nvim-telescope/telescope-file-browser.nvim' " telescope file browser
call plug#begin()

    Plug 'mhinz/vim-startify'           " cool start screen
    Plug 'lambdalisue/suda.vim'         " edit file as root
    Plug 'windwp/nvim-autopairs'        " auto pair (brackets, quotes, etc.)
    Plug 'nvim-lua/plenary.nvim'        " used by telescope
    Plug 'ludovicchabant/vim-gutentags' " tag manager
    "Plug 'Pocco81/HighStr.nvim'        " highlighting text plugin
    Plug 'tpope/vim-abolish'            " manage word variants
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   
    Plug 'tpope/vim-dispatch'           " async commands

    " markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' } " fuzzy finder
    Plug 'nvim-telescope/telescope-fzy-native.nvim'          " compiled sorter for faster performance
    Plug 'ziontee113/icon-picker.nvim'                       " icon picker
    Plug 'stevearc/dressing.nvim'                            " nvim ui implementations
    "Plug 'mfussenegger/nvim-lint'  " linter with LSP support

    " color schemes
    Plug 'Shatur/neovim-ayu'
    Plug 'ellisonleao/gruvbox.nvim'

    Plug 'lervag/vimtex'      " vimtex
    Plug 'aclements/latexrun' " required by vimtex

    " LSP stuff / compatible code completion
    Plug 'neovim/nvim-lspconfig'          " plugin to auto configure language servers
    Plug 'hrsh7th/cmp-nvim-lsp'           " nvim-cmp source: LSP
    Plug 'hrsh7th/cmp-buffer'             " nvim-cmp source: buffer
    Plug 'hrsh7th/cmp-path'               " nvim-cmp source: filesystem paths
    Plug 'hrsh7th/cmp-cmdline'            " nvim-cmp source: vim commandline
    Plug 'quangnguyen30192/cmp-nvim-tags' " nvim-cmp source: tags
    Plug 'hrsh7th/nvim-cmp'               " LSP compliant code completion engine
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    Plug 'saadparwaiz1/cmp_luasnip'     " use luasnip w/ nvim-cmp
    Plug 'rafamadriz/friendly-snippets' " snippet collection

call plug#end()

"colorscheme ayu-mirage " dark mode
set background=light
colorscheme gruvbox

" change leader to be comma
let g:mapleader = ","

source /home/joe/.config/nvim/keybinds.vim
source /home/joe/.config/nvim/config.lua
source /home/joe/.config/nvim/config.vim
source /home/joe/.config/nvim/nvim-cmp.lua
source /home/joe/.config/nvim/vimtex.vim
source /home/joe/.config/nvim/markdown-preview.vim
source /home/joe/.config/nvim/luasnip.lua
source /home/joe/.config/nvim/treesitter.lua

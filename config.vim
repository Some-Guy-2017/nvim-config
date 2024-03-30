set number          " line numbers
set relativenumber  " shows the relative line count from cursor
set shiftwidth=4    " about of whitespace to be added in normal mode
set softtabstop=4   " the amount of whitespace to be added
set tabstop=4       " width of the tab character
set expandtab       " use spaces instead of tabs
set ignorecase      " ignore case when tab-completing commands
set spelllang=en_us " set spell check language to U.S. English
set spell           " enable spell check
"set nowrap          " don't automatically wrap on multiline comments

" KEYBINDS
" change leader to be comma
let g:mapleader = ","

" map Ctrl+n to open new tab
"nnoremap <C-n> :tabnew<CR>

" map 'y' to yank to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

" map 'p' to paste from the system clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P

" map 'q' to copy any command to system clipboard
nnoremap <Leader>q "+
vnoremap <Leader>q "+

" map '/' to clear search result highlighting
nnoremap <Leader>/ :noh<CR>:echo "Cleared highlights"<CR>

" map 'r' to redo
nnoremap <Leader>r <C-r>

" remap Ctrl+Backspace to delete a word
nnoremap <C-h> i<C-w><Esc>l
inoremap <C-h> <C-w>

" remap Ctrl+z in insert mode to undo
inoremap <C-z> <C-u>

" map 'zz' to place the cursor at a high comfortable position
nnoremap <Leader>zu mBz<CR>10k`B

" map 'zu' to place the cursor at a low comfortable position
nnoremap <Leader>zz mBz-10j`B

" remap finding the next character to also center cursor
nnoremap n nzz
nnoremap N Nzz

" map 'o' to paste onto the next line
nnoremap <Leader>o mBo<Esc>p`B

" map 'e' to insert one character
nnoremap <Leader>e i_<Esc>r

" map 'w' to write
nnoremap <Leader>w :w<CR>

" map 'a' to Ctrl+w for window commands
nnoremap <Leader>a <C-w>

" map 's' to source vimrc
nnoremap <Leader>s :source $MYVIMRC<CR>:echo "Loaded init.vim"<CR>

" map ; to comment the current line
autocmd BufRead,BufNewFile *.cpp,*.c,*.rs,*.js,*.java   nnoremap <Leader>; mB^i//<Esc>`B
autocmd BufRead,BufNewFile *.py,*.sh,*.bash             nnoremap <Leader>; mB^i#<Esc>`B
autocmd BufRead,BufNewFile *.vim                        nnoremap <Leader>; mB^i"<Esc>`B
autocmd BufRead,BufNewFile *.tex                        nnoremap <Leader>; mB^i%<Esc>`B
autocmd BufRead,BufNewFile *.s,*.asm                    nnoremap <Leader>; mB^i;<Esc>`B

" map , to uncomment the current line
autocmd BufRead,BufNewFile *.cpp,*.c,*.rs,*.js,*.java   nnoremap <Leader>. mB:s/^\(\s*\)\(\/\/\)\?/\1<CR>:noh<CR>:echo<CR>`B
autocmd BufRead,BufNewFile *.py,*.sh,*.bash             nnoremap <Leader>. mB:s/^\(\s*\)\(#\)\?/\1<CR>:noh<CR>:echo<CR>`B
autocmd BufRead,BufNewFile *.vim                        nnoremap <Leader>. mB:s/^\(\s*\)\("\)\?/\1<CR>:noh<CR>:echo<CR>`B
autocmd BufRead,BufNewFile *.tex                        nnoremap <Leader>. mB:s/^\(\s*\)\(%\)\?/\1<CR>:noh<CR>:echo<CR>`B
autocmd BufRead,BufNewFile *.s,*.asm                    nnoremap <Leader>. mB:s/^\(\s*\)\(;\)\?/\1<CR>:noh<CR>:echo<CR>`B
" - mB sets the mark 'B' (unlikely to be used because it is a capital letter) to
" remember the cursor position
" - :s does search/replace on the current line
" - ^\(\s*\) searches for leading whitespace
" - \(\/\/\)\? searches for 0 or 1 instances of //
" - /\1 replaces the match with the first group (just the whitespace)
" - <CR> enters the search/replace query
" - :noh<CR> clears the highlighting from the search/replace
" - :echo<CR> clears the command prompt
" - `Bj replaces the cursor, then moves down a line


" RANDOM USELESS SHIT

" stop :wq from writing and quitting, forcing :x instead 
:cabbrev wq echo "use :x instead"

" vimscript to use system clipboard;
" when in use, cannot hold keys that write to clipboard (e.g. x)
" now custom keybinds are used specially for the system clipboard
"if has("unnamedplus")
"    set clipboard=unnamedplus
"else
"    set clipboard=unnamed
"endif


" CONFIG FOR VimTeX

" This is necessary for VimTeX to load properly. The 'indent' is optional. 
" Note that most plugin managers will do this automatically. 
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some 
" VimTeX features will not work (see ':help vimtex-requirements' for more 
" info). 
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in 
" viewer method: 
"let g:vimtex_view_method = 'zathura'
let g:vimtex_view_method = 'general'

" Or with a generic interface: 
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is 
" strongly recommended, you probably don't need to configure anything. If you 
" want another compiler backend, you can change it as follows. The list of 
" supported backends and further explanation is provided in the documentation, 
" see ':help vimtex-compiler'. 
"let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the 
" following line. The default is usually fine and is the symbol "\\'. 
let maplocalleader = ","


" ICON PICKER & DRESSING CONFIG
lua << EOF

-- icon picker
require("icon-picker").setup({ disable_legacy_commands = true })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
vim.keymap.set("i", "<C-f>", "<cmd>IconPickerInsert<cr>", opts)

EOF

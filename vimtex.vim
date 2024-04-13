" This is necessary for VimTeX to load properly. The 'indent' is optional. 
" Note that most plugin managers will do this automatically. 
filetype plugin indent on

syntax enable " enable syntax
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_method = 'general' " configure the output viewer
"let g:vimtex_compiler_method = 'latexrun' " specify a compiler back end other than latexmk
let maplocalleader = ","
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0 " quickfix window is never opened or closed automatically
"set conceallevel=2
"set concealcursor=n " conceal lines in normal mode
"let g:tex_conceal='abdmgs' " conceal accents, bold & italic, delimiters, math symbols, Greek, and superscripts / subscripts
set conceallevel=0
set concealcursor&
let g:tex_conceal='abdmgs' " conceal accents, bold & italic, delimiters, math symbols, Greek, and superscripts / subscripts

" This is necessary for VimTeX to load properly. The 'indent' is optional. 
" Note that most plugin managers will do this automatically. 
filetype plugin indent on

syntax enable " enable syntax
let g:vimtex_view_method = 'zathura'
let maplocalleader = ","
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0 " quickfix window is never opened or closed automatically
let g:vimtex_indent_on_ampersands = 0
set conceallevel=0
set concealcursor&
let g:tex_conceal = 'abdmgs' " conceal accents, bold & italic, delimiters, math symbols, Greek, and superscripts / subscripts

"set conceallevel=2
"set concealcursor=n " conceal lines in normal mode
"let g:tex_conceal='abdmgs' " conceal accents, bold & italic, delimiters, math symbols, Greek, and superscripts / subscripts

" map 'w' in command mode to write with permissions
cnoremap <leader>w SudaWrite<cr>

" map Ctrl+n to open new tab
"nnoremap <c-n> <cmd>tabnew<cr>

" map 'y' to yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" map 'p' to paste from the system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" map 'o' to paste onto next / previous line
nnoremap <leader>O mAO<space><bs><esc>p`A
nnoremap <leader>o mAo<space><bs><esc>p`A
nnoremap "+<leader>O mAO<space><bs><esc>"+p`A
nnoremap "+<leader>o mAo<space><bs><esc>"+p`A

" map '/' to clear search result highlighting
noremap <leader>/ <cmd>silent noh<cr>

" remap Ctrl+Backspace to delete a word
"nnoremap <c-h> i<c-w><esc>l <-- basically never used
inoremap <c-h> <c-w>

" remap Ctrl+z in insert mode to undo
inoremap <c-z> <c-u>

" map 'z' to place the cursor at a comfortable position
noremap <leader>z mAz<cr>10k`A
noremap <leader>Z mAz-10j`A

" remap finding the next character to also center cursor
noremap n nzz
noremap N Nzz

" map writing in insert & normal mode
nnoremap <leader>w <cmd>w<cr>
inoremap <c-w> <esc><cmd>w<cr>a

" map 'a' to Ctrl+w for window commands
nnoremap <leader>a <c-w>
vnoremap <leader>a <c-w>

" map 'r' to source vimrc
nnoremap <leader>r <cmd>source $MYVIMRC<cr><cmd>echo "Loaded init.vim"<cr>

" map 'd' to edit vimrc
nnoremap <leader>j <cmd>silent tabnew<cr><cmd>silent edit $MYVIMRC<cr><cmd>silent tcd %:h<cr>

" map 'm' to move the text selected by markers
"nnoremap <leader>m mA'1"ad'2'A"ap

" map 'b' to fuzzy find buffers (fzf)
nnoremap <leader>b <cmd>Telescope buffers<cr>

" map 't' to fuzzy find tags (fzf)
nnoremap <leader>t <cmd>silent exec "!ctags ."<cr><cmd>Telescope tags<cr>

" map 'f' to fuzzy find files
nnoremap <leader>f <cmd>Telescope find_files<cr>

" map 'n' and 'p' to change buffers
"nnoremap <leader>r <cmd>bnext<cr>
"nnoremap <leader>u <cmd>bprevious<cr>

" map c to open the current directory
nnoremap <leader>c <cmd>edit %:h<cr>

" map 'v' to change the working directory to the file directory
nnoremap <leader>v mA<cmd>if isdirectory(bufname("%"))<cr>tcd %<cr>else<cr>tcd %:h<cr>endif<cr><cr>`A

" map 'g' to insert a newline above / below the cursor
nnoremap <leader>G               mAO<space><esc>d^x`A
nnoremap <leader>g               mAo<space><esc>d^x`A
inoremap <c-g>   <space><bs><esc>mAo<space><esc>d^x`Aa

" map 'i' to enter / leave conceal mode
"noremap <leader>i <cmd>set conceallevel=2<cr><cmd>set concealcursor=ni<cr>
"noremap <leader>I <cmd>set conceallevel=0<cr><cmd>set concealcursor&<cr>
"inoremap <c-u>     <cmd>set conceallevel=2<cr><cmd>set concealcursor=ni<cr>
"inoremap <c-y>     <cmd>set conceallevel=0<cr><cmd>set concealcursor&<cr>

" change ' and ` to have opposite functions
nnoremap ' `
nnoremap ` '

" map 'h' to open vimtex Table of Contents
nnoremap <leader>h <cmd>VimtexTocOpen<cr>

" remap 'q' to play the last macro, and leader+q to perform the 'q' functions
nnoremap q @@
nnoremap <leader>q q

" change vim panes with <C-arrow keys>
inoremap <c-left>   <esc><c-w>hi
inoremap <c-right>  <esc><c-w>li
inoremap <c-down>   <esc><c-w>ji
inoremap <c-up>     <esc><c-w>ki

" map <c-s> to swap letters
inoremap <c-s> <esc>hxpa
noremap <leader>s hxp

" map ; to comment the current line
autocmd BufRead,BufNewFile *.cpp,*.c,*.rs,*.js,*.java   nnoremap <leader>; mB^i//<esc>`B
autocmd BufRead,BufNewFile *.py,*.sh,*.bash             nnoremap <leader>; mB^i#<esc>`B
autocmd BufRead,BufNewFile *.vim                        nnoremap <leader>; mB^i"<esc>`B
autocmd BufRead,BufNewFile *.tex                        nnoremap <leader>; mB^i%<esc>`B
autocmd BufRead,BufNewFile *.s,*.asm                    nnoremap <leader>; mB^i;<esc>`B

" map , to uncomment the current line
autocmd BufRead,BufNewFile *.cpp,*.c,*.rs,*.js,*.java   nnoremap <leader>. mB<cmd>s/^\(\s*\)\(\/\/\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
autocmd BufRead,BufNewFile *.py,*.sh,*.bash             nnoremap <leader>. mB<cmd>s/^\(\s*\)\(#\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
autocmd BufRead,BufNewFile *.vim                        nnoremap <leader>. mB<cmd>s/^\(\s*\)\("\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
autocmd BufRead,BufNewFile *.tex                        nnoremap <leader>. mB<cmd>s/^\(\s*\)\(%\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
autocmd BufRead,BufNewFile *.s,*.asm                    nnoremap <leader>. mB<cmd>s/^\(\s*\)\(;\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
" - mA sets the mark 'A' (unlikely to be used because it is a capital letter) to
" remember the cursor position
" - <cmd>s does search/replace on the current line
" - ^\(\s*\) searches for leading whitespace
" - \(\/\/\)\? searches for 0 or 1 instances of //
" - /\1 replaces the match with the first group (just the whitespace)
" - <cr> enters the search/replace query
" - <cmd>noh<cr> clears the highlighting from the search/replace
" - <cmd>echo<cr> clears the command prompt
" - `Aj replaces the cursor, then moves down a line

command SpellUpdate mkspell! /home/joe/.config/nvim/spell/en.utf-8.add
command SpellEdit   silent exec "tabnew | silent edit /home/joe/.config/nvim/spell/en.utf-8.add | tcd %:h"
command TagGenerate silent !ctags .

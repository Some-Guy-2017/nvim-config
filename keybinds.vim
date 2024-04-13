
" change leader to be comma
let g:mapleader = ","

cnoremap <leader>w SudaWrite<CR>

" map Ctrl+n to open new tab
"nnoremap <c-n> <cmd>tabnew<CR>

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
nnoremap <leader>qO mAO<space><bs><esc>"+p`A
nnoremap <leader>qo mAo<space><bs><esc>"+p`A
 
" map 'q' to copy any command to system clipboard
nnoremap <leader>q "+
vnoremap <leader>q "+

" map '/' to clear search result highlighting
nnoremap <leader>/ <cmd>noh<CR><cmd>echo "Cleared highlights"<CR>
vnoremap <leader>/ <cmd>noh<CR><cmd>echo "Cleared highlights"<CR>

" remap Ctrl+Backspace to delete a word
"nnoremap <c-h> i<c-w><esc>l <-- basically never used
inoremap <c-h> <c-w>

" remap Ctrl+z in insert mode to undo
inoremap <c-z> <c-u>

" map 'z' to place the cursor at a high comfortable position
nnoremap <leader>z mAz<CR>10k`A
vnoremap <leader>z mAz<CR>10k`A

" map 'x' to place the cursor at a low comfortable position
nnoremap <leader>x mAz-10j`A
vnoremap <leader>x mAz-10j`A

" remap finding the next character to also center cursor
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" map 'e' to insert one character
"nnoremap <leader>e i<space><esc>r NO LONGER WORKS

" map writing in insert & normal mode
nnoremap <leader>w <cmd>w<CR>
inoremap <c-W> <esc><cmd>w<CR>a

" map 'a' to Ctrl+w for window commands
nnoremap <leader>a <c-w>
vnoremap <leader>a <c-w>

" map 's' to source vimrc
nnoremap <leader>s <cmd>source $MYVIMRC<CR><cmd>echo "Loaded init.vim"<CR>

" map 'l' to edit vimrc
nnoremap <leader>l <cmd>tabnew<CR><cmd>e $MYVIMRC<CR><cmd>echo "Editing init.vim"<CR>

" map 'm' to move the text selected by markers
nnoremap <leader>m mA'1"ad'2'A"ap

" map 'b' to fuzzy find buffers (fzf)
"nnoremap <leader>b <cmd>ls<CR><cmd>b<space>
nnoremap <leader>b <cmd>Telescope buffers<CR>

" map 't' to fuzzy find tags (fzf)
nnoremap <leader>t <cmd>Telescope tags<CR>

" map 'f' to fuzzy find files
nnoremap <leader>f <cmd>Telescope find_files<CR>

" map 'n' and 'p' to change buffers
nnoremap <leader>r <cmd>bnext<CR>
nnoremap <leader>u <cmd>bprevious<CR>

" map 'd' to delete up until a search key
nnoremap <leader>d d//e<Left><Left>

" map 'c' to open the current directory
"nnoremap <leader>c <cmd>cd %:h<CR><cmd>e %:h<CR>
nnoremap <leader>c <cmd>e %:h<CR>

" map 'v' to change the working directory to the file directory
"nnoremap <leader>vf <cmd>cd %:h<CR>
"nnoremap <leader>vd <cmd>cd %<CR>
nnoremap <leader>v <cmd>if isdirectory(bufname("%"))<CR>cd %<CR>else<CR>cd %:h<CR>endif<CR><CR>

" map 'g' to insert a newline above / below the cursor
nnoremap <leader>G mAO<esc>x`A
nnoremap <leader>g mAo<esc>x`A

" map 'i' to enter / leave conceal mode
nnoremap <leader>i <cmd>set conceallevel=2<cr><cmd>set concealcursor=ni<cr>
nnoremap <leader>I <cmd>set conceallevel=0<cr><cmd>set concealcursor&<cr>

" change ' and ` to have opposite functions
nnoremap ' `
nnoremap ` '

nnoremap <leader>h <cmd>VimtexTocOpen<cr>

" map window size change controls using 'c'
"nnoremap <leader>ch <c-W>10<
"nnoremap <leader>cj <c-W>10-
"nnoremap <leader>ck <c-W>10+
"nnoremap <leader>cl <c-W>10>

" map ; to comment the current line
autocmd BufRead,BufNewFile *.cpp,*.c,*.rs,*.js,*.java   nnoremap <leader>; mB^i//<esc>`B
autocmd BufRead,BufNewFile *.py,*.sh,*.bash             nnoremap <leader>; mB^i#<esc>`B
autocmd BufRead,BufNewFile *.vim                        nnoremap <leader>; mB^i"<esc>`B
autocmd BufRead,BufNewFile *.tex                        nnoremap <leader>; mB^i%<esc>`B
autocmd BufRead,BufNewFile *.s,*.asm                    nnoremap <leader>; mB^i;<esc>`B

" map , to uncomment the current line
autocmd BufRead,BufNewFile *.cpp,*.c,*.rs,*.js,*.java   nnoremap <leader>. mB<cmd>s/^\(\s*\)\(\/\/\)\?/\1<CR><cmd>noh<CR><cmd>echo<CR>`B
autocmd BufRead,BufNewFile *.py,*.sh,*.bash             nnoremap <leader>. mB<cmd>s/^\(\s*\)\(#\)\?/\1<CR><cmd>noh<CR><cmd>echo<CR>`B
autocmd BufRead,BufNewFile *.vim                        nnoremap <leader>. mB<cmd>s/^\(\s*\)\("\)\?/\1<CR><cmd>noh<CR><cmd>echo<CR>`B
autocmd BufRead,BufNewFile *.tex                        nnoremap <leader>. mB<cmd>s/^\(\s*\)\(%\)\?/\1<CR><cmd>noh<CR><cmd>echo<CR>`B
autocmd BufRead,BufNewFile *.s,*.asm                    nnoremap <leader>. mB<cmd>s/^\(\s*\)\(;\)\?/\1<CR><cmd>noh<CR><cmd>echo<CR>`B
" - mA sets the mark 'A' (unlikely to be used because it is a capital letter) to
" remember the cursor position
" - <cmd>s does search/replace on the current line
" - ^\(\s*\) searches for leading whitespace
" - \(\/\/\)\? searches for 0 or 1 instances of //
" - /\1 replaces the match with the first group (just the whitespace)
" - <CR> enters the search/replace query
" - <cmd>noh<CR> clears the highlighting from the search/replace
" - <cmd>echo<CR> clears the command prompt
" - `Aj replaces the cursor, then moves down a line

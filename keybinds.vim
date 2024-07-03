" map ',' to perform the actual comma function
nnoremap <leader>, ,
xnoremap <leader>, ,

" map Alt+t to open new tab
nnoremap <m-t> <cmd>tabnew<cr><cmd>Telescope find_files<cr>

" map 'y' to yank to system clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y

" map 'p' to paste from the system clipboard
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P

" map 'o' to paste onto next / previous line
nnoremap <leader>op mAO<space><bs><esc>p`A
nnoremap <leader>on mAo<space><bs><esc>p`A
nnoremap <leader>oP mAO<space><bs><esc>"+p`A
nnoremap <leader>oN mAo<space><bs><esc>"+p`A

" map '/' to clear search result highlighting
let b:highlighting = v:false
nnoremap <leader>/ <cmd>let b:highlighting = v:false<cr><cmd>silent noh<cr>
xnoremap <leader>/ <cmd>let b:highlighting = v:false<cr><cmd>silent noh<cr>

" remap Ctrl+Backspace to delete a word
"nnoremap <c-h> i<c-w><esc>l <-- basically never used
inoremap <c-h> <c-w>
cnoremap <c-h> <c-w>

" map 'z' to place the cursor at a comfortable position
nnoremap <leader>z mAz<cr>10k`A
nnoremap <leader>Z mAz-10j`A
xnoremap <leader>z mAz<cr>10k`A
xnoremap <leader>Z mAz-10j`A

" remap finding the next character to also center cursor
nnoremap n nzz
nnoremap N Nzz
xnoremap n nzz
xnoremap N Nzz

" map writing in insert & normal mode
nnoremap <leader>w <cmd>w<cr>

" map 'r' to source vimrc
nnoremap <leader>r <cmd>source $MYVIMRC<cr>

" Telescope
nnoremap <leader>b <cmd>BfClean<cr><cmd>Telescope buffers<cr>
nnoremap <leader>t <cmd>Telescope tags<cr>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope highlights<cr>

" map 'g' to insert a newline above / below the cursor
nnoremap <m-g> mAo<space><esc>d^x`A
nnoremap <m-G> mAO<space><esc>d^x`A
inoremap <m-g> <space><bs><esc>mAo<space><esc>d^x`Aa
inoremap <m-G> <space><bs><esc>mAO<space><esc>d^x`Aa

" change ' and ` to have opposite functions
nnoremap ' `
nnoremap ` '

" map <m-s> to swap letters
nnoremap <leader>s hxp

" map space to toggle fold
nnoremap <space> za
xnoremap <space> za

" map alt+move to change tab
nnoremap <m-h> gT
nnoremap <m-l> gt
xnoremap <m-h> gTv
xnoremap <m-l> gtv
inoremap <m-h> <esc>gTa
inoremap <m-l> <esc>gta

" map alt+shift+move 
nnoremap <m-H> <cmd>tabm -1<cr>
nnoremap <m-L> <cmd>tabm +1<cr>
xnoremap <m-H> <cmd>tabm -1<cr>
xnoremap <m-L> <cmd>tabm +1<cr>
inoremap <m-H> <cmd>tabm -1<cr>
inoremap <m-L> <cmd>tabm +1<cr>

" lsp bindings
"nnoremap <leader>x <cmd>lua vim.lsp.buf.hover()<cr> " use 'K'
nnoremap <leader>lr <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>lx <cmd>lua vim.lsp.buf.references()<cr> " x for cross reference
nnoremap <leader>li <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>ld <cmd>lua vim.lsp.buf.definition()<cr>

" map backspace in select mode to delete the currently selected word
snoremap <bs> _<bs>

" map 'v' to change the character under the cursor to upper case, and edit
" behind it
nnoremap <leader>v gewg~li

" map 'u' to fancy LaTeX shenanigans
nnoremap <leader>u mA0i_<esc>dt&kyt&jPv0r<space>`A
nnoremap <leader>U mA0i_<esc>dt&jyt&kPv0r<space>`A

"" map ; to comment the current line, and . to uncomment the line
"augroup CommentKeybinds
"    autocmd!
"    autocmd FileType cpp,c,rust,javascript,java silent nnoremap <buffer> <leader>; mBI//<esc>`B
"    autocmd FileType python,sh,bash             silent nnoremap <buffer> <leader>; mBI#<esc>`B
"    autocmd FileType vim                        silent nnoremap <buffer> <leader>; mBI"<esc>`B
"    autocmd FileType tex                        silent nnoremap <buffer> <leader>; mBI%<esc>`B
"    autocmd FileType s,asm                      silent nnoremap <buffer> <leader>; mBI;<esc>`B
"    autocmd FileType lua                        silent nnoremap <buffer> <leader>; mBI--<esc>`B
"    
"    autocmd FileType cpp,c,rust,javascript,java silent nnoremap <buffer> <leader>. mB<cmd>s/^\(\s)\(\/\/\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
"    autocmd FileType python,sh,bash             silent nnoremap <buffer> <leader>. mB<cmd>s/^\(\s)\(#\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
"    autocmd FileType vim                        silent nnoremap <buffer> <leader>. mB<cmd>s/^\(\s)\("\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
"    autocmd FileType tex                        silent nnoremap <buffer> <leader>. mB<cmd>s/^\(\s)\(%\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
"    autocmd FileType s,asm                      silent nnoremap <buffer> <leader>. mB<cmd>s/^\(\s)\(;\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
"    autocmd FileType lua                        silent nnoremap <buffer> <leader>. mB<cmd>s/^\(\s)\(--\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B
"" - mA sets the mark 'A' (unlikely to be used because it is a capital letter) to
"" remember the cursor position
"" - <cmd>s does search/replace on the current line
"" - ^\(\s*\) searches for leading whitespace
"" - \(\/\/\)\? searches for 0 or 1 instances of //
"" - /\1 replaces the match with the first group (just the whitespace)
"" - <cr> enters the search/replace query
"" - <cmd>noh<cr> clears the highlighting from the search/replace
"" - <cmd>echo<cr> clears the command prompt
"" - `Aj replaces the cursor, then moves down a line
"augroup end

function MultilineColon(count)
    if a:count == 0
        return ":"
    else
        return ":.,.+" .. a:count
    endif
endfunction

nnoremap : <cmd>call feedkeys(MultilineColon(v:count), 'n')<cr>
nnoremap J <cmd>exec "norm! " .. (v:count+1) .. "J"<cr>

" map 'Make' commands
nnoremap <leader>mr <cmd>Make run<cr>
nnoremap <leader>me <cmd>Make! run<cr>
nnoremap <leader>mm <cmd>Make<cr>
nnoremap <leader>mn <cmd>Make!<cr>
nnoremap <leader>mv <cmd>Make view<cr>
nnoremap <leader>mc <cmd>Make! view<cr>
nnoremap <leader>mf <cmd>Make test<cr>
nnoremap <leader>md <cmd>Make! test<cr>

" Ctrl+W + T moves pane into its own tab

" map Alt+f to exit insert mode
inoremap <m-f> <esc>

" map Alt+d to insert a space in front of the cursor
inoremap <m-d> <space><esc>i

" map Alt+a to jump to the next space
inoremap <m-a> <c-o>f<space>

function RelativeEdit()
    return ":.,.+" .. a:count
endfunction

nnoremap : <cmd>call feedkeys(MultilineColon(v:count), 'n')<cr>
nnoremap <leader>n <cmd>call feedkeys(":e " .. expand("%:p:h") .. "/", 'n')<cr>

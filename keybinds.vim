function s:map_keybind(mode, keybind, output)
    if a:mode == 'n'
        let output = "<esc><esc>" .. a:output
    else
        let output = a:output
    endif
    exec a:mode .. "noremap " .. a:keybind .. " " .. output
endfunction

" map ',' to perform the actual comma function
call s:map_keybind('n', '<leader>,', ',')
call s:map_keybind('x', '<leader>,', ',')

" map Alt+t to open new tab
"call s:map_keybind('n', '<m-t>', '<cmd>tabnew<cr><cmd>Telescope find_files<cr>')
call s:map_keybind('n', '<m-t>', '<cmd>tabnew<cr>')

" map 'y' to yank to system clipboard
call s:map_keybind('n', '<leader>y', '"+y')
call s:map_keybind('x', '<leader>y', '"+y')

" map 'p' to paste from the system clipboard
call s:map_keybind('n', '<leader>p', '"+p')
call s:map_keybind('x', '<leader>p', '"+p')
call s:map_keybind('n', '<leader>P', '"+P')
call s:map_keybind('x', '<leader>P', '"+P')

" map 'o' to paste onto next / previous line
call s:map_keybind('n', '<leader>op', 'mAO<space><bs><esc>p`A')
call s:map_keybind('n', '<leader>on', 'mAo<space><bs><esc>p`A')
call s:map_keybind('n', '<leader>oP', 'mAO<space><bs><esc>"+p`A')
call s:map_keybind('n', '<leader>oN', 'mAo<space><bs><esc>"+p`A')

" map '/' to clear search result highlighting
let b:highlighting = v:false
call s:map_keybind('n', '<leader>/', '<cmd>let b:highlighting = v:false<cr><cmd>silent noh<cr>')
call s:map_keybind('x', '<leader>/', '<cmd>let b:highlighting = v:false<cr><cmd>silent noh<cr>')

" remap Ctrl+Backspace to delete a word
"call s:map_keybind('n', '<c-h>', 'i<c-w><esc>l <-- basically never used')
call s:map_keybind('i', '<c-h>', '<c-w>')
call s:map_keybind('c', '<c-h>', '<c-w>')

" map 'z' to place the cursor at a comfortable position
function GetUsableWidth()
    set virtualedit=all
    norm! mAg$
    let usablewidth = virtcol('.')
    norm! `A
    set virtualedit=
    return usablewidth
endfunction

function MoveScreen(distance)
    let usablewidth = GetUsableWidth()
    if getcurpos()[2] == usablewidth
        exec "norm! " .. a:distance .. "zl"
    endif
endfunction

let height_change = winheight(0) / 3
let width_change = winwidth(0) / 3
call s:map_keybind('n', '<leader>zk', 'zt' .. height_change .. '<c-y>')
call s:map_keybind('n', '<leader>zj', 'zb' .. height_change .. '<c-e>')
call s:map_keybind('x', '<leader>zk', 'zt' .. height_change .. '<c-y>')
call s:map_keybind('x', '<leader>zj', 'zb' .. height_change .. '<c-e>')
call s:map_keybind('n', '<leader>zl', 'ze<cmd>call MoveScreen(' .. width_change .. '30)<cr>')
call s:map_keybind('n', '<leader>zh', 'zs' .. width_change .. 'zh')
call s:map_keybind('n', '<leader>zz', 'zszH')

function StoreCursorPos()
    let b:cursorpos = getcurpos()
endfunction

function MoveCursorCol(relcol)
    call setcursorcharpos(b:cursorpos[1], b:cursorpos[2] + a:relcol)
endfunction

call s:map_keybind('n', '<m-d>', '<cmd>call StoreCursorPos()<cr>zL<cmd>call MoveCursorCol(winwidth(0)/2)<cr>')
call s:map_keybind('n', '<m-f>', '<cmd>call StoreCursorPos()<cr>2zL<cmd>call MoveCursorCol(winwidth(0))<cr>')
call s:map_keybind('n', '<m-u>', '<cmd>call StoreCursorPos()<cr>zH<cmd>call MoveCursorCol(-winwidth(0)/2)<cr>')
call s:map_keybind('n', '<m-b>', '<cmd>call StoreCursorPos()<cr>2zH<cmd>call MoveCursorCol(-winwidth(0))<cr>')

call s:map_keybind('x', '<m-d>', '<cmd>call StoreCursorPos()<cr>zL<cmd>call MoveCursorCol(winwidth(0)/2)<cr>')
call s:map_keybind('x', '<m-f>', '<cmd>call StoreCursorPos()<cr>2zL<cmd>call MoveCursorCol(winwidth(0))<cr>')
call s:map_keybind('x', '<m-u>', '<cmd>call StoreCursorPos()<cr>zH<cmd>call MoveCursorCol(-winwidth(0)/2)<cr>')
call s:map_keybind('x', '<m-b>', '<cmd>call StoreCursorPos()<cr>2zH<cmd>call MoveCursorCol(-winwidth(0))<cr>')

call s:map_keybind('n', '<leader>a', 'i <esc><cmd>call feedkeys("r", "n")<cr>')

" remap finding the next character to also center cursor
call s:map_keybind('n', 'n', 'nzz')
call s:map_keybind('n', 'N', 'Nzz')
call s:map_keybind('x', 'n', 'nzz')
call s:map_keybind('x', 'N', 'Nzz')

" map writing in insert & normal mode
call s:map_keybind('n', '<leader>w', '<cmd>w<cr>')

" Telescope
call s:map_keybind('n', '<leader>tb', '<cmd>silent! BfClean<cr><cmd>Telescope buffers<cr>')
call s:map_keybind('n', '<leader>tt', '<cmd>Telescope tags<cr>')
call s:map_keybind('n', '<leader>tf', '<cmd>Telescope find_files<cr>')
call s:map_keybind('n', '<leader>th', '<cmd>Telescope highlights<cr>')

" map 'i' to insert a newline above / below the cursor
call s:map_keybind('n', '<m-i>', 'mAo<space><esc>d^x`A')
call s:map_keybind('n', '<m-I>', 'mAO<space><esc>d^x`A')
call s:map_keybind('i', '<m-i>', '<space><bs><esc>mAo<space><esc>d^x`Aa')
call s:map_keybind('i', '<m-I>', '<space><bs><esc>mAO<space><esc>d^x`Aa')

" change ' and ` to have opposite functions
call s:map_keybind('n', "'", "`")
call s:map_keybind('n', "`", "'")

" map 's' to swap letters
call s:map_keybind('n', '<leader>s', 'hxp')

" map space to toggle fold
call s:map_keybind('n', '<space>', 'za')
call s:map_keybind('x', '<space>', 'za')

" map alt+move to change tab
call s:map_keybind('n', '<m-h>', 'gT')
call s:map_keybind('n', '<m-l>', 'gt')
call s:map_keybind('x', '<m-h>', 'gTv')
call s:map_keybind('x', '<m-l>', 'gtv')
call s:map_keybind('i', '<m-h>', '<esc>gTa')
call s:map_keybind('i', '<m-l>', '<esc>gta')

" map alt+shift+move 
call s:map_keybind('n', '<m-H>', '<cmd>tabm -1<cr>')
call s:map_keybind('n', '<m-L>', '<cmd>tabm +1<cr>')
call s:map_keybind('x', '<m-H>', '<cmd>tabm -1<cr>')
call s:map_keybind('x', '<m-L>', '<cmd>tabm +1<cr>')
call s:map_keybind('i', '<m-H>', '<cmd>tabm -1<cr>')
call s:map_keybind('i', '<m-L>', '<cmd>tabm +1<cr>')

" lsp bindings
call s:map_keybind('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
call s:map_keybind('n', '<leader>lx', '<cmd>lua vim.lsp.buf.references()<cr> " x for cross reference')
call s:map_keybind('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>')
call s:map_keybind('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>')

" map backspace in select mode to delete the currently selected word
call s:map_keybind('s', '<bs>', '_<bs>')

" map 'uh' to change the character under the cursor to upper case, and edit
" behind it
call s:map_keybind('n', '<leader>uh', 'gewg~li')

" map 'ur' to source vimrc
call s:map_keybind('n', '<leader>ur', '<cmd>source $MYVIMRC<cr>')

function RelativeEdit()
    return ":.,.+" .. a:count
endfunction

" map 'ue' to edit some local file
call s:map_keybind('n', '<leader>ue', '<cmd>call feedkeys(":e " .. expand("%:p:h") .. "/", "n")<cr>')

" map 'ud' to insert curly braces around an if statement
call s:map_keybind('n', '<leader>ud', 'mAg_a {<esc>jo}<esc>`A')

" map 'jq' to jump to the end of the curly braces
"call s:map_keybind('n', '<leader>jq', '$%zz')

" map 'ut' to fancy LaTeX shenanigans
call s:map_keybind('n', '<leader>ut', 'mA0i_<esc>dt&kyt&jPv0r<space>`A')
call s:map_keybind('n', '<leader>uT', 'mA0i_<esc>dt&jyt&kPv0r<space>`A')
"" map ; to comment the current line, and . to uncomment the line
"augroup CommentKeybinds
"    autocmd!
"    autocmd FileType cpp,c,rust,javascript,java silent call s:map_keybind('n', '<buffer>', '<leader>; mBI//<esc>`B')
"    autocmd FileType python,sh,bash             silent call s:map_keybind('n', '<buffer>', '<leader>; mBI#<esc>`B')
"    autocmd FileType vim                        silent call s:map_keybind('n', '<buffer>', '<leader>; mBI"<esc>`B')
"    autocmd FileType tex                        silent call s:map_keybind('n', '<buffer>', '<leader>; mBI%<esc>`B')
"    autocmd FileType s,asm                      silent call s:map_keybind('n', '<buffer>', '<leader>; mBI;<esc>`B')
"    autocmd FileType lua                        silent call s:map_keybind('n', '<buffer>', '<leader>; mBI--<esc>`B')
"    
"    autocmd FileType cpp,c,rust,javascript,java silent call s:map_keybind('n', '<buffer>', '<leader>. mB<cmd>s/^\(\s)\(\/\/\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B')
"    autocmd FileType python,sh,bash             silent call s:map_keybind('n', '<buffer>', '<leader>. mB<cmd>s/^\(\s)\(#\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B')
"    autocmd FileType vim                        silent call s:map_keybind('n', '<buffer>', '<leader>. mB<cmd>s/^\(\s)\("\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B')
"    autocmd FileType tex                        silent call s:map_keybind('n', '<buffer>', '<leader>. mB<cmd>s/^\(\s)\(%\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B')
"    autocmd FileType s,asm                      silent call s:map_keybind('n', '<buffer>', '<leader>. mB<cmd>s/^\(\s)\(;\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B')
"    autocmd FileType lua                        silent call s:map_keybind('n', '<buffer>', '<leader>. mB<cmd>s/^\(\s)\(--\)\?/\1<cr><cmd>noh<cr><cmd>echo<cr>`B')
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

nnoremap : <cmd>echo feedkeys(MultilineColon(v:count), "n")<cr>
nnoremap J <cmd>exec "norm! " .. (v:count+1) .. "J"<cr>

" map 'Make' commands
call s:map_keybind('n', '<leader>mr', '<cmd>Make run<cr>')
call s:map_keybind('n', '<leader>mc', '<cmd>Make! run<cr>')
call s:map_keybind('n', '<leader>mm', '<cmd>Make<cr>')
call s:map_keybind('n', '<leader>mb', '<cmd>Make!<cr>')
call s:map_keybind('n', '<leader>mv', '<cmd>Make view<cr>')
call s:map_keybind('n', '<leader>mw', '<cmd>Make! view<cr>')
call s:map_keybind('n', '<leader>mz', '<cmd>let old_session = get(g:, "tmux_session", "")<cr><cmd>let g:tmux_session = "detached"<cr><cmd>Make! view<cr><cmd>let g:tmux_session = old_session<cr>')
call s:map_keybind('n', '<leader>mt', '<cmd>Make test<cr>')
call s:map_keybind('n', '<leader>md', '<cmd>Make! test<cr>')
call s:map_keybind('n', '<leader>mg', '<cmd>Make clean<cr>')
call s:map_keybind('n', '<leader>mf', '<cmd>Make! clean<cr>')

" map Alt+. to insert a space in front of the cursor
call s:map_keybind('i', '<m-.>', '<space><esc>i')

" map Alt+a to jump to the next space
call s:map_keybind('i', '<m-a>', '<c-o>f<space>')

" map r+(Alt+p) to replace the current character with the clipboard
call s:map_keybind('n', 'r<m-p>', '"_xP')

" map Shift + horizontal movement to shift the screen
call s:map_keybind('n', 'L', 'zl')
call s:map_keybind('n', 'H', 'zh')

call s:map_keybind('n', 'cm', 'cw')

nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

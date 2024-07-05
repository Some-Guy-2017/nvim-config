set number          " line numbers
set relativenumber  " shows the relative line count from cursor
set shiftwidth=4    " about of whitespace to be added in normal mode (i.e. with < and > keys)
set softtabstop=4   " the amount of whitespace to be added in insert mode (i.e. with Tab and Backspace keys)
set tabstop=4       " width of the tab character
set expandtab       " use spaces instead of tabs
set ignorecase      " ignore case when tab-completing commands
set spelllang=en_us " set spell check language to U.S. English
set spell           " enable spell check
set nohlsearch
set nowrap
"set noshowmode

highlight Title guifg=#398abf
highlight Function guifg=#469484

let g:gutentags_cache_dir = "/home/joe/.tags/"

let g:lightline = {
    \ 'colorscheme': 'solarized'
    \}

"set foldmethod=expr " syntax based folding
"set foldexpr=nvim_treesitter#foldexpr()
"set foldminlines=1
"
"if &foldlevel == 0
"    set foldlevel=1
"endif

" stop :wq from writing and quitting, forcing :x instead 
cabbrev wq echo "use :x instead"

augroup Dispatch
    autocmd!
    autocmd Filetype java   let b:dispatch = "java %"
    autocmd Filetype python let b:dispatch = "python %"
    autocmd Filetype c      let b:dispatch = "gcc % -o dispatch.out && ./dispatch.out && rm -f ./dispatch.out"
    autocmd Filetype cpp    let b:dispatch = "g++ % -o dispatch.out && ./dispatch.out && rm -f ./dispatch.out"
    autocmd Filetype rust   let b:dispatch = "cargo run"
augroup end

"augroup DeleteEmpty
"    autocmd!
"    "autocmd BufHidden * if expand('<afile>') == "" | exec "bw " .. expand('<abuf>') | endif
"augroup end

"augroup RememberFolds
"    autocmd!
"    autocmd BufWinEnter * silent! loadview
"    autocmd BufWinLeave * silent! mkview
"augroup END

" see :h /magic
" also see :h /zero-width
" writing it so Function is a function - i.e. it is '^\s*START ' (zero width) + \w*
" \@<= matches preceding atom zero width 
" note that '\\' means one backspace, since we have to escape '\' as '\\'
" since its in a string; when its passed to matchadd(), it's interpreted
" as a single '\'.

let s:any_token = "\\S*"

function s:token(pattern)
    return s:look_behind("\\W|^") . a:pattern . s:look_ahead("\\W|$")
endfunction

function s:token_behind(pattern)
    return s:look_behind(s:token(a:pattern) . " ")
endfunction

function s:look_behind(pattern)
    return "(" . a:pattern . ")@<="
endfunction

function s:look_ahead(pattern)
    return "(" . a:pattern . ")@="
endfunction

function s:operator(keyword, pattern)
    return s:look_behind(s:token(a:keyword) . " .+ ") . s:token(a:pattern)
endfunction

function s:highlight_pseudocode()
    let b:matches = get(b:, "matches", [])
    
    call s:match_add("Keyword", s:token("[A-Z]+"))
    
    call s:match_add("Function", s:token_behind("(START|CALL)") . "[^( ]*")
    call s:match_add("Type", s:token_behind("CLASS") . s:token(s:any_token))
    call s:match_add("Number", s:token("-?[0-9]+"))
    call s:match_add("Identifier", s:token("true"))
    call s:match_add("Identifier", s:token("false"))
    call s:match_add("Identifier", s:token("return value"))
    
    call s:match_add("Operator", s:operator("(SET|APPEND|COMPARE|ADD|WRITE)", "to"))
    call s:match_add("Operator", s:operator("(GENERATE|READ|REMOVE|PARSE)", "from"))
    call s:match_add("Operator", s:operator("(CALL|INITIALIZE)", "with"))
    call s:match_add("Operator", s:operator("LET", "be"))
    call s:match_add("Operator", s:operator("FOR", "in"))
    call s:match_add("Operator", s:operator("IF", "(is|equals|does not equal|\\<|\\>)"))
    call s:match_add("Operator", s:operator("MULTIPLY", "by"))
    call s:match_add("Operator", s:operator("CONVERT", "into"))
    call s:match_add("Operator", s:token_behind(s:any_token) . "at")
    
    call s:match_add("String", "'[^']*'")
    call s:match_add("String", "\"[^\"]*\"")
    
    call s:match_add("Comment", "#.*")
    
endfunction

function s:match_add(group, pattern)
    let id = matchadd(a:group, "\\v" . a:pattern, -1)
    if id != -1
        call add(b:matches, id)
    endif
endfunction

function s:delete_matches()
    for match in get(b:, "matches", [])
        call matchdelete(match)

    endfor
    let b:matches = []
endfunction

augroup Pseudocode
    autocmd!
    autocmd BufEnter *.pscd silent set filetype=pseudocode
    autocmd BufLeave *.pscd silent set filetype&
    autocmd Filetype pseudocode call s:delete_matches() | call s:highlight_pseudocode()
augroup end

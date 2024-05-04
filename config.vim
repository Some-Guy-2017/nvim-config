set number          " line numbers
set relativenumber  " shows the relative line count from cursor
set shiftwidth=4    " about of whitespace to be added in normal mode (i.e. with < and > keys)
set softtabstop=4   " the amount of whitespace to be added in insert mode (i.e. with Tab and Backspace keys)
set tabstop=4       " width of the tab character
set expandtab       " use spaces instead of tabs
set ignorecase      " ignore case when tab-completing commands
set spelllang=en_us " set spell check language to U.S. English
set spell           " enable spell check

"set foldmethod=expr " syntax based folding
"set foldexpr=nvim_treesitter#foldexpr()
"set foldminlines=1
"
"if &foldlevel == 0
"    set foldlevel=1
"endif

command SpellHelp for item in ['Bad','Cap','Local','Rare']| exe "hi Spell".item| endfor

" stop :wq from writing and quitting, forcing :x instead 
cabbrev wq echo "use :x instead"

autocmd Filetype java   let b:dispatch = "java %"
autocmd Filetype python let b:dispatch = "python %"
autocmd Filetype c      let b:dispatch = "gcc % -o dispatch.out && ./dispatch.out && rm -f ./dispatch.out"
autocmd Filetype cpp    let b:dispatch = "g++ % -o dispatch.out && ./dispatch.out && rm -f ./dispatch.out"
autocmd Filetype rust   let b:dispatch = "cargo run"

autocmd BufLeave * if empty(expand('<abuf>')) | bw | endif

" see :h /magic
" also see :h /zero-width
" writing it so Function is a function - i.e. it is '^\s*START ' (zero width) + \w*
" \@<= matches preceding atom zero width 
" note that '\\' means one backspace, since we have to escape '\' as '\\'
" since its in a string; when its passed to matchadd(), it's interpreted
" as a single '\'.

let g:any_token = "\\S*"

function _Token(pattern)
    return _LookBehind("^|\\s") . a:pattern . _LookAhead("$|\\s")
endfunction

function _TokenBehind(pattern)
    return _LookBehind(_Token(a:pattern) . " ")
endfunction

function _LookBehind(pattern)
    return "(" . a:pattern . ")@<="
endfunction

function _LookAhead(pattern)
    return "(" . a:pattern . ")@="
endfunction

function _Operator(keyword, pattern)
    return _LookBehind(_Token(a:keyword) . " .+ ") . _Token(a:pattern)
endfunction

function _HighlightPseuocode()
    let b:matches = get(b:, "matches", [])
    
    call MatchAdd("Keyword", _Token("[A-Z]+"))
    
    call MatchAdd("Function", _TokenBehind("(START|CALL)") . _Token(g:any_token))
    call MatchAdd("Type", _TokenBehind("CLASS") . _Token(g:any_token))
    call MatchAdd("Number", _Token("[0-9]+"))
    
    call MatchAdd("Operator", _Operator("(SET|APPEND)", "to"))
    call MatchAdd("Operator", _Operator("LET", "be"))
    call MatchAdd("Operator", _Operator("CALL", "with"))
    call MatchAdd("Operator", _Operator("FOR", "in"))
    call MatchAdd("Operator", _Operator("REMOVE", "from"))
    call MatchAdd("Operator", _Operator("IF", "is"))
    call MatchAdd("Operator", _TokenBehind(g:any_token) . "at ")
    
    call MatchAdd("String", _Token("\".*\""))
endfunction

function MatchAdd(group, pattern)
    let id = matchadd(a:group, "\\v" . a:pattern, -1)
    if id != -1
        call add(b:matches, id)
    endif
endfunction

for match in get(b:, "matches", [])
    call matchdelete(match)
endfor
let b:matches = []

autocmd BufRead *.pscd call _HighlightPseuocode()

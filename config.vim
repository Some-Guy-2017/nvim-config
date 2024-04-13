set number          " line numbers
set relativenumber  " shows the relative line count from cursor
set shiftwidth=4    " about of whitespace to be added in normal mode (i.e. with < and > keys)
set softtabstop=4   " the amount of whitespace to be added in insert mode (i.e. with Tab and Backspace keys)
set tabstop=4       " width of the tab character
set expandtab       " use spaces instead of tabs
set ignorecase      " ignore case when tab-completing commands
set spelllang=en_us " set spell check language to U.S. English
set spell           " enable spell check
"set nowrap          " don't automatically wrap on multiline comments

command SpellHelp for item in ['Bad','Cap','Local','Rare']| exe "hi Spell".item| endfor

" stop :wq from writing and quitting, forcing :x instead 
cabbrev wq echo "use :x instead"

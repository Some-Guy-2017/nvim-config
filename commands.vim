function s:edit_path(path)
    tabnew
    execute 'edit' . fnameescape(a:path)
endfunction

function s:edit_file(file)
    call s:edit_path(a:file)
    tcd %:h
endfunction

function s:edit_dir(dir)
    call s:edit_path(a:dir)
    execute "tcd" . fnameescape(a:dir)
endfunction

function s:format_buffers()
    for buf in getbufinfo()
        bnext
        lua vim.lsp.buf.format({ async = false })
        "lua vim.lsp.buf.format({ bufnr: vim.b.buf.bufnr })
    endfor
endfunction
command! SpellUpdate    mkspell! /home/joe/.config/nvim/spell/en.utf-8.add
command! SpellEdit      silent call s:edit_file('/home/joe/.config/nvim/spell/en.utf-8.add')
command! SpellClean     runtime spell/cleanadd.vim | tabprevious
command! GenerateTags   silent !ctags .
command! DDispatch      Dispatch
command! DDispatchAsync Dispatch!
command! VViEdit        silent call s:edit_file($MYVIMRC)
command! GGrep          !grep --exclude-from=/home/joe/.grepignore --exclude-dir={build,.git} -rin <args>
command! Format         silent lua vim.lsp.buf.format()
command! JJava          !java %
command! TTexmfEdit     silent call s:edit_dir('/home/joe/texmf/')
"command! SpellHelp      for item in ['Bad','Cap','Local','Rare']| exe "hi Spell".item| endfor
command! VTexErrors     VimtexErrors
command! OpenDir        edit %:p:h
command! CWDHere        tcd %:p:h
command! FormatBuffers  call s:format_buffers()

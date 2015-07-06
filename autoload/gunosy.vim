let s:save_cpo = &cpo
set cpo&vim

let s:ruby_script_path = expand('<sfile>:h') . '/scripts/gunosy.rb'

function! gunosy#get_gunosy()
    if executable('ruby')
        new
        execute 'rubyfile ' . s:ruby_script_path
    else
        echoerr 'Command not found: ruby'
        echoerr 'Please install ruby'
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

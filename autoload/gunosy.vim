let s:save_cpo = &cpo
set cpo&vim

function! gunosy#get_gunosy()
"    let s:result =  system("")
"    new | s:result
    new | read !ruby ruby_scripts/gunosy.rb
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo




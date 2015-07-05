let s:save_cpo = &cpo
set cpo&vim

let s:ruby_script_path = expand('<sfile>:h') . '/../ruby_scripts/gunosy.rb'

function! gunosy#get_gunosy()
    new | execute 'read !ruby ' . s:ruby_script_path
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

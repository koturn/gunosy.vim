let s:save_cpo = &cpo
set cpo&vim

command! GetGunosy :call gunosy#get_gunosy()

let &cpo = s:save_cpo
unlet s:save_cpo




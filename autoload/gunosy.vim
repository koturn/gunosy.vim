let s:save_cpo = &cpo
set cpo&vim


let s:V = vital#of('gunosy')
let s:L = s:V.import('Data.List')
let s:HTTP = s:V.import('Web.HTTP')
let s:HTML = s:V.import('Web.HTML')

if executable('ruby')
    let s:ruby_script_path = expand('<sfile>:h') . '/scripts/gunosy.rb'
else
    let s:URL = 'https://gunosy.com/categories/7'
endif
let g:gunosy#use_ruby = get(g:, 'gunosy#use_ruby', has('ruby'))


function! gunosy#get_gunosy() abort
    if g:gunosy#use_ruby
        new | setlocal nobuflisted bufhidden=unload buftype=nofile
        execute 'rubyfile ' . s:ruby_script_path
    else
        let response = s:HTTP.get(s:URL)
        if response.status != 200
            echoerr 'Connection error:' '[' . response.status . ']' response.statusText
            return
        endif
        " Web.HTTP.parse() is strange: head includes body
        let nodes = s:xpath(s:HTML.parse(response.content), 'html/head/body/div/div/div/div/ul/li/div/dl/dt/a')
        new | setlocal nobuflisted bufhidden=unload buftype=nofile
        for node in nodes
            call append(line('$') - 1, node.attr.href)
            call append(line('$') - 1, node.child[0])
        endfor
        call cursor(1, 0)
    endif
endfunction


function! s:xpath(dom, xpath_str) abort
    let tags = split(a:xpath_str, '/')
    if a:dom.name !=# remove(tags, 0)
        return []
    endif
    let nodes = [a:dom]
    for tag in tags
        let nodes = filter(s:L.flatten(map(nodes, 'v:val.childNodes(tag)'), 1), '!empty(v:val)')
    endfor
    return nodes
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

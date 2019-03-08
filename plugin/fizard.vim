scriptencoding utf-8

if exists('g:loaded_fizard')
  finish
endif
let g:loaded_fizard = 1


let s:save_cpo = &cpo
set cpo&vim

vnoremap <C-c>h :call fizard#open_help()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

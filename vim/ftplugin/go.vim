" Vim filetype plugin file
" Language:	Go
" Maintainer:	David Barnett (https://github.com/google/vim-ft-go)
" Last Change:	2014 Aug 16

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

nnoremap <buffer> <F5> :wa<cr>:!go run %<cr>
nnoremap <buffer> <s-F5> :wa<cr>:!make clean main.go<cr>

setlocal formatoptions-=t

setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

let b:undo_ftplugin = 'setl fo< com< cms<'

" vim: sw=2 sts=2 et

set gfn=Lucida_Console:h9
set columns=190
set lines=49
set guioptions-=T
au GUIenter * simalt ~x
nnoremap + :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap - :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>
nmap <m-=> :set gfn=Lucida_Console:h7<cr>

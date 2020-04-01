source C:\Users\Shane\vim\_vimrc
set rnu
set nu
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
set makeprg=g++\ -o\ %<\ %
set undofile
set directory=C://users/Shane/vim/undos//
set undodir=C://users/Shane/vim/undos//
set backupdir=C://users/Shane/vim/undos//
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let mapleader = ' '
autocmd filetype python nmap <F5> :!py main.py<ENTER>
autocmd filetype c,cpp nmap <F5> :!make test<ENTER>
autocmd filetype javascript,css,html nmap <F5> :!index.html<ENTER>
nmap <leader>r <F5>
nmap <leader>q :wqa<ENTER>
nmap <leader>w :wa<ENTER>
map <leader>y "*y
map <leader>d "*d
map <leader>p "*p
map <leader>c "*c

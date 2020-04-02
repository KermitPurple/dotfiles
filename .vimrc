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
map <s-space> <leader>
autocmd filetype python nmap <F5> :!py main.py<ENTER>
autocmd filetype c,cpp nmap <F5> :!make test<ENTER>
autocmd filetype javascript,css,html nmap <F5> :!index.html<ENTER>
nmap <leader>r <F5>
nmap <leader>q :qa<ENTER>
nmap <leader>Q :q<ENTER>
nmap <leader>w :wa<ENTER>
nmap <leader>W :w<ENTER>
nmap <leader>x :xa<ENTER>
nmap <leader>X :x<ENTER>
nmap <leader>n :!start cmd<ENTER>
map <leader>y "*y
map <leader>d "*d
map <leader>p "*p
map <leader>c "*c
nmap <leader>h <c-w>h
nmap <leader>j <c-w>j
nmap <leader>k <c-w>k
nmap <leader>l <c-w>l
nmap <leader>- <c-w>-
nmap <leader>+ <c-w>+
nmap <leader>= <c-w>=
nmap <leader>< <c-w><
nmap <leader>> <c-w>>
nmap <leader>_ <c-w>_
nmap <leader><Bar> <c-w><Bar>
nmap <leader>5 :ls<ENTER>
nmap <leader>6 :bnext<ENTER>
nmap <leader>z zf%
nmap <leader>p zfip

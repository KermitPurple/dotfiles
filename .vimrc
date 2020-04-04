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
noremap <s-space> <leader>
autocmd filetype python nnoremap <F5> <leader>w:!py main.py<ENTER>
autocmd filetype c,cpp,h nnoremap <F5> <leader>w:!make test<ENTER>
autocmd filetype javascript,css,html nnoremap <F5> <leader>w:!index.html<ENTER>
nnoremap <leader>r <F5>
nnoremap <leader>q :qa<ENTER>
nnoremap <leader>Q :q<ENTER>
nnoremap <leader>w :wa<ENTER>
nnoremap <leader>W :w<ENTER>
nnoremap <leader>x :xa<ENTER>
nnoremap <leader>X :x<ENTER>
nnoremap <leader>n :!start cmd<ENTER>
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>d "*d
noremap <leader>D "*D
noremap <leader>p "*p
noremap <leader>P "*P
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>- <c-w>-
nnoremap <leader>+ <c-w>+
nnoremap <leader>= <c-w>=
nnoremap <leader>< <c-w><
nnoremap <leader>> <c-w>>
nnoremap <leader>_ <c-w>_
nnoremap <leader><Bar> <c-w><Bar>
nnoremap <leader>5 :ls<ENTER>
nnoremap <leader>6 :bnext<ENTER>
nnoremap <leader>i zfip
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>z :wqa!<enter>
nnoremap <leader>c :!start chrome<ENTER>
nnoremap <leader>cs <leader>c
nnoremap <leader>cg :!start https://github.com/KermitPurple?tab=repositories<ENTER>
nnoremap <leader>cd :!start https://devdocs.io/<ENTER>
nnoremap <leader>cy :!start https://youtube.com/<ENTER>
nnoremap <leader>cn :!start https://github.com/new<ENTER>

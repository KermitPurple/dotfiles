source C:\Users\Shane\vim\DefaultVimrc
color lord
set rnu
set nu
set nowrap
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
set makeprg=g++\ -o\ %<\ %
set undofile
set directory=C://users/Shane/vim/undos//
set undodir=C://users/Shane/vim/undos//
set backupdir=C://users/Shane/vim/undos//
let mapleader = ' '
nmap <s-space> <leader>
nnoremap <leader>r <c-w>r
nnoremap <leader>q :wqa<ENTER>
nnoremap <leader>Q :wq<ENTER>
nnoremap <leader>w :wa<ENTER>
nnoremap <leader>W :w<ENTER>
nnoremap <leader>n :!start cmd<ENTER>
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>d "*d
noremap <leader>D "*D
noremap <leader>p "*p
noremap <leader>P "*P
nnoremap <leader>s <c-w>s
nnoremap <leader>v <c-w>v
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
nnoremap <leader>z :qa!<enter>
nnoremap <leader>a :q!<enter>
nnoremap <leader>c :!start chrome<ENTER>
nnoremap <leader>cg :!start https://github.com/KermitPurple?tab=repositories<ENTER>
nnoremap <leader>cd :!start https://devdocs.io/<ENTER>
nnoremap <leader>cy :!start https://youtube.com/<ENTER>
nnoremap <leader>cn :!start https://github.com/new<ENTER>
nmap <leader>m <leader>w:sleep 250ms<ENTER><leader>n:sleep 250ms<ENTER><leader>q
call plug#begin('C:\users\shane\Vim\plugged\')
Plug 'https://github.com/thiagoalessio/rainbow_levels.vim'
Plug 'https://github.com/luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'https://github.com/gko/vim-coloresque'
Plug 'tomtom/tcomment_vim'
call plug#end()
let g:rainbow_active = 1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
autocmd BufWinEnter * silent set tabstop=4 noexpandtab shiftwidth=4
nnoremap <leader><tab> :RainbowLevelsToggle<enter>
nnoremap <leader>] :RainbowToggle<enter>
nnoremap <leader>b :ls<enter>
nnoremap <leader>bn :bnext<enter>
nnoremap <leader>bN :bprev<enter>
nnoremap <left> 2<c-w><
nnoremap <right> 2<c-w>>
nnoremap <up> 2<c-w>+
nnoremap <down> 2<c-w>-
nnoremap <leader>t :NERDTreeToggle<enter>
nnoremap ; :
nnoremap <leader>g :tabnew<enter>
map <leader><leader> gc
nmap <leader><leader><leader> gcc

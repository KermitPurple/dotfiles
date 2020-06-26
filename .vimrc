source C:\Users\Shane\vim\DefaultVimrc
set nocp
color lord
set rnu
set nu
set nowrap
set bri
set fo-=tcq
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
set makeprg=g++\ -o\ %<\ %
set undofile
set directory=C://users/Shane/vim/undos//
set undodir=C://users/Shane/vim/undos//
set backupdir=C://users/Shane/vim/undos//
set complete+=kspell
set completeopt=menu,preview,menuone
set shortmess+=c
let mapleader = ' '
nmap <s-space> <leader>
nnoremap <leader>r <c-w>r
nnoremap <leader>q :wqa<ENTER>
nnoremap <leader>Q :wq<ENTER>
nnoremap <leader>w :wa<ENTER>
nnoremap <leader>W :w<ENTER>
nnoremap <leader>n :silent !start cmd<ENTER>
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
nnoremap <leader>i gg=G<c-o><c-o>
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
Plug 'https://github.com/luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'https://github.com/gko/vim-coloresque'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/AutoComplPop'
call plug#end()
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 40
let g:indent_guides_default_mapping = 0
set tabstop=4 
set expandtab 
set shiftwidth=4 
set softtabstop=4
nnoremap <leader>] :RainbowToggle<enter>
nnoremap <leader>b :ls<enter>
nnoremap <leader>bb :ls<enter>
nnoremap <leader>bn :bnext<enter>
nnoremap <leader>bN :bprev<enter>
nnoremap <leader>bd :bd<enter>
nnoremap <leader>b1 :b1<enter>
nnoremap <leader>b2 :b2<enter>
nnoremap <leader>b3 :b3<enter>
nnoremap <leader>b4 :b4<enter>
nnoremap <leader>b5 :b5<enter>
nnoremap <leader>b6 :b6<enter>
nnoremap <leader>b7 :b7<enter>
nnoremap <leader>b8 :b8<enter>
nnoremap <leader>b9 :b9<enter>
nnoremap <left> 2<c-w><
nnoremap <right> 2<c-w>>
nnoremap <up> 2<c-w>+
nnoremap <down> 2<c-w>-
nnoremap <leader>t :NERDTreeToggle<enter>
nnoremap ; :
nnoremap <leader>g :tabnew<enter>
map <leader><leader> gc
nmap <leader><leader><leader> gcc
nnoremap <f2> :silent source C:\users\shane\vim\.vimrc<enter>
nnoremap <leader>; :ter<cr>
nnoremap <leader>: :vert ter<cr>

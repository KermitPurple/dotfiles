" Shane McDonough minimal vimrc
syntax on " make sure syntax highlighting is on
set hlsearch
set relativenumber
set number
set nowrap
set breakindent " wrapped lines are visually indented
set incsearch " show pattern while typing in search
set autoindent " automatically go to the correct indentation
" Tab stuff
set expandtab " spaces instead of tabs
set tabstop=4 " number of spaces used in a tab
set shiftwidth=4  " number of spaces for indentation
set softtabstop=4 " number of spaces used in a tab while editing
" binds
let mapleader = ' '
nmap <s-space> <leader>
nmap <F5> <leader>e
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>d "*d
noremap <leader>D "*D
noremap <leader>p "*p
noremap <leader>P "*P
nnoremap <leader>e :!%:p<CR>
nnoremap <leader>E :!chmod +x %<CR><CR>
nnoremap <leader>r :%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>R :bufdo %s/\<<c-r><c-w>\>//g \|up<left><left><left><left><left><left>
nnoremap <leader>q :wqa<cr>
nnoremap <leader>Q :wq<cr>
nnoremap <leader>w :wa<cr>
nnoremap <leader>W :w<cr>
nnoremap <leader>z :qa!<cr>
nnoremap <leader>a :q!<cr>
" Make stuff
nnoremap <leader>m :!make <cr>
nnoremap <leader>mn :!make 
nnoremap <leader>mt :!make test<cr>
nnoremap <leader>mc :!make clean<cr>
nnoremap <leader>mct :!make clean test<cr>
" buffer stuff
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bl :ls<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bN :bprev<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>b1 :b1<cr>
nnoremap <leader>b2 :b2<cr>
nnoremap <leader>b3 :b3<cr>
nnoremap <leader>b4 :b4<cr>
nnoremap <leader>b5 :b5<cr>
nnoremap <leader>b6 :b6<cr>
nnoremap <leader>b7 :b7<cr>
nnoremap <leader>b8 :b8<cr>
nnoremap <leader>b9 :b9<cr>
" change size of window
nnoremap <left> 2<c-w><
nnoremap <right> 2<c-w>>
nnoremap <up> 2<c-w>+
nnoremap <down> 2<c-w>-
" clipboard stuff
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>d "*d
noremap <leader>D "*D
noremap <leader>p "*p
noremap <leader>P "*P

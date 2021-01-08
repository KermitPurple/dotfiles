source C:\Users\Shane\vim\DefaultVimrc
color lord
set encoding=utf-8
set nocp
set rnu
set nu
set nowrap
set bri
set fo-=tcq
set makeprg=g++\ -o\ %<\ %
set undofile
set directory=C://users/Shane/vim/undos//
set undodir=C://users/Shane/vim/undos//
set backupdir=C://users/Shane/vim/undos//
set complete+=kspell
set completeopt=menu,preview,menuone
set shortmess+=c
set tabstop=4 
set expandtab 
set shiftwidth=4 
set softtabstop=4
let mapleader = ' '
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
nmap <s-space> <leader>
nnoremap <leader>r :%s/\<<c-r><c-w>\>//g<left><left>
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
nmap <leader>N <leader>w:sleep 250ms<ENTER><leader>n:sleep 250ms<ENTER><leader>q
nnoremap <leader>m :!make <cr><cr>
nnoremap <leader>mt :!make test<cr><cr>
nnoremap <leader>mc :!make clean<cr><cr>
nnoremap <leader>mcG :!make clean test<cr><cr>
nnoremap <leader>M :!start make <cr><cr>
nnoremap <leader>Mt :!start make<cr><cr>
nnoremap <leader>Mc :!start make clean<cr><cr>
nnoremap <leader>Mct :!start make clean test<cr><cr>
nmap <leader>i <plug>(YCMHover)
nnoremap <leader>gg :YcmCompleter GoTo<cr>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gi :YcmCompleter GoToInclude<cr>
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
nnoremap <leader>T :tabnew<enter>
map <leader><leader> gc
nmap <leader><leader><leader> gcc
nnoremap <f2> :silent source C:\users\shane\vim\.vimrc \| execute "setlocal ft=".&ft <CR>
nnoremap <leader>; :ter<cr>
nnoremap <leader>: :vert ter<cr>
nnoremap <leader>f :Startify<cr>
call plug#begin('C:\users\shane\Vim\plugged\')
Plug 'https://github.com/luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-startify'
Plug 'ycm-core/YouCompleteMe'
call plug#end()
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 40
let g:indent_guides_default_mapping = 0
let g:python_highlight_all = 1
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 1
let g:indent_guides_auto_colors = 0
let g:ascii_art_header = [
            \ '*---------------------------------------------------------------------------------*',
            \ '|  ____          ____                 ____           ____      _                  |',
            \ '| | __ )  ___   / ___| __ _ _   _    |  _ \  ___    / ___|_ __(_)_ __ ___   ___   |',
            \ '| |  _ \ / _ \ | |  _ / _` | | | |   | | | |/ _ \  | |   | ''__| | ''_ ` _ \ / _ \  |',
            \ '| | |_) |  __/ | |_| | (_| | |_| |_  | |_| | (_) | | |___| |  | | | | | | |  __/_ |',
            \ '| |____/ \___|  \____|\__,_|\__, (_) |____/ \___/   \____|_|  |_|_| |_| |_|\___(_)|',
            \ '|                           |___/                                                 |',
            \ '*---------------------------------------------------------------------------------*',
            \]
let g:startify_custom_header = 'startify#pad(g:ascii_art_header + startify#fortune#boxed())'
let g:startify_custom_footer = ['Also you''re gay!']
let g:startify_bookmarks = [
            \ {'r': 'C:\Users\Shane\Vim\.vimrc'},
            \ ]
let g:startify_commands = [
            \ {'n': ['Open NERDTree', 'NERDTree']},
            \ {'c': ['change to C++ Directory', 'cd C:\Users\Shane\Desktop\Coding\c++\']},
            \ {'p': ['change to Python Directory', 'cd C:\Users\Shane\Desktop\Coding\python\']},
            \ {'w': ['change to Web Directory', 'cd C:\Users\Shane\Desktop\Coding\web\']},
            \ {'R': ['change to Rust Directory', 'cd C:\Users\Shane\Desktop\Coding\rust\']},
            \ {'T': ['change to temp Directory', 'cd C:\Users\Shane\Desktop\Coding\temp\']},
            \ {'S': ['change to School Directory', 'cd C:\Users\Shane\Dropbox\School\fall2020\']},
            \ {'o': ['Open current Directory', 'e .']},
            \ ]
let g:ycm_autoclose_preview_window_after_completion = 1 " close preview window automatically
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = 'C:\Users\Shane\Vim\.ycm_extra_conf.py' " not working for whatever reason
let g:ycm_confirm_extra_conf = 0 " don't have to confirm ycm conf
let g:tex_flavor = "latex"

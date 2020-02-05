source C:\Users\Shane\vim\_vimrc
set rnu
set nu
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
color elflord
set makeprg=g++\ -o\ %<\ %
set undofile
set directory=C://users/Shane/vim/undos//
set undodir=C://users/Shane/vim/undos//
set backupdir=C://users/Shane/vim/undos//
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

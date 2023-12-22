source ~/.vim/minimal.vim
color molokai
set encoding=utf-8
set fo-=tcq
set undofile
set complete+=kspell
set completeopt=menu,preview,menuone
set shortmess+=c
set timeoutlen=1000
set ttimeoutlen=5
set notermguicolors " TODO: Decide if this is good or not
au BufWinLeave ?* mkview
au BufWinEnter ?* silent! loadview
" in dotfiles/scripts
nnoremap <leader>n :!new_window<cr><cr>
" in dotfiles/scripts
nnoremap <leader>N :!new_tab<cr><cr>
" in dotfiles/scripts
nnoremap <leader>l :!new_tab live-server<cr><cr>
" https://gist.github.com/bignimbus/1da46a18416da4119778
" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:~')
    if len(titleString) > 0
        let &titlestring = expand('%:~')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()
" Commands for changing ts cleanly
command FixIG IndentGuidesDisable | IndentGuidesEnable
command -nargs=1 SetTS let &ts=<args> | FixIG
" https://hamberg.no/erlend/posts/2014-03-09-change-vim-cursor-in-iterm.html 
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

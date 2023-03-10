" Shane McDonough minimal vimrc
syntax on " make sure syntax highlighting is on
filetype plugin indent on " Auto indent and other file type stuff works
set nocp " should be first most of the time
set hlsearch " highlight texting after searching using "/"
set nowrap " don't wrap when text overflows off screen
set breakindent " wrapped lines are visually indented
set incsearch " show pattern while typing in search
set autoindent " automatically go to the correct indentation
set backspace=indent,eol,start " backspace over indent eol and start
set showcmd " show partial command in bottom right
" Tab stuff
set noexpandtab " tabs instead of spaces
set tabstop=4 " number of spaces used in a tab
set shiftwidth=0  " number of spaces for indentation (0 means use tabstop)
set softtabstop=0 " number of spaces used in a tab while editing
let g:python_recommended_style = 0 " don't change my formatting in python
let g:rust_recommended_style = 0 " don't change my formatting in rust
" line numbers
set relativenumber
set number
"folds
set foldmethod=manual " not using expr because it's actually too slow in practice
set foldexpr=CurlyLevel()
" mouse
set mouse=a " enable mouse on all modes
" binds
let mapleader = ' '
nmap <s-space> <leader>
" executing
nmap <F5> <leader>e
nnoremap <leader>e :!"%:p"<CR>
nnoremap <leader>E :!chmod +x "%"<CR><CR>
" Replacing
nnoremap <leader>r :%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>R :bufdo %s/\<<c-r><c-w>\>//g \|up<left><left><left><left><left><left>
" Saving and quitting
nnoremap <leader>q :wqa<cr>
nnoremap <leader>Q :wq<cr>
nnoremap <leader>w :wa<cr>
nnoremap <leader>W :w<cr>
nnoremap <leader>a :q!<cr>
" Make stuff
nnoremap <leader>m :!make <cr>
nnoremap <leader>mn :!make 
nnoremap <leader>mt :!make test<cr>
nnoremap <leader>mc :!make clean<cr>
nnoremap <leader>mct :!make clean test<cr>
" buffer stuff
" overwritten in big vimrc
nnoremap <leader>b :ls<cr>
" overwritten in big vimrc
nnoremap <leader>bb :ls<cr>
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
" tabs
nnoremap <leader>T :tabnew<cr>
" System Clipboard stuff
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>d "*d
noremap <leader>D "*D
noremap <leader>p "*p
noremap <leader>P "*P
" Terminal stuff
noremap <leader>: :term<cr>
noremap <leader>; :vert term<cr>
" moving lines one up or one down
noremap <c-k> :m.-2<cr>
noremap <c-j> :m.+1<cr>
" folds
nnoremap <leader>z :let temp = &fdm \| set fdm=expr <cr> :let &fdm = temp <cr>
nnoremap <leader>Z zE

" Load the man plugin
runtime ftplugin/man.vim

" fold function
function! CurlyLevel() 
    let pat = '\([^''"`]\|"[^"]*"\|''[^'']*''\|`[^`]`\)*[''"]\@!$'
    let line = getline(v:lnum)
    " count number of valid lparens
    let lcurlys = 1
    while match(line, '{' .. pat, 0, lcurlys) >= 0
        let lcurlys += 1
    endwhile
    let lcurlys -= 1
    " count number of valid rparens
    let rcurlys = 1
    while match(line, '}' .. pat, 0, rcurlys) >= 0
        let rcurlys += 1
    endwhile
    let rcurlys -= 1
    " calculate fold
    let diff = lcurlys - rcurlys
    if diff > 0
        return "a" .. diff
    elseif diff < 0
        return "s" .. -diff
    endif
    return "="
endfunction

" Align regex
" https://vim.fandom.com/wiki/Regex-based_text_alignment
command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction

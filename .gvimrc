set columns=170
set lines=40
function RainToggleIfFt()
	if &ft == 'nerdtree' || &ft == 'vim' || &ft == 'help'
		RainbowLevelsOff	
	else
		RainbowLevelsOn
	endif
endfunction
"autocmd BufEnter,WinEnter * call RainToggleIfFt()
autocmd BufWinEnter *.html,*.css,*.js,*.h,*.py,*.cpp,*.c,*.rs silent RainbowLevelsOn
autocmd BufWinLeave * silent RainbowLevelsOff

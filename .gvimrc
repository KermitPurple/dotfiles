set columns=170
set lines=40
function RainToggleIfFt()
	if &ft == 'nerdtree' || &ft == 'vim' || &ft == 'help'
		RainbowLevelsOff	
	else
		RainbowLevelsOn
	endif
endfunction
autocmd BufReadPost * call RainToggleIfFt()
autocmd BufWinLeave * silent RainbowLevelsOff

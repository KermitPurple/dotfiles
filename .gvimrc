set columns=170
set lines=40
autocmd BufWinEnter *.html,*.css,*.js,*.h,*.py,*.cpp,*.c,*.rs silent RainbowLevelsOn
autocmd BufWinLeave * silent RainbowLevelsOff

# git@github.com:kermitpurple/rename_all
# built with:
# cargo build --release
alias rna="$CODING_DIR/rust/rename_all/target/release/rename_all"

# git@github.com:KermitPurple/ConwaysGameOfLifeCpp.git
# built with:
# make clean all TARGET=bin/conway
alias conway="silent_bg $CODING_DIR/c++/ConwaysGameOfLifeCpp/bin/conway"

# git@github.com:KermitPurple/TesseractV2.git
# built with:
# make release
alias tess="open -a XQuartz&&\
sleep 1&&\
export DISPLAY=:0&&\
silent_bg $CODING_DIR/c++/TesseractV2/bin/tess"

# git@github.com:KermitPurple/raylib_fib.git
# built with:
# make clean all TARGET=bin/fib
alias fib="silent_bg $CODING_DIR/c++/fib/bin/fib"

# make a java project and run it in temp folder
alias java_make="javac *.java -d \"$TEMP_DIR\" && java -cp \"$TEMP_DIR\""

# make a c++ project and run it in temp folder
alias c++_make="clang++ */*.cpp -Iinclude -o\"$TEMP_DIR/test\" && \"$TEMP_DIR/test\""

# reload the zshrc
alias refresh=". ~/.zshrc"

# git@github.com:KermitPurple/DrawShapes.git
# shape drawing program
alias shapes="silent_bg $CODING_DIR/c++/shapes/bin/shapes"

# show nerd coding welcome screen
# reqs:
#     new_window - in this funcs.zsh
#     rain - in this funcs.zsh
#     cowsay - brew install cowsay
#     lolcat - brew install lolcat
#     neofetch - brew install neofetch
alias welcome="new_window \"clear && neofetch\" && new_window rain && clear && figlet \"Welcome Shane!\" | cowsay -n -fdragon | lolcat"

# git@github.com:KermitPurple/roll_dice_py.git
# dice roll function
alias roll="/Users/shane/coding/python/dice/main.py"

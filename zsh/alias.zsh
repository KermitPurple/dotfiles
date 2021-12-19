# Make a new project using a python script
# https:/github.com/kermitpurple/AutoProj
alias new="$CODING_DIR/python/AutoProj/main.py"

# built with:
# cargo build --release
alias rna="$CODING_DIR/rust/rename_all/target/release/rename_all"

# built with:
# make clean all TARGET=bin/conway
alias conway="silent_bg $CODING_DIR/c++/ConwaysGameOfLifeCpp/bin/conway"

# built with:
# make release
alias tess="open -a XQuartz&&\
sleep 1&&\
export DISPLAY=:0&&\
silent_bg $CODING_DIR/c++/TesseractV2/bin/tess"

# built with:
# make clean all TARGET=bin/fib
alias fib="silent_bg $CODING_DIR/c++/fib/bin/fib"

# make a java project and run it in temp folder
alias java_make="javac *.java -d \"$TEMP_DIR\" && java -cp \"$TEMP_DIR\""

# make a c++ project and run it in temp folder
alias c++_make="clang++ */*.cpp -Iinclude -o\"$TEMP_DIR/test\" && \"$TEMP_DIR/test\""

# reload the zshrc
alias refresh=". ~/.zshrc"

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

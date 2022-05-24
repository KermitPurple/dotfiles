# Aliases

# repo: git@github.com:kermitpurple/rename_all
# dir: $CODING_DIR/rust/rename_all
# build: cargo build --release
alias rna="$CODING_DIR/rust/rename_all/target/release/rename_all"

# repo: git@github.com:KermitPurple/ConwaysGameOfLifeCpp.git
# dir: $CODING_DIR/c++/ConwaysGameOfLifeCpp
# branch: mac
# build: make all TARGET=bin/conway
alias conway="silent_bg $CODING_DIR/c++/ConwaysGameOfLifeCpp/bin/conway"

# repo: git@github.com:KermitPurple/TesseractV2.git
# dir: $CODING_DIR/c++/TesseractV2
# branch: mac
# build: make release
alias tess="open -a XQuartz&&\
sleep 1&&\
export DISPLAY=:0&&\
silent_bg $CODING_DIR/c++/TesseractV2/bin/tess"

# repo: git@github.com:KermitPurple/raylib_fib.git
# dir: $CODING_DIR/c++/fib
# build: make clean all TARGET=bin/fib
alias fib="silent_bg $CODING_DIR/c++/fib/bin/fib"

# repo: git@github.com:KermitPurple/ggez_fib.git
# dir: $CODING_DIR/rust/ggez_fib
# build: cargo build --release
alias rfib="silent_bg $CODING_DIR/rust/ggez_fib/target/release/ggez_fib"

# make a java project and run it in temp folder
alias java_make="javac *.java -d \"$TEMP_DIR\" && java -cp \"$TEMP_DIR\""

# make a c++ project and run it in temp folder
alias c++_make="clang++ */*.cpp -Iinclude -o\"$TEMP_DIR/test\" && \"$TEMP_DIR/test\""

# reload the zshrc
alias refresh=". ~/.zshrc"

# repo: git@github.com:KermitPurple/DrawShapes.git
# dir: $CODING_DIR/c++/shapes
# build: make release
# branch: mac
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

# show an ascii digitial clock
# reqs:
#     figlet - brew install figlet
#     toilet - brew install toilet
#     watch - brew install watch
alias aclock="watch -n1 --color \"date '+%D%n%T' | toilet -f bigmono12 -F border --gay\""

# repo: git@github.com:KermitPurple/roll_dice_py.git
# dir: $CODING_DIR/python/dice
# dice roll function
alias roll="$CODING_DIR/python/dice/main.py"

# repo: git@github.com:KermitPurple/cnake.git
# dir: $CODING_DIR/c++/cnake
# build: make TARGET=bin/cnake
# snake game written in c
alias cnake="$CODING_DIR/c++/cnake/bin/cnake"

# default ls to with color
alias ls="ls --color=auto"

# default grep to with color
alias grep="grep --color=auto"

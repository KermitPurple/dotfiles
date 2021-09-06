set_prompt(){ # function that loads the prompt with git info
    # Load version control information
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git svn
    precmd()vcs_info

    # Format the vcs_info_msg_0_ variable
    zstyle ':vcs_info:git:*' formats '%F{red}on %B%b%f '

    #Set the prompt to the 
    setopt prompt_subst
    PROMPT='%F{magenta}%~%f ${vcs_info_msg_0_}%b%# '
}
set_prompt #Immediately call the function

# directory movement functions
school()cd ~/dropbox/school/fall2021/$1
c()cd ~/coding/c++/$1
rust()cd ~/coding/rust/$1
pyth()cd ~/coding/python/$1
j()cd ~/coding/java/$1
web()cd ~/coding/web/$1
z()cd ~/coding/zsh/$1

# open a new tab in iterm
# first arg is a path [optional]
# other args are the command passed to the terminal
# https://gist.github.com/vyder/96891b93f515cb4ac559e9132e1c9086
new_tab(){
    local cmd=""
    local dir="$PWD"
    local args="$@"
    if [ -d "$1" ]; then # if the first argument is a file
        dir="$1"
        args="${@:2}"
    fi
    if [ -n "$args" ]; then
        cmd="; $args"
    fi
    osascript -e\
"tell application \"iterm2\"
    tell current window
        set newTab to (create tab with default profile)
        tell current session of newTab
            write text \"cd $dir$cmd\"
        end tell
    end tell
end tell"
}

# open a new tab in iterm
# first arg is a path [optional]
# other args are the command passed to the terminal
# https://gist.github.com/vyder/96891b93f515cb4ac559e9132e1c9086
new_window(){
    local cmd=""
    local dir="$PWD"
    local args="$@"
    if [ -d "$1" ]; then # if the first argument is a file
        dir="$1"
        args="${@:2}"
    fi
    if [ -n "$args" ]; then
        cmd="; $args"
    fi
    osascript -e\
"tell application \"iterm2\"
    set newWin to (create window with default profile)
    tell current session of newWin
        write text \"cd $dir$cmd\"
    end tell
end tell"
}

# run the arguments to this
silent_bg(){
    if [[ $# -le 1 ]]; then # if there is less than one argument
        print "Invalid number of arguments: $#"
        return 1
    fi
    setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
    "$@" 2>&1 > /dev/null & disown
}

# Make a new project using a python script
# https:/github.com/kermitpurple/AutoProj
new()~/coding/python/AutoProj/main.py $@

# Open chrome with args
chrome()open -a "Google Chrome" $@

# built with:
# make clean test TARGET=bin/conway
alias conway="silent_bg ~/coding/c++/ConwaysGameOfLifeCpp/bin/conway"
# built with:
# make clean all TARGET=bin/fib
alias fib="silent_bg ~/coding/c++/fib/bin/fib"

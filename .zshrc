# Load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{red}on %B%b%f '

setopt prompt_subst
PROMPT='%F{magenta}%~%f ${vcs_info_msg_0_}%b%# '

school(){cd ~/dropbox/school/fall2021/$1}

c(){cd ~/coding/c++/$1}

rust(){cd ~/coding/rust/$1}

pyth(){cd ~/coding/python/$1}

j(){cd ~/coding/java/$1}

web(){cd ~/coding/web/$1}

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

# Make a new project using a python script
# https:/github.com/kermitpurple/AutoProj
new(){~/coding/python/AutoProj/main.py $@}

silent_bg(){
    setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
    "$@" &
}

alias conway="silent_bg ~/coding/c++/ConwaysGameOfLifeCpp/bin/test"

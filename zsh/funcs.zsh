# function that loads the prompt with git info
set_prompt(){
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

# directory movement functions
dotfiles()cd "$DOTFILES_DIR/$*"
school()cd "$SCHOOL_DIR/$*"
temp()cd "$TEMP_DIR/$*"
rust()cd "$CODING_DIR/rust/$*"
pyth()cd "$CODING_DIR/python/$*"
web()cd "$CODING_DIR/web/$*"
c()cd "$CODING_DIR/c++/$*"
j()cd "$CODING_DIR/java/$*"
z()cd "$CODING_DIR/zsh/$*"

# fd - cd to selected directory
# http://sourabhbajaj.com/mac-setup/iTerm/fzf.html
fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

# open a new tab in iterm
# first arg is a path [optional]
# other args are the command passed to the terminal
# https://gist.github.com/vyder/96891b93f515cb4ac559e9132e1c9086
# does nothing if not terminal not open
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
            write text \"cd '$dir'$cmd\"
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
    if [[ `osascript -e "return application \"Iterm\" is running"` = "false" ]]; then
        open -aIterm
    else
        osascript -e\
"tell application \"iterm2\"
    set newWin to (create window with default profile)
    tell current session of newWin
        write text \"cd '$dir'$cmd\"
    end tell
end tell"
    fi
}

# run the arguments to this
silent_bg(){
    if [[ $# -lt 1 ]]; then # if there is less than one argument
        print "Invalid number of arguments: $#"
        return 1
    fi
    setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
    ("$@" 2>&1 > /dev/null & disown) 2> /dev/null
    return 0
}

# play pygame snake
snake()(
    cd "$CODING_DIR/python/PygameSnake"
    . venv/bin/activate
    silent_bg ./pysnake.py
)

# play pygame tetris
tetris()(
    cd "$CODING_DIR/python/PyTetrisV2"
    . venv/bin/activate
    silent_bg ./pytetris.py
)

# open pygame graphing app
graph()(
    cd "$CODING_DIR/python/graphs"
    . venv/bin/activate
    ./interactive.py
)

# calls new alias then exits
newe(){new "$@"&&exit}

# clock in/ clock out; timeclock
clock()(
    cd "$CODING_DIR/python/punchclock"
    ./punchclock.py "$@"
)

# encode url
encode_url(){
    python3 -c "import urllib.parse as p; print(p.quote_plus('$*'))"
}

# decode url
decode_url(){
    python3 -c "import urllib.parse as p; print(p.unquote_plus('$*'))"
}

# open wolfram alpha with search string
walpha(){
    local search="$*"
    if [ "$search" =  "" ]; then
        vared -c -p "Enter something to evaluate: " search
    fi
    chrome "https://www.wolframalpha.com/input/?i=`encode_url "$search"`"
}

# open paint application
# https://github.com/kermitpurple/pypaint
paint()(
    local dir="$CODING_DIR/python/PyPaint"
    . "$dir/venv/bin/activate"
    silent_bg "$dir/pypaint.py"
)

# create a new virtual environment using virtualenv
newenv(){
    local env_name="$1" # set environment name to first arg
    local requirements="requirements.txt"
    if [[ -z "$1" ]]; then # if arg is empty
        env_name="venv" # set environment name to venv
    fi
    if [[ -n "$2" ]]; then # if second arg isn't empty
        requirements="$2" # set the requirements file to the second arg
    fi
    if [[ -d "$env_name" ]]; then # if folder exists
        echo "A folder named \"$env_name\" already exists"
        response=""
        while [[ "$response" != 'y' && "$response" != 'n' && "$response" != 'yes' && "$response" != 'no' ]]; do
            vared -c -p "Do you want to create a new one? " response
        done
        if [[ "$response" = 'y' || "$response" = 'yes' ]]; then
            rm -rf venv
        else
            return 1
        fi
    fi
    virtualenv "$env_name" # create it
    . "$env_name/bin/activate"
    if [[ -a "$requirements" ]]; then
        pip3 install -r "$requirements"
    fi
}

# show code rain
rain()(
    cd "$CODING_DIR/python/PyRain"
    . venv/bin/activate
    ./main.py
)

#get a random picture of a dog
show_dog(){
    local image_url=`curl -s 'https://dog.ceo/api/breeds/image/random' |
        sed 's/.*"message":"\([^"]*\)".*/\1/;s/\\\\\//\//g'`
    local image_path="$TMPDIR/dog.jpg"
    curl -s "$image_url" -o "$image_path"
    open "$image_path"
}

# scrape https://kermitpurple.github.io/ to get current sites
my_sites(){
    local url=https://kermitpurple.github.io/
    local sites=`curl -s "$url" |
        sed '/site-link link/!d;s/.*href="\([^"]*\)" class="site-link link">\([^<]*\)<.*/\1    \2/g;'`
    local lines=("${(f)sites}")
    local links=()
    local i="1"
    for line in $lines; do
        line=("${(@s/    /)line}")
        links[$i]="$line[1]"
        printf "[%2d] %s\n" "$i" "$line[2]"
        ((i+=1))
    done
    vared -c -p "Enter a number: " input
    chrome "$links[$input]"
}

# fzf all apps
apps(){
    local app=`find /Applications /System/Applications /System/Library/CoreServices /System/Applications/Utilities -maxdepth 1 -name "*.app" | fzf`
    if [ -z "$app" ]; then # no app chosen
        return 1
    fi
    open -a "$app"
}

# search for something on google and open it in chrome
google(){
    local search="$*"
    if [ "$search" =  "" ]; then
        vared -c -p "enter something to search: " search
    fi
    chrome "https://www.google.com/search?q=`encode_url \"$search\"`"
}

img2ascii()(
    local dir="$CODING_DIR/python/image_to_ascii"
    . "$dir/venv/bin/activate"
    $dir/img2ascii.py $*
)

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

# Make a new project using a python script
# https:/github.com/kermitpurple/AutoProj
new()(
    cd $CODING_DIR/python/AutoProj
    . venv/bin/activate
    ./main.py $*
)

# calls new function then exits
newe(){new "$@"&&exit}

# clock in/ clock out; timeclock
clock()(
    cd "$CODING_DIR/python/punchclock"
    ./punchclock.py "$@"
)

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
    local i=1
    for line in $lines; do
        line=("${(@s/    /)line}")
        links[$i]="$line[1]"
        printf "[%2d] %s\n" "$i" "$line[2]"
        ((i+=1))
    done
    local input=""
    vared -p "Enter a number: " input
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

# convert an image to ascii text
# https://github.com/KermitPurple/pypaint
img2ascii()(
    local dir="$CODING_DIR/python/image_to_ascii"
    . "$dir/venv/bin/activate"
    $dir/img2ascii.py $*
)

# out input after running through figlet, cowsay, lolcat
# requirements
#   - figlet - brew install figlet
#   - cowsay - brew install cowsay
#   - lolcat - brew install lolcat
gay_dragon(){
    local input="$*"
    [[ -z "$input" ]] && input=`cat`
    figlet "$input" | cowsay -nfDragon | lolcat
}

# Segments
# https://github.com/KermitPurple/segments
segments()(
    cd "$CODING_DIR/python/segments"
    . venv/bin/activate
    silent_bg ./main.py
)

# Fractals
# https://github.com/KermitPurple/fractals
fractals()(
    cd "$CODING_DIR/python/fractals"
    . venv/bin/activate
    silent_bg ./main.py
)
#
# polygons
# https://github.com/KermitPurple/consentric_polygons_py
polygons()(
    cd "$CODING_DIR/python/polygons"
    . venv/bin/activate
    silent_bg ./main.py
)

# Use coinbase api to get price of bitcoin
bitcoin_price(){
    local price=`curl -s 'https://api.coinbase.com/v2/prices/spot?currency=USD' |\
        sed 's/.*"amount":"\([^"]*\)".*/\1/g'`
    echo "\$$price"
}

# Functions

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

# fd - cd to selected directory
# http://sourabhbajaj.com/mac-setup/iTerm/fzf.html
fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

# play pygame snake
# repo: git@github.com:KermitPurple/PygameSnake.git
# dir: $CODING_DIR/python/PygameSnake
# branch: mac
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
snake()(
    cd "$CODING_DIR/python/PygameSnake"
    . venv/bin/activate
    silent_bg ./pysnake.py
)

# play pygame tetris
# repo: git@github.com:KermitPurple/PyTetrisV2.git
# dir: $CODING_DIR/python/PyTetrisV2
# branch: mac
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
tetris()(
    cd "$CODING_DIR/python/PyTetrisV2"
    . venv/bin/activate
    silent_bg ./pytetris.py
)

# open pygame graphing app
# repo: git@github.com:KermitPurple/py-graphs.git
# dir: $CODING_DIR/python/graphs
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
graph()(
    cd "$CODING_DIR/python/graphs"
    . venv/bin/activate
    ./interactive.py
)

# Make a new project using a python script
# repo: git@github.com:kermitpurple/AutoProj.git
# dir: $CODING_DIR/python/AutoProj
# branch: mac
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
new()(
    local dir="$CODING_DIR/python/AutoProj"
    . "$dir/venv/bin/activate"
    "$dir/main.py" $*
)

# calls new function then exits
newe(){new $*&&exit}

# clock in/ clock out; timeclock
# repo: git@github.com:KermitPurple/punchclock.git
# dir: $CODING_DIR/python/punchclock
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
clock()(
    cd "$CODING_DIR/python/punchclock"
    . venv/bin/activate
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
# repo: git@github.com:kermitpurple/pypaint
# dir: $CODING_DIR/python/PyPaint
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
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
        local response=""
        while [[ "$response" != 'y' && "$response" != 'n' && "$response" != 'yes' && "$response" != 'no' ]]; do
            echo "Do you want to create a new one(yn)? "
            response=`getch | tr A-Z a-z`
        done
        if [[ "$response" = 'y' ]]; then
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
# repo: git@github.com:KermitPurple/pyRain.git
# dir: $CODING_DIR/python/PyRain
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
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

#get random pictures of dogs
show_dogs(){
    local count=0
    while show_dog; do
        printf "\rDogs shown: %d" $(( ++count ))
        sleep 10
    done
}

# fzf all apps
apps(){
    local app=`find /Applications /System/Applications /System/Library/CoreServices /System/Applications/Utilities -maxdepth 1 -name "*.app" ! -path "*.app/*" | sed 's/\.app//;s{/.*/{{' | sort | fzf`
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
# repo: git@github.com:KermitPurple/image_to_ascii.git
# dir: $CODING_DIR/python/image_to_ascii
img2ascii()(
    local dir="$CODING_DIR/python/image_to_ascii"
    . "$dir/venv/bin/activate"
    $dir/img2ascii.py $*
)

gif2ascii()(
    delay="$1"
    shift
    [[ -z "$delay" ]] && delay=0.1
    dir="${TMPDIR}gif2ascii-imgs"
    rm -rf "$dir"
    mkdir "$dir"
    for input in *.jpg; do
        output="$dir/$(basename -s ".jpg" "$input").txt"
        img2ascii "$input" -o "$output" "$@"
    done
    while true; do
        for file in "$dir/"*.txt; do
            clear
            cat "$file"
            sleep 0.05
        done
    done
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
# repo: git@github.com:KermitPurple/segments.git
# dir: $CODING_DIR/python/segments
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
segments()(
    cd "$CODING_DIR/python/segments"
    . venv/bin/activate
    silent_bg ./main.py
)

# Fractals
# repo: git@github.com:KermitPurple/fractals.git
# dir: $CODING_DIR/python/fractals
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
fractals()(
    cd "$CODING_DIR/python/fractals"
    . venv/bin/activate
    silent_bg ./main.py
)

# polygons
# repo: git@github.com:KermitPurple/consentric_polygons_py.git
# dir: $CODING_DIR/python/polygons
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
polygons()(
    cd "$CODING_DIR/python/polygons"
    . venv/bin/activate
    silent_bg ./main.py
)

# circle illusion
# repo: git@github.com:KermitPurple/circleillusion.git
# dir: $CODING_DIR/python/circle_illusion
# branch: mac
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
circles()(
    cd "$CODING_DIR/python/circle_illusion"
    . venv/bin/activate
    ./main.py &
)

# Use coinbase api to get price of bitcoin
bitcoin_price(){
    local price=`curl -s 'https://api.coinbase.com/v2/prices/spot?currency=USD' |\
        sed 's/.*"amount":"\([^"]*\)".*/\1/g'`
    echo "\$$price"
}

# todo application
# repo: git@github.com:kermitpurple/todo_rs
# dir: $CODING_DIR/rust/todo_rs
# build: cargo build --release
todo(){
    $CODING_DIR/rust/todo_rs/target/release/todo_rs $*
}

# workout tracker
# repo: git@github.com:KermitPurple/WorkoutTracker.git
# dir: $CODING_DIR/python/workout_tracker
# branch: mac
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
workt()(
    cd "$CODING_DIR/python/workout_tracker"
    . venv/bin/activate
    silent_bg ./gui_workout_tracker.py
)

# weight tracker
# repo: git@github.com:KermitPurple/weight_tracker.git
# dir: $CODING_DIR/python/weight_tracker
# build: virtualenv venv && . venv/bin/activate && pip3 install -r requirements.txt
weightt()(
    cd "$CODING_DIR/python/weight_tracker"
    . venv/bin/activate
    ./main.py
)

# just some easy tools for cmake
# run this to set dir to go to
mk-cmake-tools() {
    proj="$PWD"
    alias proj='cd "$proj"'
    build="$proj/build"
    alias build='mkdir -p "$build" && cd "$build" && cmake .. && make && cd -'
    bin="$build/bin"
    alias bin='build && cd "$bin" 2> /dev/null || cd "$build"'
    alias clean='rm -rf "$build"'
    echo "proj, build, bin, & clean aliases are now set"
    echo "proj, build, & bin variables are now set"
}

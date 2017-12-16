### Startup

CUR_DIR=$(pwd)

if [ -f "$CUR_DIR/.bashrc" ]; then
    source "$CUR_DIR/.bashrc"
fi

if [ -f "$CUR_DIR/.bash_helpers" ]; then
    source "$CUR_DIR/.bash_helpers"
fi

if [ -f "$CUR_DIR/.bash_aliases" ]; then
    source "$CUR_DIR/.bash_aliases"
fi

unset CUR_DIR

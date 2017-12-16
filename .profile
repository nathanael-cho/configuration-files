CUR_DIR=$(pwd)

if [ -f "$CUR_DIR/.bash_profile" ]; then
    source "$CUR_DIR/.bash_profile"
fi

unset CUR_DIR

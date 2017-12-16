CUR_DIR=$(pwd)

if [ -f "${HOME}/.bash_profile" ]; then
    source "${HOME}/.bash_profile"
fi

unset CUR_DIR

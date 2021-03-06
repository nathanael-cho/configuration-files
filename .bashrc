# Check if running interactively
if [ -z "$PS1" ]; then
    return
fi

# Set PATH manually to avoid repetitions in (sub)shells
for f in /etc/paths.d/*; do
    SINGLE=$(cat $f | xargs | perl -pe 'chomp if eof' | tr ' ' ':')
    if [[ -z "$MPATH" ]]; then
        MPATH=$SINGLE
    else
        MPATH=$SINGLE:$MPATH
    fi
done
MPATH="$(cat /etc/paths | perl -pe 'chomp if eof' | tr '\n' ':'):$MPATH"

# Set up `bash-completion`
[ -f "/usr/local/etc/bash_completion" ] &&
    source "/usr/local/etc/bash_completion"

# Set up Conda
MPATH="$MPATH:/Users/Nacho/.miniconda/3/bin"

# Set `emacs` as the default text editor
export EDITOR='emacs'

# Set up Go
export GOROOT='/usr/local/opt/go/libexec'
GOPATH_ONE="$HOME/.go"
GOPATH_TWO="$HOME/Development/problems/go"
export GOPATH="$GOPATH_ONE:$GOPATH_TWO"
MPATH="$GOROOT/bin:$MPATH"
MPATH="$GOPATH_ONE/bin:$GOPATH_TWO/bin:$MPATH"

# Set up Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Set up `ncdu`
export NCDU_SHELL="/usr/local/bin/bash -l"

# Set up Pass
source "/usr/local/etc/bash_completion.d/pass"

# Set up Python
MPATH="/Users/Nacho/Library/Python/3.8/bin:$MPATH"

# Set up `rvm`.
MPATH="$HOME/.rvm/bin:$MPATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Set up `sqlite`
MPATH="/usr/local/opt/sqlite/bin:$MPATH"

MPATH="/usr/local/sbin:$MPATH"

# Set PATH correctly
export PATH=$MPATH && unset MPATH

# OPAM configuration now that PATH is correct
. /Users/Nacho/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# I want the aliases and helpers in all shells
if [ -f "$HOME/.bash_helpers" ]; then
    source "$HOME/.bash_helpers"
fi

if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# Use Ubuntu colors
case "$TERM" in
    xterm-color|xterm-16color|*-256color) COLOR_PROMPT=yes;;
esac
# FORCE_COLOR_PROMPT=yes
if [ -n "$FORCE_COLOR_PROMPT" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	COLOR_PROMPT=yes
    else
	COLOR_PROMPT=
    fi
fi
# Replace the hostname with OSX
if [ "$COLOR_PROMPT" = yes ]; then
    PS1='\[\033[00;35m\]\u@OSX\[\033[00m\]:\[\033[00;35m\]\w\[\033[00m\]\$ '
else
    PS1='\u@OSX:\w\$ '
fi
unset COLOR_PROMPT FORCE_COLOR_PROMPT

eval `gdircolors ~/.dircolors`

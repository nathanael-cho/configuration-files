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
export GOPATH="$HOME/Development/go"
MPATH="$GOROOT/bin:$MPATH"
MPATH="$GOPATH/bin:$MPATH"

# Set up Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Set up `ncdu`
export NCDU_SHELL="/usr/local/bin/bash -l"

# Set up `nvm`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set up Pass
source "/usr/local/etc/bash_completion.d/pass"

# Set up Python
MPATH="/usr/local/opt/python/libexec/bin:$MPATH"

# Set up `rvm`.
MPATH="$HOME/.rvm/bin:$MPATH"

# Set up `sqlite`
MPATH="/usr/local/opt/sqlite/bin:$MPATH"

MPATH="/usr/local/sbin:$MPATH"

# Set PATH correctly
export PATH=$MPATH && unset MPATH

# OPAM configuration now that PATH is correct
. /Users/Nacho/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

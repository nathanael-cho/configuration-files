### Aliases

## Emacs

alias emasc=emacs
alias emcas=emacs
alias emsca=emacs
alias emcs=emacs
alias enw='emacs -nw'
alias eq='emacs -nw -Q'

## General Command-Line Help

alias ag='ag --mmap --path-to-ignore ~/.ignore'
alias agh='ag --hidden'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias curl='/usr/local/opt/curl/bin/curl'
alias gdb='lldb'
alias gti='git'
alias ls='gls -p --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias msql='mysql.server'
alias refresh='cd; reset; exec bash -l'
alias rm='echo You should be using trash'
alias sncdu='sudo ncdu'
alias time='gtime'
alias timeout='gtimeout'
alias ts='trash -s'
alias tsy='trash -sy'

## Homework

alias 153='cd ~/School/CS153/'

## Miscellaneous

alias cleanall='cleantilde; cleands'
alias cleands='sudo find / -name ".DS_Store" -depth -exec rm {} \;'
alias cleantilde='sudo find / -type f -name "*~" -exec rm -f "{}" \;'
alias manualhmmt='cd ~/Dropbox/HMMT\ Archive/Holy\ Manual/'
alias shs='ssh ncho@nice.fas.harvard.edu'
alias textedit='open -a "textEdit"'

## Navigation

alias cl='cd ~/Church\ Life/'
alias conf='cd ~/Development/configuration-files/'
alias dev='cd ~/Development/'
alias pe='cd ~/Development/go/src/project_euler/'
alias prof='cd ~/Professional/'

## Python

alias pdt='echo; python -m \pipdeptree; echo'
alias virtualenv='virtualenv --system-site-packages'
alias va='source activate'
alias da='source deactivate'

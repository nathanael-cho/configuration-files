### Aliases

## Emacs

alias emacs=openemacs
alias emasc=emacs
alias emcas=emacs
alias emsca=emacs
alias emcs=emacs
alias enw='\emacs -nw'

## General Command-Line Help

alias ag='ag --mmap --path-to-ignore ~/.ignore'
alias agh='ag --hidden'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias curl='/usr/local/opt/curl/bin/curl'
alias gdb='lldb'
alias ls='gls -p --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias msql='mysql.server'
alias refresh='cd; reset; exec bash -l'
alias rm='echo You should be using trash'
alias sncdu='sudo ncdu'
alias time='gtime'

## Homework

alias 181='cd ~/School/181/'
alias 181ts='cd ~/School/181/cs181-s18-homeworks-nathanael-cho/'
alias 123='cd ~/School/123/'
alias 123ps='cd ~/School/123/psets/'

## Miscellaneous

alias athena='ssh ncho97@athena.dialup.mit.edu'
alias cleanall='cleantilde; cleands'
alias cleands='sudo find / -name ".DS_Store" -depth -exec rm {} \;'
alias cleantilde='sudo find / -type f -name "*~" -exec rm -f "{}" \;'
alias textedit='open -a "textEdit"'

## Navigation

alias cl='cd ~/Church\ Life/'
alias conf='cd ~/Development/configuration-files/'
alias dev='cd ~/Development/'
alias pe='cd ~/.go/src/project_euler/'
alias prof='cd ~/Professional/'

## Python

alias pipdeptree='echo You should be using pdt[version number]'
alias pdt2='echo; python2 -m \pipdeptree; echo'
alias pdt3='echo; python3 -m \pipdeptree; echo'
alias virtualenv='virtualenv --system-site-packages'
alias va='source activate'
alias da='source deactivate'

### Aliases

## Emacs

alias emacs=openemacs
alias emasc=emacs
alias emcas=emacs
alias emcs=emacs
alias enw='\emacs -nw'

## General Command-Line Help

alias ag='ag --mmap --path-to-ignore ~/.ignore'
alias agh='ag --hidden'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias conf='cd ~/Development/configuration-files/'
alias curl='/usr/local/opt/curl/bin/curl'
alias dev='cd ~/Development/'
alias gdb='lldb'
alias ls='gls -p --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias msql='mysql.server'
alias rm='echo You should be using trash'
alias sncdu='sudo ncdu'
alias time='gtime'

## Homework

alias 61='cd ~/Desktop/CS61/'
alias 61ps='cd ~/Desktop/CS61/cs61-f17-psets-nacho/'

### Miscellaneous

alias athena='ssh ncho97@athena.dialup.mit.edu'
alias cleanall='cleantilde; cleands'
alias cleands='sudo find / -name ".DS_Store" -depth -exec rm {} \;'
alias cleantilde='sudo find / -type f -name "*~" -exec rm -f "{}" \;'
alias pe='cd ~/.go/src/project_euler/'
alias textedit='open -a "textEdit"'

## Python

alias da='deactivate'
alias pipdeptree='echo You should be using pdt[version number]'
alias pdt2='echo; python2 -m \pipdeptree; echo'
alias pdt3='echo; python3 -m \pipdeptree; echo'
alias va='if [ -f bin/activate ]; then source bin/activate; fi'
alias virtualenv='virtualenv --system-site-packages'

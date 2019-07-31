# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# not compatible with fish
#alias ~="cd ~"
alias ag='ag --pager $PAGER'
alias bak='backup'
alias cpp='cp --parent'
alias df='df --human-readable'
alias du='du --human-readable'
alias free='free --human'
alias gclone='git-clone-plus-plus'
alias gpgcs='killall gpg-agent ; gpg --card-status'
alias h='history'
alias hg='history | grep'
alias moon='curl https://wttr.in/Moon'
alias la='ls -A'
alias ll='ls -l --time-style="+%F %a %T"'
alias lla='ll -A'
alias ls='ls -CF --human-readable --color=auto'
alias lsa='la'
alias mkcdtmp='cd (mktemp -d)'
alias rmrf='rm -rf'
alias shutdown='sudo shutdown -h -P now'
# using user aliases when sudoing (does not work for functions; only aliases)
alias sudo='sudo '
alias weather='curl https://wttr.in/Lille'
alias x='exit'

alias ll='ls -laG'
alias k='kubectl'

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.git-prompt.sh

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

PS1='\e[33;1m\u@\h: \e[31m\w\e[0m\ $(__git_ps1 " (%s)")\n\$ '

alias ll='ls -laG'
alias k='kubectl'
# Use GNU core utilities
alias timeout=gtimeout
alias date=gdate
alias cp=gcp

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.git-prompt.sh

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export HISTCONTROL=ignoredups

export KUBECTL_EXTERNAL_DIFF=meld # kube diff using Meld

PS1='\n\e[33;1m\u@\h: \e[31m\w \e[0m $(__git_ps1 " (%s)")\n\$ '
HISTTIMEFORMAT="%F %T "

# kubectl autocomplete
source /opt/homebrew/Cellar/bash-completion@2/2.11/share/bash-completion/bash_completion
complete -o default -F __start_kubectl k

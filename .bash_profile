# ALIASES #########################################################################################
alias ll='ls -laG'
alias k='kubectl'
# Use GNU core utilities
alias timeout=gtimeout
alias date=gdate
alias cp=gcp


# SHELL PROMPT ####################################################################################
PS1='\[\e[1;31m\]\w \[\e[1;32m\]$(__git_ps1 "(%s)")\[\e[0m\]\$ '
source ~/.git-prompt.sh


# HISTORY #########################################################################################
export HISTCONTROL=ignoredups
HISTTIMEFORMAT="%F %T "


# GO ##############################################################################################
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


# HOMEBREW ########################################################################################
eval "$(/opt/homebrew/bin/brew shellenv)"


# K8s #############################################################################################
export KUBECTL_EXTERNAL_DIFF=diffmerge # kube diff using DiffMerge
# kubectl autocomplete
source /opt/homebrew/Cellar/bash-completion@2/2.11/share/bash-completion/bash_completion
# alternatively use this source:
# source .kube/kubectl_autocompletion
complete -o default -F __start_kubectl k


# FUNCTIONS #######################################################################################
# Check certificates
function certp() {
  if (( $# == 0 )) ; then
    openssl x509 -in /dev/stdin -text -noout
  else
    openssl x509 -in $1 -text -noout
  fi
}
# Usage:
# kubectl get secret <secret> -o json | jq -r '."data"."tls.crt"' | base64 -d | certp | rg Not

# Open github at the current page
alias open-git='cur=$(pwd); base=$(basename `git rev-parse --show-toplevel`); open $(echo $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/    https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )${cur#*$base})'
# Usage (while in a git repo dir):
# open-git

# ALIASES #########################################################################################
alias ll='ls -laG'
alias k='kubectl'
alias v='nvim'

if [ "$(uname -s)" == "Darwin" ]; then
  # Use GNU core utilities
  alias timeout=gtimeout
  alias date=gdate
  alias cp=gcp
fi

# SHELL PROMPT ####################################################################################
PS1='\[\e[33m\]\w \[\e[2m\]$(__git_ps1 "(%s)")\[\e[0m\]\n\$ '
source ~/.git-prompt.sh


# HISTORY #########################################################################################
export HISTCONTROL=ignoredups
HISTTIMEFORMAT="%F %T "


# GO ##############################################################################################
export GOPATH=$HOME/go
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
if command -v brew &> /dev/null; then
    export GOROOT="$(brew --prefix golang)/libexec"
fi


# HOMEBREW ########################################################################################
if command -v brew &> /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# K8s #############################################################################################
export KUBECTL_EXTERNAL_DIFF=diffmerge # kube diff using DiffMerge
# kubectl autocomplete
if command -v brew &> /dev/null; then
  source /opt/homebrew/Cellar/bash-completion@2/2.11/share/bash-completion/bash_completion
fi
# alternatively use this source:
# source ~/.kube/kubectl_autocompletion
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

# Custom commands
# Open github page for current branch and dir
alias git-open='cur=$(pwd); base=$(basename `git rev-parse --show-toplevel`); open $(echo $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/    https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )${cur#*$base})'
# Recreate current branch after fetching master
alias git-branch-reset='branch=$(git rev-parse --abbrev-ref HEAD); git checkout master; \
  git branch -D ${branch}; git pull; git checkout -b ${branch}'

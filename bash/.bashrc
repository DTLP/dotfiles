# ALIASES #########################################################################################
alias ll='ls -la --color=always'
alias tf='terraform'
alias v='nvim'

if [ "$(uname -s)" == "Darwin" ]; then
  # Use GNU core utilities on macOS (requires coreutils).
  alias timeout=gtimeout
  alias date=gdate
  alias cp=gcp
fi

# NEOVIM ##########################################################################################
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

if command -v nvim &>/dev/null; then
  export EDITOR="nvim"
fi

# SHELL PROMPT ####################################################################################
PS1='\[\e[33m\]\w \[\e[2m\]$(__git_ps1 "(%s)")\[\e[0m\]\n\$ '
source ~/.git-prompt.sh

# Directory colours
export LS_COLORS="di=0;33"

# HISTORY #########################################################################################
export HISTCONTROL=ignoredups
HISTTIMEFORMAT="%F %T "

# SSH #############################################################################################
#if ! ssh-add -l >/dev/null 2>&1; then
#  eval "$(ssh-agent -s)" >/dev/null
#  ssh-add ~/.ssh/id_ed25519
#fi

# GO ##############################################################################################
export GOPATH=$HOME/go
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH=$PATH:/usr/local/go/bin

if command -v brew &>/dev/null; then
  export GOROOT="$(brew --prefix golang)/libexec"
fi

# HOMEBREW ########################################################################################
if command -v brew &>/dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# K8s #############################################################################################
alias k='kubectl'

if command -v difft &>/dev/null; then
  export KUBECTL_EXTERNAL_DIFF=difft # kube diff using Difftastic
fi
# kubectl autocomplete
if command -v brew &>/dev/null; then
  source /opt/homebrew/Cellar/bash-completion@2/2.11/share/bash-completion/bash_completion
elif [[ -f ~/.kube/kubectl_autocompletion ]]; then
  source ~/.kube/kubectl_autocompletion
fi
complete -o default -F __start_kubectl k 2>/dev/null || true

# opencode ########################################################################################
export PATH=$HOME/.opencode/bin:$PATH
alias oc='opencode'

## ARGO CD ########################################################################################
# Turns Argo on/off in Namespaces
# $1 cluster
# $2 namespace
# $3 on/off/hard-refresh/status switch
argoctl() {
  if [[ -z $1 || -z $2 || -z ${3:-} ]]; then
    echo "Usage: argoctl CLUSTER NAMESPACE {on|off|hr|hard-refresh}"
    return 1
  fi

  case "$3" in
  'on')
    kubectl --context "$1" -n "$2" patch --type='merge' applications.argoproj.io "$2" -p '{"spec":{"syncPolicy":{"automated":{"prune":true,"selfHeal":true}}}}'
    ;;
  'off')
    kubectl --context "$1" -n "$2" patch --type='merge' applications.argoproj.io "$2" -p '{"spec":{"syncPolicy":{"automated":null}}}'
    ;;
  'hr' | 'hard-refresh')
    kubectl --context "$1" -n "$2" annotate app "$2" 'argocd.argoproj.io/refresh=hard' --overwrite
    ;;
  'status')
    if kubectl --context "$1" -n "$2" get applications.argoproj.io "$2" -o jsonpath='{.spec.syncPolicy.automated}' | grep -q .; then echo "Enabled"; else echo "Disabled"; fi
    ;;
  *)
    echo "Invalid option: $3"
    echo "Usage: argoctl CLUSTER NAMESPACE {on|off|hr|hard-refresh}"
    return 1
    ;;
  esac
}

# NEOVIM ##########################################################################################
# export PATH="$PATH:/opt/nvim-linux64/bin"
export GIT_EDITOR="nvim"

# POP!_OS #########################################################################################
if grep -q 'Pop!_OS' /etc/os-release; then
  # Black screen fix - https://askubuntu.com/questions/1408394
  xset -dpms
fi

# TALOS ###########################################################################################
[[ -f ~/.talos/talosctl_autocompletion ]] && source ~/.talos/talosctl_autocompletion

# FUNCTIONS #######################################################################################
# Check certificates
function certg() {
  if (($# == 0)); then
    echo "Usage: certg HOST" >&2
    return 1
  fi
  local host="$1"
  openssl s_client -showcerts -connect "${host}:443" </dev/null | openssl x509 -text
}
## Usage:
## $ certg google.com 2>/dev/null | rg After
function certp() {
  if (($# == 0)); then
    openssl x509 -in /dev/stdin -text -noout
  else
    local cert="$1"
    openssl x509 -in "${cert}" -text -noout
  fi
}
## Usage:
## $ kubectl get secret <secret> -o json | jq -r '."data"."tls.crt"' | base64 -d | certp | rg Not

# CUSTOM COMMANDS #################################################################################
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Open the repo page for the current branch and directory
function git-open() {
  local opener url branch relpath
  if command -v open &>/dev/null; then
    opener="open"
  elif command -v xdg-open &>/dev/null; then
    opener="xdg-open"
  else
    echo "git-open: no browser opener found (open/xdg-open)" >&2
    return 1
  fi

  url="$(git config --get remote.origin.url)"
  case "$url" in
  git@*)
    url="${url#git@}"
    url="https://${url/:/\/}"
    ;;
  git://*)
    url="https://${url#git://}"
    ;;
  esac
  url="${url%.git}"

  branch="$(git symbolic-ref --quiet --short HEAD)"
  toplevel="$(git rev-parse --show-toplevel)"
  relpath="${PWD#"$toplevel"}"
  relpath="${relpath#/}"
  [[ -n "$relpath" ]] && relpath="/${relpath}"

  "$opener" "${url}/tree/${branch}${relpath}"
}

# Switch to the default branch and remove the current one
# Usage: git-branch {delete|reset}
function git-branch() {
  local main branch
  main="$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')"
  branch="$(git rev-parse --abbrev-ref HEAD)"

  case "$1" in
  delete)
    git checkout "${main}"
    git branch -D "${branch}"
    git pull
    ;;
  reset)
    git checkout "${main}"
    git branch -D "${branch}"
    git pull
    git checkout -b "${branch}"
    ;;
  *)
    echo "Usage: git-branch {delete|reset}" >&2
    return 1
    ;;
  esac
}

# OTHER ###########################################################################################
## protontricks
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'

set -g pure_symbol_prompt "\$"

# EXPORTS
export ENHANCD_FILTER=fzf

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Shortcuts
alias x="exit"
alias hc="history -c"
alias j="just"
alias sz="omf reload"

# rebind classics
#alias cat="bat"
#alias ls="lsd"
#alias vim="nvim"
#alias rm="rip"
#alias time="hyperfine"

# tools
alias trust-ssh="ssh -o UserKnownHostsFile=/dev/null -T $1 /bin/bash -i"

# github
alias commit="git commit -am \"$1\""
alias pull="git fetch && git pull"
alias fetch="git fetch"
alias ga="git add"
alias gc="git commit"
alias gcm="gc -m"
alias gk="git checkout"
alias gm="git merge"
alias gf=fetch
alias gp=pull
alias gst="git status"
alias gsh="git show"


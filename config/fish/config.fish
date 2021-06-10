# ex: set syntax=fish:

set -g pure_symbol_prompt "\$"
starship init fish | source

# EXPORTS
export ENHANCD_FILTER=fzf
export VISUAL="emacs -nw"
export EDITOR="$VISUAL"
export PPID=(ps --no-header -p $fish_pid -o ppid | grep -o "[0-9]*")
export TERM="xterm-256color"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"

# Shortcuts
alias x="exit"
alias hc="history -c"
alias j="just"
alias sz="omf reload"
alias mirrors_update="sudo pacman-mirrors --fasttrack"
alias emacs="emacs -nw"

# rebind classics
alias findfile="$HOME/.cargo/bin/fd"

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

source ~/.asdf/asdf.fish

# 1Password
function 1pass
  eval (op signin my)
end

function fish_greeting
  fortune -os
end

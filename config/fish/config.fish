set -g pure_symbol_prompt "\$"

# EXPORTS
export ENHANCD_FILTER=fzf
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERM="xterm-256color"
export GPG_TTY=(tty)
export REVIEW_BASE="dev"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/share/android-sdk/build-tools/29.0.3:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"

# Shortcuts
alias x="exit"
alias hc="history -c"
alias j="just"
alias sz="omf reload"

# rebind classics
alias cat="bat"
#alias ls="lsd"
alias vim="nvim"
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

set -g fish_user_paths "/usr/local/opt/texinfo/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

source (brew --prefix asdf)/asdf.fish

starship init fish | source

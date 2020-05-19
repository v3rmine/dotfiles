set -g pure_symbol_prompt "\$"

# EXPORTS
export ENHANCD_FILTER=fzf
export VISUAL=nvim
export EDITOR="$VISUAL"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Users/kuro/.pyenv/versions/3.7.7/bin:$PATH"

export PATH="/usr/local/opt/llvm/bin:$PATH"
#export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
#export PATH="/usr/local/opt/ruby/bin:$PATH"
export CHROME_PATH=/Applications/Chromium.app/Contents/MacOS/Chromium
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/kuro/.pyenv/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

# Shortcuts
alias x="exit"
alias hc="history -c"
alias j="just"
alias sz="omf reload"

# rebind classics
#alias cat="bat"
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

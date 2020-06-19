# ex: set syntax=fish:

set -g pure_symbol_prompt "\$"
starship init fish | source

# EXPORTS
export ENHANCD_FILTER=fzf
export VISUAL=nvim
export EDITOR="$VISUAL"
export PPID=(ps --no-header -p $fish_pid -o ppid | grep -o "[0-9]*")
export TERM="xterm-256color"

# PATH
export PATH="$HOME/.local/bin:$PATH"
#export PATH="$HOME/.nimble/bin:$PATH"

# Shortcuts
alias x="exit"
alias hc="history -c"
alias j="just"
alias sz="omf reload"

# rebind classics
#alias cat="bat"
#alias ls="lsd"
alias vim="nvim"
alias findfile="$HOME/.cargo/bin/fd"
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

source ~/.asdf/asdf.fish

# Snapshot
if not [ -d /btrfs/snaps/(date -I) ]
  sudo btrfs subvolume snapshot -r / /btrfs/snaps/(date -I)
end

# Blur {{{
#if test $DISPLAY
  #if test (ps --no-header -p $PPID -o comm | grep -E '^(yakuake|kitty)$')
    #for wid in (xdotool search --pid $PPID)
      #xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
    #end
  #end
#end
# }}}

# Yarn
#set -U fish_user_paths "./node_modules/.bin" $fish_user_paths

# 1Password
function 1pass
  eval (op signin my)
end

function fish_greeting
  fortune -os
end

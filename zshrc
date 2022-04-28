#!/bin/bash
# colors
bold="\033[1m"
red="\033[31m"
reset="\033[0m"

# imports
source "$HOME/.profile"

if [ ! -d "$HOME/.local" ]; then mkdir "$HOME/.local"; fi

export TERM="xterm-kitty"
export SHELL="zsh"

# --- Cross platform management ---
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export ALTERNATE_EDITOR=''
  # @TODO: Need to fix first file loading using emacsclient E.G git commit
  # export EDITOR="emacsclient -t"
  export EDITOR="emacs -nw"
  export VISUAL="$EDITOR"
fi

# Imports bash utils
source "$DOTFILES_PATH/install-scripts/functions-utils.bash"

# --- Rebinds ---
# upgrade
function sudo() {
    printf "${bold}sudo${reset} ${red}%s${reset}\n" "$*";
    if [[ "$1" == "rm" ]]; then
        REPLY=$(bash -c 'read -p "Are you sure? [y/n] " -n 1 -r; echo $REPLY')
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            return 1
        fi
    fi
    /usr/bin/sudo $@;
}

# shortcuts
alias findfile="$HOME/.cargo/bin/fd"
alias sz="source $HOME/.zshrc"
function trust-ssh() { ssh -o UserKnownHostsFile=/dev/null -T "$1" /bin/bash -i }

function just-me() {
  resp=$(
    curl -sL --fail \
      "https://api-prod.downfor.cloud/httpcheck/$1" \
      --user-agent 'Mozilla/5.0'
  )
  if [ "$?" -ne 0 ]; then
    echo "Meeeh your shitty internet seems down (curl failed)"
    return 1
  fi

  if echo "$resp" | grep '"isDown":true' > /dev/null; then
    echo "It's not just you $1 is dead for everyone!"
  else
    echo "It's just you and your shitty computer $1 is up"
  fi
}

function fdp() {
  fd --color 'always' | sk --ansi --header='[find:print]' --preview 'bat --color "always" {}'
}

function rdp() {
  sk --ansi --header='[ripfind:print]' --cmd 'rg --column --line-number --no-heading --color=always .' --delimiter ':' --nth '4..' --preview 'bat -f -H $(echo {} | cut -d: -f2) $(echo {} | cut -d: -f1)' | cut -d: -f1-3
}

function fp() {
  local loc=$(echo $PATH | sed -e $'s/:/\\\n/g' | eval "sk ${FZF_DEFAULT_OPTS} --header='[find:path]'")

  if [[ -d $loc ]]; then
    echo "$(rg --files $loc | rev | cut -d"/" -f1 | rev)" | eval "sk ${FZF_DEFAULT_OPTS} --header='[find:exe] => ${loc}' >/dev/null"
    fp
  fi
}

function kp() {
  local pid=$(ps -ef | sed 1d | eval "sk ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
    kp
  fi
}

# CPE
function gccpe() { gcc "$1" -o "$2" -Wall -Wextra -g }

# ls
alias ls="${CUSTOM_LS:-lsd}"
alias ll="ls -l"
alias la="ls -al"
alias lh="ls -alh"
alias l="ls"

# Emacs
alias ec="emacsclient"
alias ecw="emacsclient -t"
alias ecc="emacsclient -c"
alias eccw="emacsclient -c -t"

# git
alias ga="git add"
alias gc="git commit"
alias gcm="gc -m"
alias gk="git checkout"
alias gkk="git branch | sk | xargs git checkout"
alias gm="git merge"
alias gb="git branch"
alias gf="git fetch"
alias gp="git pull"
function gPu () { git push -u origin $(git branch | grep '^\*' | sed -E 's/( |\*)//g') }
function gBu () { git branch --set-upstream-to="origin/$(git branch | grep '^\*' | sed -E 's/( |\*)//g')" $(git branch | grep '^\*' | sed -E 's/( |\*)//g') }
alias gst="git status"
alias gsh="git show"
alias gl="git log"
alias gd="git diff --minimal -B -M -C --color-moved=zebra"
alias gsl="git stash list"
alias gsa="git-stash-apply"
alias gs="git stash"

# --- Colored LESS E.G for man ---
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# --- Kitty (https://github.com/kovidgoyal/kitty/issues/610) ---
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

# --- ASDF ---
ASDF_PATH="$HOME/.asdf/asdf.sh"
if [ -f "$ASDF_PATH" ]; then
  source "$ASDF_PATH"
  fpath=(${ASDF_DIR}/completions $fpath)
  export PATH="$PATH:$ASDF_USER_SHIMS"
fi

# Support bash completions
autoload bashcompinit
bashcompinit

# ZSH Completions
autoload -Uz compinit
compinit

# --- Antigen ---
ANTIGEN_PATH="$HOME/.local/antigen.zsh"
if [ ! -f "$ANTIGEN_PATH" ]; then
  curl -L git.io/antigen > "$ANTIGEN_PATH"
fi
source "$ANTIGEN_PATH"

# plugins
antigen bundle mfaerevaag/wd
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle hlissner/zsh-autopair
antigen bundle Aloxaf/fzf-tab

# zsh-users
antigen bundle zsh-users/zsh-completions
# Last one !important
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# --- Sources ---
if test_command starship -h; then
  eval "$(starship init zsh)"
fi
if test_command navi -h; then
  export NAVI_FZF_OVERRIDES='--height 3'
  eval "$(navi widget zsh)"
fi

# --- Key rebind ---
# del
bindkey "^[[3~" delete-char
# os-left
bindkey "^[[1;9D" beginning-of-line
bindkey "^[[H" beginning-of-line
# os-right
bindkey "^[[1;9C" end-of-line
bindkey "^[[F" end-of-line
# ctrl-left
bindkey "^[[1;5D" emacs-backward-word
# ctrl-right
bindkey "^[[1;5C" emacs-forward-word
# ctrl-c
bindkey "^C" kill-whole-line
# ctrl-backspace
bindkey "^H" backward-delete-word
# fish search up
bindkey "^[[A" history-substring-search-up
# fish search down
bindkey "^[[B" history-substring-search-down

# --- ZSH ---
# Default: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS="*?_.~&;!#$%^"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
setopt inc_append_history
# Highlights
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
export ZSH_HIGHLIGHT_PATTERNS=('rm *\*' 'fg=white,bold,bg=red')

# DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="true"
export ENABLE_CORRECTION="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

bashcompinit
compinit

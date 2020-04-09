# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kuro/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
DEFAULT_USER="$USER"
ZSH_THEME="bira"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm *' 'fg=white,bold,bg=red')
#ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

VSCODE=code-insiders
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(poetry git wd brew cargo npm rust vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# shortcuts
alias x="exit"
alias sz="source ~/.zshrc"
alias hc="history -c"
alias j="just"

# rebind classics
alias cat="bat"
alias ls="lsd"
alias vim="nvim"
alias rm="rip"
alias time="hyperfine"
alias archive="eval export $(grep -v '^#' $HOME/Git/dotfiles/archive.conf); $HOME/Git/archive/ArchiveBox/archive"

# tools
alias disneyplus="echo jasonawilhite@gmail.com:Macy2005"
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

#Include Z
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

source /usr/local/share/antigen/antigen.zsh
source /Users/kuro/.profile
export PATH="/usr/local/opt/openssl/bin:$PATH"

# opam configuration
test -r /Users/kuro/.opam/opam-init/init.zsh && . /Users/kuro/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export CHROME_PATH=/Applications/Chromium.app/Contents/MacOS/Chromium
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH="/Users/kuro/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

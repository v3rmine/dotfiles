export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/brave

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export GOPATH="$(go env GOPATH)"

export TERM="xterm-256color"
export ZSH="/usr/share/oh-my-zsh"
export DOWNGRADE_FROM_ALA=1

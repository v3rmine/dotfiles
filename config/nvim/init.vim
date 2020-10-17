" Plugins list
source $HOME/.config/nvim/plugins.vimrc
" Settings neovim
source $HOME/.config/nvim/global.vimrc
" Settings for simple plugins
source $HOME/.config/nvim/settings-plugins.vimrc
" Config for each lang
source $HOME/.config/nvim/languages.vimrc

" lua/init.lua
lua require 'init'
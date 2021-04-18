#!/bin/sh

# Install vim-plug, See: https://github.com/junegunn/vim-plug#neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
   --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Vim plugins
nvim +'PlugInstall --sync' +qall

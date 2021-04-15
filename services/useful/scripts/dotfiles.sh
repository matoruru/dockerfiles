#!/bin/sh

mkdir -p ~/github/matoruru
cd ~/github/matoruru
git clone https://github.com/matoruru/dotfiles
cd dotfiles

find .* -maxdepth 0 -type f | xargs -I{} ln -sr {} ~/

mkdir ~/.config
find .config/ -mindepth 1 -maxdepth 1 -type d | xargs -I{} mkdir ~/{}

find .config/ -maxdepth 2 -type f | xargs -I{} ln -sr {} ~/{}

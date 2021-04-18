#!/bin/sh

mkdir -p ~/github/matoruru
cd ~/github/matoruru
git clone https://github.com/matoruru/dotfiles
cd dotfiles || exit 1

git remote -v

echo "Replace https with ssh"
git remote -v | head -n1 | cut -f2 | cut -d' ' -f1 | \
    sed 's/^https:\/\/github.com\//git@github.com:/' | \
    xargs git remote set-url origin

git remote -v

echo ~/.bash_profile ~/.bashrc | xargs -n1 | xargs -I{} mv {} {}.old

find .* -maxdepth 0 -type f | xargs -I{} ln -sr {} ~/

mkdir ~/.config
find .config/ -mindepth 1 -maxdepth 1 -type d | xargs -I{} mkdir ~/{}

find .config/ -maxdepth 2 -type f | xargs -I{} ln -sr {} ~/{}

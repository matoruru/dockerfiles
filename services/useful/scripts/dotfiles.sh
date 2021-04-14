#!/bin/sh

mkdir -p ~/github/matoruru
cd ~/github/matoruru
git clone https://github.com/matoruru/dotfiles
cp dotfiles/* ~/
cp dotfiles/.* ~/
cp -r dotfiles/.config ~/

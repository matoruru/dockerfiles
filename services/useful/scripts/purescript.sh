#!/bin/sh

# see:
# - https://aur.archlinux.org/packages/ncurses5-compat-libs/
# - https://github.com/purescript/documentation/issues/119
if [ -f /usr/lib/libtinfo.so.6 ]; then
  sudo ln -s /usr/lib/libtinfo.so.{6,5}
fi

# Install PureScript
yarn global add \
  purescript \
  spago \
  pulp \
  bower

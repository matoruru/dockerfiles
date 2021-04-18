#!/bin/sh

# Install coc extensions
nvim +'CocInstall -sync \
  coc-tsserver \
  coc-json \
  coc-css \
  coc-sh \
  coc-vimlsp \
  ' +qall

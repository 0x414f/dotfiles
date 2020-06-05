#!/usr/bin/env bash

set -e

mkdir -p ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
fi

nvim --headless +PlugUpdate +qall
nvim --headless +PlugClean +qall

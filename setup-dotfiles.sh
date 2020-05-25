#!/usr/bin/env bash

set -e

DIR=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

ln -sf $DIR/.aliases ~/.aliases
ln -sf $DIR/.exports ~/.exports
ln -sf $DIR/.functions ~/.functions
ln -sf $DIR/.path ~/.path
ln -sf $DIR/.prompt ~/.prompt
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.zshrc ~/.zshrc
ln -sf $DIR/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

mkdir -p ~/.config/nvim/
ln -sf $DIR/.config/nvim/init.vim ~/.config/nvim/init.vim

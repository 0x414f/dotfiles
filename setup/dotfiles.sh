#!/usr/bin/env bash

set -e

DIR=$(cd -P -- "$(dirname -- "$0")/.." && printf '%s\n' "$(pwd -P)")
DOT="$DIR/dot"

# No thank you
touch ~/.hushlogin

ln -sf $DOT/aliases ~/.aliases
ln -sf $DOT/exports ~/.exports
ln -sf $DOT/functions ~/.functions
ln -sf $DOT/path ~/.path
ln -sf $DOT/prompt ~/.prompt
ln -sf $DOT/tmux.conf ~/.tmux.conf
ln -sf $DOT/vimrc ~/.vimrc
ln -sf $DOT/zshrc ~/.zshrc
ln -sf $DOT/gitignore ~/.gitignore
ln -sf $DOT/gitconfig ~/.gitconfig

CODE_DIR="$HOME/Library/Application Support/Code/User"

mkdir -p $CODE_DIR

ln -sf $DOT/settings.json "$CODE_DIR/settings.json"
ln -sf $DOT/keybindings.json "$CODE_DIR/keybindings.json"

# Why the hell are the symlinks becoming executable?
chmod -h -x "$CODE_DIR/settings.json"
chmod -h -x "$CODE_DIR/keybindings.json"

mkdir -p ~/.config/nvim/
ln -sf $DOT/init.vim ~/.config/nvim/init.vim

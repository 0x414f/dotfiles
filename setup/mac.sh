#!/usr/bin/env bash

set -e
sudo -v

hash gcc 2>/dev/null || {
  echo >&2 "You need to install Xcode"
  exit 1
}

hash brew 2>/dev/null || {
  echo >&2 "You need to install Homebrew"
  exit 1
}

echo 'Bundling brew...'
brew bundle --no-lock

echo 'Finishing fzf installation...'
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-update-rc --no-bash

echo 'Installing node...'
eval "$(fnm env)"
fnm install 15
fnm default 15

echo 'Setting up VSCode...'
source setup/vscode.sh

echo 'Linking dotfiles...'
source setup/dotfiles.sh

echo 'Setting preferences...'
source setup/defaults.sh

echo 'Setting up Neovim...'
source setup/vim.sh

echo 'Setting up Zsh...'
source setup/zsh.sh

echo 'Updating ~/.bin...'
source setup/bin.sh

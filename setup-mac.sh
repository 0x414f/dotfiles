#!/usr/bin/env bash

set -e

DIR=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

# Brewfile
brew update
brew bundle
brew cleanup

source setup-dotfiles.sh

# Zsh
antibody bundle < $DIR/.zsh_plugins > ~/.zsh_plugins
antibody update

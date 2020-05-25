#!/usr/bin/env bash

set -e

DIR=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

echo 'Bundling brew...'
brew update
brew bundle
brew cleanup
echo

echo 'Linking dotfiles...'
source setup-dotfiles.sh
echo

echo 'Bundling zsh plugins...'
antibody bundle < $DIR/.zsh_plugins > ~/.zsh_plugins
antibody update
echo

echo 'Setting zsh default shell...'
if ! grep -q '/usr/local/bin/zsh' '/etc/shells'; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

if [[ "$SHELL" != '/usr/local/bin/zsh' ]]; then
  chsh -s /usr/local/bin/zsh
fi

#!/usr/bin/env bash

set -e

DIR=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

hash gcc 2>/dev/null || {
  echo >&2 "You need to install Xcode"
  exit 1
}

hash brew 2>/dev/null || {
  echo >&2 "You need to install Homebrew"
  exit 1
}

echo 'Bundling brew...'
brew update
brew bundle
brew cleanup

echo 'Linking dotfiles...'
source setup-dotfiles.sh

echo 'Setting preferences...'
source setup-defaults.sh

echo 'Setting up Neovim...'
source setup-vim.sh

echo 'Bundling zsh plugins...'
# Set lazy load option before zsh-nvm is sourced.
# Not sure if order actually matters.
echo "export NVM_LAZY_LOAD=true" > ~/.zsh_plugins
antibody bundle < $DIR/dot/zsh_plugins >> ~/.zsh_plugins
antibody update

echo 'Setting zsh default shell...'
if ! grep -q '/usr/local/bin/zsh' '/etc/shells'; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

if [[ "$SHELL" != '/usr/local/bin/zsh' ]]; then
  chsh -s /usr/local/bin/zsh
fi

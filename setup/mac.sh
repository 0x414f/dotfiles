#!/usr/bin/env bash
set -e
source setup/util.sh
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
rm -f $DOTFILES_ROOT/Brewfile.lock.json
brew bundle
rm -f $DOTFILES_ROOT/Brewfile.lock.json

echo 'Finishing fzf installation...'
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-update-rc --no-bash

echo 'Installing node...'
export NVM_DIR="$HOME/.nvm"
source /usr/local/opt/nvm/nvm.sh
nvm install node

echo 'Setting up VSCode...'
source setup/vscode.sh

echo 'Linking dotfiles...'
source setup/dotfiles.sh

echo 'Setting preferences...'
source setup/defaults.sh

echo 'Setting up Neovim...'
source setup/vim.sh

echo 'Bundling zsh plugins...'
# Set lazy load option before zsh-nvm is sourced.
# Not sure if order actually matters.
echo "export NVM_LAZY_LOAD=true" > ~/.zsh_plugins
antibody bundle < $DOTFILES_ROOT/dot/zsh_plugins >> ~/.zsh_plugins
antibody update

echo 'Setting zsh default shell...'
if ! grep -q '/usr/local/bin/zsh' '/etc/shells'; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

if [[ "$SHELL" != '/usr/local/bin/zsh' ]]; then
  chsh -s /usr/local/bin/zsh
fi

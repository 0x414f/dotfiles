#!/usr/bin/env zsh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install zsh
brew install bash
brew install gnu-sed
brew install nvim
brew install vim
brew install grep
brew install ripgrep
brew install openssh
brew install tmux
brew install php

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install gs
brew install imagemagick
brew install p7zip
brew install pv
brew install rlwrap
brew install tree
brew install fzf
brew install tldr
brew cask install quicklook-json
brew cask install qlstephen
brew install vbindiff
brew install zopfli
brew install autojump
brew install jq

# Remove outdated versions from the cellar.
brew cleanup

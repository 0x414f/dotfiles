#!/usr/bin/env bash

set -e
sudo -v

# Faster trackpad and mouse
defaults write -g com.apple.trackpad.scaling -int 3
defaults write -g com.apple.mouse.scaling -int 3

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Show file extensions
defaults write -g AppleShowAllExtensions -bool true

# Disable changing file extension warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Auto-hide dock
defaults write com.apple.dock autohide -bool true

# Dock left
defaults write com.apple.dock orientation left

# Smaller dock
defaults write com.apple.dock tilesize -int 32

# Make tab available in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Show ~/Library
chflags nohidden ~/Library

# Disable Spotlight shortcut
/usr/libexec/PlistBuddy \
  -c "Set AppleSymbolicHotKeys:64:enabled false" \
	~/Library/Preferences/com.apple.symbolichotkeys.plist

/usr/libexec/PlistBuddy \
  -c "Set AppleSymbolicHotKeys:65:enabled false" \
	~/Library/Preferences/com.apple.symbolichotkeys.plist

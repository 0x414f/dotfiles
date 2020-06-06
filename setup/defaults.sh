#!/usr/bin/env bash

set -e

# Faster trackpad and mouse
defaults write -g com.apple.trackpad.scaling -int 3
defaults write -g com.apple.mouse.scaling -int 3

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable "Show mirroring options in the menu bar when available"
defaults write com.apple.airplay showInMenuBarIfPresent -bool false

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
defaults write -g AppleKeyboardUIMode -int 3

# Show ~/Library
chflags nohidden ~/Library

pref_edit() {
  /usr/libexec/PlistBuddy -c "$1" ~/Library/Preferences/$2
}

# Disable Spotlight shortcut
pref_edit "Set AppleSymbolicHotKeys:64:enabled false" com.apple.symbolichotkeys.plist
pref_edit "Set AppleSymbolicHotKeys:65:enabled false" com.apple.symbolichotkeys.plist

# Disable dock hiding
pref_edit "Set AppleSymbolicHotKeys:52:enabled false" com.apple.symbolichotkeys.plist

# Disable VoiceOver
pref_edit "Set AppleSymbolicHotKeys:59:enabled false" com.apple.symbolichotkeys.plist

unset -f pref_edit
